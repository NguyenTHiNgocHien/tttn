<?php 
session_start(); 
unset($_SESSION['phanquyen']);
unset($_SESSION['username']);
unset($_SESSION['idnd']);

session_destroy();
echo "
							<script language='javascript'>
								alert('Thoát thành công');
								window.open('index.php','_self', 1);
							</script>
						";
?>