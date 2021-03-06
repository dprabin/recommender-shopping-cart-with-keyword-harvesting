<?php
class Tfidf_model extends CI_Model{

	//This model needs a table named allwords
	//$tablename = 'allwords';
	//CREATE TABLE allwords (doc_id int(11) NOT NULL, word varchar(50) NOT NULL, count int(11) NOT NULL, `keyword` tinyint(1) NOT NULL DEFAULT '0')
	//Other table requirements are keywords(id, keywords), docs_keywords_link (id, doc_id,keyword_id)

	//words array to use in different functions
	//$words = array();
	//total document count
	private $alldoc_count = 5000;

	function __construct() {
		parent::__construct();
		$alldoc_count = $this->get_no_of_documents();
		//error_log("all doc count = $alldoc_count",0);
	}

	//Count total number of documents in the system
	public function get_no_of_documents(){
		$this->db->select('count(distinct doc_id) as nodocs');
		$this->db->from('allwords');
		$query = $this->db->get()->row();
		return (int)$query->nodocs;
	}

	//////////////////////////////////////// functions to clean and count text to words

	//Simple stemmer function to remove words less than 2 characters
	//Convert string to lower case
	//don't bother inserting small words like a, an, on, of, to, by etc.
	//they don't carry any meaning to the text and don't make keywords
	//TOCHANGE: use lemmatizer algorithm instead of simple stemmer
	public function simple_stemmer($string){
	    $string = strtolower($string);
	    //remove symbols and words less than 2 characters
	    $string = trim( preg_replace("/[^a-z0-9']+([a-z0-9']{1,2}[^a-z0-9']+)*/i", " ", $string ) );
	    return $string;
	}

	//Remove blacklisted words from string
	//excluding words but, the, for, not, from, was, you, will, was, will, were etc
	//But not buy, try, fly, see, eat, sit, run, sex, bed, bet etc
	public function remove_blacklisted_words($string){
		//TOCHANGE: read blacklisted words from database instead defining array here
	    $blackwords = array("'s","n't","the","all","you","for","from","between","and","but","not","was","will","were","are","who","which","why","how","when","this","that","those","these","their","has","had","more","most","very","much","can","its","with","into","been","only","need");
	    //TOCHANGE: find method to replace all array at once without foreach loop
	    foreach($blackwords as $bword){
	        $string = str_replace($bword." "," ",$string);
	    }
	    return $string;
	}

	//Count word frequency in given string
	//returns array of $word => $count
	public function count_word_frequency_in_string($text){
	    return array_count_values(str_word_count($text,1));
	}

	//text to stemmed words array
	public function text_to_stemmed_words_frequency($text){
		//clean the text
		$text = $this->simple_stemmer($text);
		$text = $this->remove_blacklisted_words($text);
		//count words and construct array ($words as $word=>$freq)
		$words = $this->count_word_frequency_in_string($text);
		//sort array. Not necessary till now. consumes resources
		//arsort($words);
		return $words;
	}

	//////////////////////////////////////// functions to insert words to database

	//Function to clean text and insert words in it to allwords table
	//calculate word count, then insert/update individual word with count
	public function insert_words_allwords_table($words,$doc_id){
		//insert each word with count
		foreach($words as $word => $cnt){
			//var_dump($cnt);die();
			$this->db->query("INSERT INTO allwords (doc_id,word,count) values ($doc_id,'$word',$cnt) ON DUPLICATE KEY UPDATE count = count + $cnt");
		}
	}

	//Save generated keyword to databse
	public function save_keywords($keywords,$doc_id){
		foreach($keywords as $key=>$value){
			$this->db->query("UPDATE allwords set keyword=1 where doc_id=$doc_id and word='$value'");
		}
	}

	/////////////////////////////////////// tfidf and keyword generator functions 

	//find Documnet frequency df to use in tfidf in tf * log( alldoc_count / df , 2 )
	public function get_df($word){
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
	public function get_tf($word,$doc_id){
		$this->db->select('count as tf');
		$this->db->from('allwords');
		$this->db->where('word',$word);
		$this->db->where('doc_id',$doc_id);
		$query = $this->db->get()->row();
		return (int)$query->tf;
	}

	//Find TF-IDF of individual given word tf * log( alldoc_count / df , 2 )
	//takes input individual word and returns number
	public function calculate_tfidf($word,$tf){
		//var_dump($tf);die();
		$tfidf = $tf * log ($this->alldoc_count / $this->get_df($word), 2);
		return $tfidf;
	}

	//find tfidf for array of words and sort to find keywords
	//we don't need to calculate tfidf for every word in words.
	//As $words is already sorted, calculate tfidf of say 
	//25% to 50% of the words for efficiency
	//the lower frequency word generally does not make keyword
	//but very rare word might make tfidf with frequency in about 75th percentile
	//search Google for detailed TFIDF statistics before applying percentile filter
	//returns sorted array of $word => $tfidf
	public function generate_tfidf_array($words){
		foreach($words as $key => $value){
			//var_dump($key);var_dump($value);die();
			$words[$key] = $this->calculate_tfidf($key,(int)$value);
		}
		//Now sort the word according to tfidf value
		//For efficiency, we could find top n keywords and discard rest rather than sorting all words
		arsort($words);
		return $words;
	}

	//Generate keywords from sorted array of $words => $tfidf
	//returns array with top keywords only with numeric index
	public function generate_keywords_tfidf($words,$n){
		//find only top n keywords. The words are keys so we return array keys
		return array_keys(array_slice($words,0,$n,1));
	}



	////////////////////////////

	//Find tfidf and keywords from words
	public function tfidf_keywords($words,$doc_id){
		//generate array of $word => $tfidf
		$words_tfidf = $this->generate_tfidf_array($words);
		foreach ($words_tfidf as $word => $tfidf) {
			error_log("documnet($doc_id), $word = $tfidf",0);
		}
		//Get top n keywords from this array
		//TOCHANGE: read number_of_keywords from database
		$number_of_keywords = 5;
		$keywords = $this->generate_keywords_tfidf($words_tfidf,$number_of_keywords);
		return $keywords;
	}

	////////////////these functions required for regenerate keywords

	//empty keywords, docs_keywords_link, allwords and allwords table
	//So that we can store new values
	//TOCHANGE: This may not necessary if we update count table on each insert
	public function empty_tfidf_tables(){
		$this->db->query("truncate allwords");
		//$this->db->query("truncate keywords");
		//$this->db->query("truncate docs_keywords_link");
	}

	//Get fulltext for tfidf function.
	//text for which tfidf is to be generated
	// this function should return $doc_id => $text
	public function get_all_text(){
		//for diglib database
		/*$this->db->select('doc_id, text');
		$this->db->from('diglib_comments');
		$query = $this->db->get();*/
		
		//for shopping cart database
		$this->db->select('id as doc_id, description as text', FALSE);
		$this->db->from('products');
		$query = $this->db->get();

		return $query->result();
	}
	///////////////////////////Following functions called from controller
	///////////////////////////regenerate allwords and all keywords when we import documnets

	//read all documents from alldocs table
	public function get_alldocs_from_allwords(){
		$this->db->select('*');
		$this->db->from('allwords');
		$query = $this->db->get();
		return $query;
	}

	//Regenerate tfidf database controller
	//not necessary if we update allwords and keyword table each time we insert doc
	//necessary if we import database
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

	//Regenerate keywords from regenerated allwords table
	//Process keywords for all documents in database
	//TOCHANGE: get sorted words from database
	public function regenerate_keywords_table1(){
		//loop through all documents in allwords table to get usable words in it
		//new function to read all data in alldocs table required
		//find tfidf and save result to keywords table
		$alldocs = $this->get_all_text();
		foreach ($alldocs as $doc_id => $text) {
			$words = $this->text_to_stemmed_words_frequency($text->text);
			
			$keywords = $this->tfidf_keywords($words,$doc_id);
			$this->save_keywords($keywords,$doc_id);
		}
	}
	/////////////////////////////
	//////////////////////////alternate method to regenerate all keywords

	//to get all doc_id from allwords table
	private function get_all_doc_id(){
		$this->db->select('id');
		$this->db->from('products');
		$query = $this->db->get();
		return $query->result();
	}
	//get all words for given doc_id
	private function get_all_words_for_doc_id($doc_id){
		$this->db->select('word,count');
		$this->db->from('allwords');
		$this->db->where('doc_id',$doc_id);
		$this->db->order_by('count','desc');
		$query = $this->db->get();
		return $query->result();
	}

	//alternate regenerate_keywords_table()
	public function regenerate_keywords_table(){
		$alldocs = $this->get_all_doc_id();
		foreach ($alldocs as $id => $data) {
			$doc_id=$data->id;
			$data2 = $this->get_all_words_for_doc_id($doc_id);
			$words=array();
			foreach($data2 as $id => $data3){
				$words[$data3->word]=$data3->count;
			}
			$keywords = $this->tfidf_keywords($words,$doc_id);
			$this->save_keywords($keywords,$doc_id);
		}

	}

	/////////////end alternate methods

///////////////////////////////////////////////

	//INCOMPLETE
	//to process keywords for individual docs
	//updates allwords table and keyword table for individual doc
	//use this function while saving the doc
	public function process_text_keywords($text){
		//generate stemmed words array with frequency from text and insert to db
		$words = $this->text_to_stemmed_words_frequency($text);
		$this->insert_words_allwords_table($words,$doc_id);
		//Generate tfidf Keywords and save
		$keywords = $this->tfidf_keywords($words,$doc_id);
		$this->save_keywords($keywords,$doc_id);
	}

	/////////////////////////////////////////


	//This function should be in controller
	//Handles tfidf keyword generation 
	//TOCHANGE: don't get text, get words, doc_id from database
	public function regenerate_keywords_controller(){
		//First get all text from the database
		$docs = $this->get_all_text();

		foreach($docs as $doc_id=>$text){
			$this->tfidf_keywords($text,$doc_id);
		}
	}
}