<?php
class Tfidf_cosine_model extends CI_Model{

	/*
	 * This model needs a table named allwords
	 * $tablename = 'allwords';
	 * CREATE TABLE allwords (doc_id int(11) NOT NULL, word varchar(50) NOT NULL, count int(11) NOT NULL, `keyword` tinyint(1) NOT NULL DEFAULT '0')
	 */


	private $alldoc_count = 5000;

	function __construct() {
		parent::__construct();
		$alldoc_count = $this->get_no_of_documents();
	}

	/* 
	 * Count total number of documents in the system
	 * @return int total_no_of_docs
	 */
	private function get_no_of_documents(){
		$this->db->select('count(distinct doc_id) as nodocs');
		$this->db->from('allwords');
		$query = $this->db->get()->row();
		return (int)$query->nodocs;
	}

	//////////////////////////////////////// functions to clean and count text to words

	/*
	 * Simple stemmer function to remove words less than 2 characters
	 * Convert string to lower case
	 * don't bother inserting small words like a, an, on, of, to, by etc.
	 * they don't carry any meaning to the text and don't make keywords
	 * TOCHANGE: use lemmatizer algorithm instead of simple stemmer
	 * @param string
	 * @return string
	 */
	private function simple_stemmer($string){
	    $string = strtolower($string);
	    //remove symbols and words less than 2 characters
	    $string = trim( preg_replace("/[^a-z0-9']+([a-z0-9']{1,2}[^a-z0-9']+)*/i", " ", $string ) );
	    return $string;
	}

	/*
	 * Remove blacklisted words from string
	 * excluding words but, the, for, not, from, you, will, was, were etc
	 * But not buy, try, fly, see, eat, sit, run, sex, bed, bet etc
	 * @param string
	 * @return string
	 */
	private function remove_blacklisted_words($string){
		//TOCHANGE: read blacklisted words from database instead defining array here
	    $blackwords = array("'s","n't","the","all","you","for","from","between","and","but","not","was","will","were","are","who","which","why","how","when","this","that","those","these","their","they","has","had","more","most","very","much","can","its","with","into","been","only","need");
	    //TOCHANGE: find method to replace all array at once without foreach loop
	    foreach($blackwords as $bword){
	        $string = str_replace($bword." "," ",$string);
	    }
	    return $string;
	}

	/*
	 * Count word frequency in given string
	 * returns array of $word => $count
	 * @param string
	 * @return array word as word => frequency
	 */
	private function count_word_frequency_in_string($text){
	    return array_count_values(str_word_count($text,1));
	}

	/*
	 * text to stemmed words array
	 * @param string
	 * @return array word as $word => frequency
	 */
	private function text_to_stemmed_words_frequency($text){
		//clean the text
		$text = $this->simple_stemmer($text);
		$text = $this->remove_blacklisted_words($text);
		//count words and construct array ($words as $word=>$freq)
		$words = $this->count_word_frequency_in_string($text);
		//sort array. Not necessary till now. consumes resources
		//arsort($words);
		return $words;
	}

//////////////////////////// functions to insert words to database

	/*
	 * Function to clean text and insert words in it to allwords table
	 * calculate word count, then insert/update individual word with count
	 * @param array words, int doc_id
	 */
	private function insert_words_allwords_table($words,$doc_id){
		//insert each word with count
		foreach($words as $word => $cnt){
			$this->db->query("INSERT INTO allwords (doc_id,word,count) values ($doc_id,'$word',$cnt) ON DUPLICATE KEY UPDATE count = count + $cnt");
		}
	}

	/*
	 * Save generated keyword to databse
	 * @param array $keywords, int doc_id
	 */
	private function save_keywords($keywords,$doc_id){
		foreach($keywords as $key=>$value){
			$this->db->query("UPDATE allwords set keyword=1 where doc_id=$doc_id and word='$value'");
		}
	}

	/*
	 * Save tfidf score to databse
	 * @param array $tfidf, int doc_id
	 */
	private function save_tfidf($tfidf,$doc_id){
		foreach($tfidf as $word=>$value){
			$this->db->query("UPDATE allwords set tfidf='$value' where doc_id=$doc_id and word='$word'");
		}
	}

///////////////////////////// tfidf and keyword generator functions 

	/*
	 * find Documnet frequency df to use in tfidf in tf * log( alldoc_count / df , 2 )
	 * @param string word
	 * @return int
	 */
	private function get_df($word){
		$this->db->select('count(*) as df');
		$this->db->from('allwords');
		$this->db->where('word',$word);
		$query = $this->db->get()->row();
		return (int)$query->df;
	}

	/*
	 * find Term frequency tf; not used in this code
	 * function not required if tf is calculated on the go without using db
	 * @param string word, int $doc_id
	 * @return int tf
	 */
	private function get_tf($word,$doc_id){
		$this->db->select('count as tf');
		$this->db->from('allwords');
		$this->db->where('word',$word);
		$this->db->where('doc_id',$doc_id);
		$query = $this->db->get()->row();
		return (int)$query->tf;
	}

	/*
	 * Find TF-IDF of individual given word tf * log( alldoc_count / df , 2 )
	 * takes input individual word and returns number
	 * @param string word, int tf
	 * @return float tfidf
	*/
	private function calculate_tfidf($word,$tf){
		$tfidf = $tf * log ($this->alldoc_count / $this->get_df($word), 2);
		return $tfidf;
	}

	/*
	 * find tfidf for array of words and sort to find keywords
	 * returns sorted array of $word => $tfidf
	 * @param array words as word => count
	 * @return array words as word => tfidf
	 */
	private function generate_tfidf_array($words){
		foreach($words as $key => $value){
			$words[$key] = $this->calculate_tfidf($key,(int)$value);
		}
		//Now sort the word according to tfidf value
		//For efficiency, we could find top n keywords and discard rest rather than sorting all words
		//not needed for cosine similarity
		//arsort($words);
		return $words;
	}

	/*
	 * Generate keywords from sorted array of $words => $tfidf
	 * returns array with top keywords only with numeric index
	 * @param array words, int number of keywords
	 * @return sliced array
	 *
	private function generate_keywords_tfidf($words,$n=5){
		//TOCHANGE: sort only top n keywords for efficiency for O ( N log n )
		arsort($words);
		return array_keys(array_slice($words,0,$n,1));
	}
	*/

	/*
	 * empty keywords, docs_keywords_link, allwords and allwords table
	 * So that we can store new values
	 */
	private function empty_tfidf_tables(){
		$this->db->query("truncate allwords");
	}

	/* 
	 * Get fulltext for tfidf function.
	 * text for which tfidf is to be generated
	 * @return db object $doc_id => $text
	 */
	private function get_all_text(){		
		$this->db->select('id as doc_id, description as text', FALSE);
		$this->db->from('products');
		$query = $this->db->get();
		return $query->result();
	}

//////////////////regenerate allwords and all keywords when we import documnets

	/*
	 * not necessary if we update allwords table each time we insert doc
	 * necessary if we import database
	 */
	public function regenerate_allwords_table(){
		//first remove all previous data
		$this->empty_tfidf_tables();
		//read all fulltext document from database
		$alldocs = $this->get_all_text();

		//loop through all documents and save individual wrods with count to allwords table
		foreach ($alldocs as $index => $data) {
			$words = $this->text_to_stemmed_words_frequency($data->text);
			$this->insert_words_allwords_table($words,$data->doc_id);
		}
	}

	/*
	 * to get all doc_id from allwords table
	 * @return db object doc_id
	 */
	private function get_all_doc_id(){
		$this->db->select('id');
		$this->db->from('products');
		$query = $this->db->get();
		return $query->result();
	}

	/*
	 * get all words for given doc_id
	 * @param int doc_id
	 * @return db object words
	 */
	private function get_all_words_for_doc_id($doc_id){
		$this->db->select('word,count');
		$this->db->from('allwords');
		$this->db->where('doc_id',$doc_id);
		//$this->db->order_by('count','desc');
		$query = $this->db->get();
		return $query->result();
	}

	/*
	 * regenerate all keywords
	 */
	public function regenerate_keywords_table(){
		$alldocs = $this->get_all_doc_id();
		foreach ($alldocs as $id => $data) {
			$doc_id=$data->id;
			$data2 = $this->get_all_words_for_doc_id($doc_id);
			$words=array();
			foreach($data2 as $id => $data3){
				$words[$data3->word]=$data3->count;
			}
			$tfidf = $this->generate_tfidf_array($words);
			$this->save_tfidf($tfidf,$doc_id);
		}
	}

	/*
	 * to process keywords for individual docs
	 * updates allwords table and keyword table for individual doc
	 * use this function while saving the doc
	 * @param string
	 */
	public function process_text_keywords($text){
		//generate stemmed words array with frequency from text and insert to db
		$words = $this->text_to_stemmed_words_frequency($text);
		$this->insert_words_allwords_table($words,$doc_id);
		//Generate tfidf Keywords and save
		$keywords = $this->tfidf_keywords($words,$doc_id);
		$this->save_keywords($keywords,$doc_id);
	}




//////////////////////// Cosine Similarity ///////////////////

	/*
	 * Read tfidf data from allwords table
	 * @param int doc_id
	 * @return db object
	 */
	private function read_word_tfidf_doc_id($doc_id){
		$this->db->select('word,tfidf');
		$this->db->from('allwords');
		$this->db->where('doc_id',$doc_id);
		$query = $this->db->get();
		return $query->result();
	}

	/*
	 * Construct a vector of tfidf with word as key and tfidf as float
	 */
	private function create_tfidf_vector($input){
		$vector = array();
		foreach($input as $key => $value){	
			$vector[$value->word] = (float)$value->tfidf;
		}
		return $vector;
	}

	/*
	 * Combine two arrays on key and fill by zero if it does not exist
	 * find max of two and loop 
	 * @param array array1, array array2
	 * @return array arrayResult
	 */
	private function array_combine_zero_fill($a1,$a2,$doc_id){
		$keys = array_flip(array_merge(array_keys($a1), array_keys($a2)));
		foreach($keys as $k=>$v) {
			$result[$k]['doc1'] = isset($a1[$k]) ? $a1[$k] : 0;
			$result[$k]['doc2'] = isset($a2[$k]) ? $a2[$k] : 0;
		}
		return $result;
	}

	/*
	 * Mysql pivot table to combine all vars
	 * alternative better performance solution
	 * Pivots are very bad in performance, use following instead
	 *
	private function read_tfidf_vector_from_db(){
		$alldocs = $this->get_all_doc_id();
		$query = "SELECT word ";
		foreach ($alldocs as $key => $value) {
			$doc_id=(int)$value->id;
			$query = $query.", COUNT(doc_id = ".$doc_id." OR NULL) as concat('d',doc_id)";
		}
		$query .= "FROM   allwords GROUP  BY word";
	}
	*/

	/*
	 * Build Pivot table query to execute it 
	 * new function, works with other values too
	 * words, doc1, doc2, doc3, ....
	 * apple, 12.5, 56.3,  0.6,
	 * banana,11.6,  5.8, 14.2, ...
	 * cherry, 7.2,  7.9,  5.3, ...
	 */
	private function read_tfidf_vector_from_db(){
		$query = $this->db->query("SELECT GROUP_CONCAT(DISTINCT CONCAT('MAX(IF(doc_id = ''',doc_id,''', tfidf, 0)) AS ', concat('d',doc_id))) as q FROM allwords");
		$row = $query->row();
		$query = $this->db->query("SELECT word, ".$row->q." FROM allwords GROUP BY word");
		return $query->result_array();
	}

	/*
	 * Find dot product of two vectors
	 * a . b = ax*bx + ay*by + az*bz
	 * @param array vector1, array vector2
	 * @return floating point number
	 */

	private function dot_product($vector1,$vector2){
		//using php5.3 lambda function
		return array_sum(array_map(function($a,$b) { return $a*$b; }, $vector1, $vector2));
		//using create_function for php>=4 with bad performance
		//return array_sum(array_map(create_function('$a, $b', 'return $a * $b;'), $array1, $array2));
	}

	/*
	 * Find cross product of two vectors
	 * @param array vector1, array vector2
	 * @return array vector
	 */
	private function cross_product($vector1,$vector2){
		return array(1,0.3,5);	
	}

	/*
	 * Find magnitude of a vector
	 * |a| = sqrt(ax^2+ay^2+az^2)
	 * @param array vector
	 * @return floating point number
	 */
	private function magnitude_vector($vector){
		$runsum = 0;
		foreach($vector as $key => $value){
			$runsum += pow($value,2);
		}
		return sqrt($runsum);
	}

	/*
	 * Find cross product of two vectors
	 * cos theta = a . b / |a|*|b|
	 * @param array vector1, array vector2
	 * @return floating point number
	 */
	private function calculate_cosine_similarity($vector1,$vector2){
		return $this->dot_product($vector1,$vector2)/($this->magnitude_vector($vector1)*$this->magnitude_vector($vector2));
	}

	/*
	 * saves teh cosine similarity data to db
	 * @param int doc_id1, int doc_id2, double similarity
	 * @return
	 */
	private function save_cosine_similarity($doc_id1,$doc_id2,$similarity){
		$this->db->query("insert into similarity (doc_id1,doc_id2,similarity) values($doc_id1,$doc_id2,$similarity)");
	}

	/*
	 * Find cosine similarity of all documents
	 * complexity of n^2
	 * @param
	 * @return
	 */
	public function find_cosine_similarity_alldocs(){
		//read all doc id
		$data = $this->read_tfidf_vector_from_db();
		$vector=array();
		$alldocs = $this->get_all_doc_id();
		foreach($alldocs as $key => $value) {
			$doc_id=$value->id;
			$key = 'd'.$doc_id;
			$newArray = array_map(function($var) use(&$key) {
			    return $var[$key];
			}, $data);
			$vector[$key]=$newArray;
		}

		$this->db->query('truncate similarity');
		$result=array();
		$final=array();
		foreach ($alldocs as $key => $value1) {
			$doc_id1 = $value1->id;$key1 = 'd'.$doc_id1;
			foreach ($alldocs as $key => $value2) {
				$doc_id2 = $value2->id;$key2 = 'd'.$doc_id2;
				$similarity = (double)$this->calculate_cosine_similarity($vector[$key1],$vector[$key2]);
				$this->save_cosine_similarity($doc_id1,$doc_id2,$similarity);
				$result[$key.'_'.$key2]=$similarity;
			}
			//arsort($result);
			//echo '<pre>';print_r($result);echo('</pre>');
			//$final = array_merge($final,$result);
			unset($result);
		}
	}
}