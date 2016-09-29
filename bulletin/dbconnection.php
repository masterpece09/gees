<?php
define('DB_NAME', 'geesado');
define('DB_USER', 'root');
define('DB_PASSWORD', '');
define('DB_HOST', 'localhost');

class DBConnection{
	
	public static function newInstance($dbhost, $dbname, $dbuser, $dbpassword){
		$conn = new PDO("mysql:host=$dbhost;dbname=$dbname", $dbuser, $dbpassword, array( PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"));
		return $conn;
	}
	
}

class Connexion{
	
	public $connection;
	
	public function __construct(){
		try{
			$this->connection = DBConnection::newInstance(DB_HOST, DB_NAME, DB_USER, DB_PASSWORD);
                        $fichier_debug="/tmp/bulletin_pdf.txt";	
                        $fich=fopen($fichier_debug,"a+");
                        fwrite($fich,"CONNEXION SUCXCED");
                        fclose($fich);
		}catch(PDOException $exception){
			$fichier_debug="/tmp/bulletin_pdf.txt";	
                        $fich=fopen($fichier_debug,"a+");
                        fwrite($fich,$exception->getMessage());
                        fclose($fich);                        
		}
	}
	
}
