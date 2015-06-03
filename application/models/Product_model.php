<?php
class Product_model extends CI_Model{

	//Get all products
	public function get_products(){
		$this->db->select('p.*, c.name');
		$this->db->from('products as p');
		$this->db->join('categories as c','p.category_id=c.id','inner');
		$query = $this->db->get();
		return $query->result();
	}

	//Get a single product
	public function get_product_details($id){
		$this->db->select('*');
		$this->db->from('products');
		$this->db->where('id',$id);
		/*$this->db->query("select p.*,group_concat(distinct a.word) as keywords, group_concat(distinct s.doc_id2) as sim from products as p, (select * from allwords where doc_id=1 order by tfidf desc limit 5) as a, (select * from similarity where doc_id1=1 and similarity<1 and similarity>0 order by similarity desc limit 5) as swhere p.id=1");*/
		$query = $this->db->get();
		return $query->row();
	}

	//Get title of single product
	//get_product_details can also be used
	public function get_product_title($id){
		$this->db->select('title');
		$this->db->from('products');
		$this->db->where('id',$id);
		$query = $this->db->get()->row();
		return $query->title;
	}

	//get keywords for the single product
	public function get_keywords_of($id){
		$this->db->select('*');
		$this->db->from('allwords');
		$this->db->where('doc_id',$id);
		$this->db->order_by('tfidf desc');
		$this->db->limit('5');
		$query = $this->db->get();
		return $query->result();
	}

	//get similar documents for the selected product
	public function get_similar_to($id){
		$this->db->select('*');
		$this->db->from('similarity');
		$this->db->where('doc_id1',$id);
		$this->db->where('similarity<',1,FALSE); 
		$this->db->where('similarity>',0,FALSE);
		$this->db->order_by('similarity desc');
		$this->db->limit('5');
		$query = $this->db->get();
		return $query->result();
	}

	//Generic method to get products by any field and value
	public function get_products_by($fieldname,$fieldvalue){
		$this->db->select('p.*,c.name',false); //false will escape characters
		$this->db->from('products as p');
		$this->db->join('categories as c','c.id=p.category_id','inner');
		$this->db->where($fieldname,$fieldvalue);
		$query = $this->db->get();
		return $query->result();
	}

	//Update products
	public function edit_product(){
		$fileinfo = $this->upload->data('userfile');
		$data = array(
			'category_id' => $this->input->post('category_id'),
			'title' => $this->input->post('title'),
			'description' => $this->input->post('description'),
			'nutritional_value' => $this->input->post('nutritional_value'),
			'image' => $fileinfo['file_name'],//$this->input->post('image'),
			'price' => $this->input->post('price'),
			'unit' => $this->input->post('unit'));
		$this->db->where('id',$this->input->post('product_id'));
		$update = $this->db->update('products',$data);
		return $update;
	}

	//Add new product
	public function add_product(){
		$fileinfo = $this->upload->data('userfile');
		$data = array(
			'category_id' => $this->input->post('category_id'),
			'title' => $this->input->post('title'),
			'description' => $this->input->post('description'),
			'nutritional_value' => $this->input->post('nutritional_value'),
			'image' => $fileinfo['file_name'],//$this->input->post('userfile'),
			'price' => $this->input->post('price'),
			'unit' => $this->input->post('unit'));
		$insert = $this->db->insert('products',$data);
		//Now count keywords and insert into appropriate tables
		//insert_words_tables($this->input->post('description'),$this->db->insert_id());
		return $insert;
	}

	//Remove product
	public function delete_product($id){
		//Start transaction
		$this->db->trans_start();
		//Delete from products
		$this->db->where('id',$id);
		$this->db->delete('products');
		//update orders with product_id =$id
		$this->db->where('product_id',$id);
		//return $this->db->update('order',array('product_deleted'=>'deleted'));
		//For now, delete all from orders with product id
		$this->db->delete('orders');
		//Complete transaction
		$this->db->trans_complete();
		//Return transaction status
		return $this->db->trans_status();
	}

	//Get Popular Product
	public function get_popular(){
		$this->db->select('p.title,p.id, count(o.product_id) as total');
		$this->db->from('orders as o');
		$this->db->join('products as p','o.product_id = p.id','inner');
		$this->db->group_by('o.product_id');
		$this->db->order_by('total','desc');
		$this->db->limit('5');
		$query = $this->db->get();
		return $query->result();
	}

	//Upload the product image
	public function upload_image(){
		$config=array(
			'upload_path' => realpath(APPPATH. '../assets/images/products/'),//dirname($_SERVER["SCRIPT_FILENAME"]).'/assets/images/products/',
			'upload_url' => base_url().'assets/images/products/',
			'remove_spaces' => TRUE,
			'allowed_types' => 'gif|jpg|png|jpeg',
			'overwrite' => TRUE,
			'max_size' => '2048',
			'max_width'  => '1024',
			'max_height'  => '768');
		$this->load->library('upload',$config);
		$this->upload->initialize($config);
		return $this->upload->do_upload();
	}

	//generate thumbnail by resizing the image
	public function generate_thumbnail($image_data){
		//generate thumbnail with images library
		$config = array(
			'source_image' => $image_data['full_path'],
			'new_image' => $image_data['file_path'].'/thumbs/'.$image_data['file_name'],
			'maintain_ratio' => TRUE,
			'width' => 150,
			'height' => 100);
		$this->load->library('image_lib',$config);
		return $this->image_lib->resize();
	}

	//Get products by keyword
	public function get_products_by_keyword($keyword){
		//(select * from fruits where type = 'apple' order by price limit 5)
		//union all
		$query = $this->db->query("select distinct id,title,price,image,unit from products where id in (select a1.doc_id from allwords a1 where (select count(*) from allwords a2 where a1.doc_id=a2.doc_id and a1.tfidf<=a2.tfidf) <=5 and word=".$this->db->escape($keyword).")");
		return $query->result();
	}
}

?>