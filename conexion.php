<?php
	function conecta()
	{
	
		$link = mysql_connect("localhost","root","sistemas")
		or die('No se pudo conectar: ' . mysql_error());
		echo 'Connected successfully';
		mysql_select_db("sistemas", $link) or die ('No se pudo seleccionar la base de datos');
	}
?>