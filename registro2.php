<?php
	require_once("conexion.php");
	if (isset($_POST['documento']))
	{
		$documento= $_REQUEST['documento']; 
		$prinom= $_REQUEST['prinom'];
		$segnom= $_REQUEST['segnom'];
		$priape= $_REQUEST['priape'];
		$segape= $_REQUEST['segape']; 
		$correo= $_REQUEST['correo'];
		
		
	
		
			
			$ejecuta = conecta();
			$que= ("insert into tipusuario ( idTipUsuario, tip, codigoUsu, descripcion) values ('', '2', '$documento', 'usuario')");
			mysql_query($que);
			include ("registro3.php"); 
			echo '<blink><center><H2><i><font color="#627ADA" face="Courier New">Usuario creado con exito </font></i></H2></center></blink>';
			echo "".$documento;
		
		
	}
	else 
	echo No funciona ;	
		

?>
