<?
$src = new mysqli('localhost','root','','src');
$dest = new mysqli('localhost','root','','dest');

$src->set_charset('utf8');
$dest->set_charset('utf8');

class Product{
	
	var $mark = null;
	var $model = null;
	var $w = null;
	var $h = null;
	var $r = null;
	var $season = null;
	var $ship = null;
	var $index_m = null;
	var $index_v = null;
	var $price = null;
	var $quant = null;
	
	function __construct($mark,$model,$w,$h,$r,$season,$ship,$index_m,$index_v,$price,$quant){
		$this->mark = $mark;
		$this->model = $model;
		$this->w = $w;
		$this->h = $h;
		$this->r = $r;
		$this->season = $season;
		$this->ship = $ship;
		$this->index_m = $index_m;
		$this->index_v = $index_v;
		$this->price = $price;
		$this->quant = $quant;
	}
	
	function check($p){
		
		return ($this->mark == $p->mark && $this->model == $p->model && $this->w == $p->w && $this->h == $p->h && $this->r == $p->r && $this->season == $p->season && $this->ship == $p->ship && $this->index_m == $p->index_m && $this->index_v == $p->index_v && $this->price == $p->price && $this->quant == $p->quant);
	}
	
}

function getData($query){
	$arr = array();
	if($query->num_rows > 0) {
		while($r = $query->fetch_assoc()){
			$arr[] = $r;
		}
	}
	return $arr;
}


function run(){
	global $src;
	global $dest;
	
	//update products
	$new = $src->query('select tmark.name as mark,tmod.name as model,tw.name as w,th.name as h, tr.name as r, tinfo.season, tinfo.ship,tinfo.index_m,tinfo.index_v,tinfo.price,tinfo.quant
	FROM tiresinfo tinfo
	JOIN tiresmodels tmod ON tinfo.model_id = tmod.id
	JOIN tiresmarks tmark ON tmark.id = tmod.mark_id
	JOIN tires_w tw ON tw.id = tinfo.w_id
	JOIN tires_h th ON th.id = tinfo.h_id
	JOIN tires_r tr ON tr.id = tinfo.r_id');
	$arr = array();
	while($r = $new->fetch_assoc()){
		$product = new Product($r['mark'],$r['model'],$r['w'],$r['h'],$r['r'],$r['season'],$r['ship'],$r['index_m'],$r['index_v'],$r['price'],$r['quant']);
		$arr[] = $product;	
	}
	$oldarr = array();
	$old = $dest->query('select * from products');
	//var_dump($old);
	
	if($old->num_rows > 0) {
		while($r = $old->fetch_assoc()){
			$product = new Product($r['mark'],$r['model'],$r['w'],$r['h'],$r['r'],$r['season'],$r['ship'],$r['index_m'],$r['index_v'],$r['price'],$r['quant']);
			$oldarr[] = $product;
		}
	}
	foreach($arr as $v){
		$exists = false;
		if(sizeof($oldarr) > 0)foreach($oldarr as $o){
			if($o->check($v)){
				$exists = true;
				break;
			}
		}
		if(!$exists){
			$dest->query('INSERT INTO products SET mark = "'.$v->mark.'",model = "'.$v->model.'",w = '.$v->w.',h = '.$v->h.',r = '.$v->r.',season = "'.$v->season.'",ship = '.$v->ship.',index_m = '.$v->index_m.',index_v = "'.$v->index_v.'",price = '.$v->price.',quant = '.$v->quant.'');
		}
	}
	
	
	// update orders
	
	$orders = $src->query('select tmark.name as mark,tmod.name as model,tw.name as w,th.name as h, tr.name as r, tinfo.season, tinfo.ship,tinfo.index_m,tinfo.index_v,tinfo.price,tinfo.quant,o.name username, o.address,o.phone,o.comment,o.time,op.price oprice,op.quant oquant from orders o
	JOIN orders_products op ON op.order_id = o.id
	JOIN tiresinfo tinfo ON tinfo.id = op.product_id
	JOIN tiresmodels tmod ON tinfo.model_id = tmod.id
	JOIN tiresmarks tmark ON tmark.id = tmod.mark_id
	JOIN tires_w tw ON tw.id = tinfo.w_id
	JOIN tires_h th ON th.id = tinfo.h_id
	JOIN tires_r tr ON tr.id = tinfo.r_id');
	$data = getData($orders);
	
	$old_users = $dest->query('select o.id,o.name,o.phone from users o');
	$old_u = getData($old_users);
	$old_orders = $dest->query('select * from orders');
	$old_o = getData($old_orders);
	$old_products = $dest->query('select * from products');
	$old_p = getData($old_products);
	foreach($data as $v){
		$exists_users = false;
		foreach($old_u as $o){
			if($o['name'] == $v['username'] && $o['phone'] == $v['phone']){
				$exists_users = true;
				$user_id = $o['id'];
				break;
			}
		}
		$exists_orders = false;
		foreach($old_o as $o){
			if($o['comment'] == $v['comment'] && $o['address'] == $v['address'] && $o['time'] == $v['time']){
				$exists_orders = true;
				$order_id = $o['id'];
				break;
			}
		}
		
		if(!$exists_users){
			$dest->query('INSERT INTO users SET name = "'.$v['username'].'",phone = "'.$v['phone'].'"');
			$user_id = $dest->insert_id;
		}
		if(!$exists_orders){
			
			$dest->query('INSERT INTO orders SET comment = "'.$v['comment'].'",address = "'.$v['address'].'",time = "'.$v['time'].'"');
			$order_id = $dest->insert_id;
		}
		$exists_p = false;
		foreach($old_p as $o){
			if($o['mark'] == $v['mark'] && $o['model'] == $v['model'] && $o['w'] == $v['w'] && $o['h'] == $v['h'] && $o['r'] == $v['r'] && $o['season'] == $v['season'] && $o['ship'] == $v['ship'] && $o['index_m'] == $v['index_m'] && $o['index_v'] == $v['index_v'] && $o['price'] == $v['price'] && $o['quant'] == $v['quant']){
				$exists_p = true;
				$product_id = $o['id'];
				break;
			}
		}
		$sale = $dest->query('select * from sales where product_id = '.$product_id.' and user_id = '.$user_id.' and order_id = '.$order_id.' and price = '.$v['oprice'].' and quant = '.$v['oquant'].'');
		if($sale->num_rows == 0) $dest->query('INSERT INTO sales set product_id = '.$product_id.', user_id = '.$user_id.', order_id = '.$order_id.', price = '.$v['oprice'].', quant = '.$v['oquant'].'');
	}
	
	
	
	
		
	
	
}

run();