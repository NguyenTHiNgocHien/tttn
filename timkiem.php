<?php
if(isset($_GET['timkiem']))
{
  $tim=$_GET['timkiem'];
  switch($_GET['gia'])
  {
	case "1":
		$sql="select * FROM sanpham WHERE tensp like '%".$tim."%' and (gia between '0' and '100000')";	
	break;
	case "2":
		$sql="select * FROM sanpham WHERE tensp like '%".$tim."%'  and (gia between '100000' and '300000')";	
	break;
	case "3":
		$sql="select * FROM sanpham WHERE tensp like '%".$tim."%'  and (gia between '300000' and '500000')";	
	break;
	case "4":
		$sql="select * FROM sanpham WHERE tensp like '%".$tim."%'  and (gia between '500000' and '800000')";	
	break;
	case "5":
		$sql="select * FROM sanpham WHERE tensp like '%".$tim."%'  and (gia between '800000' and '1000000')";	
	break;
	case "6":
		$sql="select * FROM sanpham WHERE tensp like '%".$tim."%'  and (gia >= '1000000')";	
	break;
	default:
	  $sql="select * FROM sanpham WHERE tensp like '%".$tim."%' ";	
	  break;
  }
  
 
	$rows=mysqli_query($link,$sql);
	$tong=mysqli_num_rows($rows);
    if($tong<0)
     echo"Không tìm được sản phẩm nào";
    else
      {
    ?>
	<div class="sanpham">	
	<h2>Từ khóa <font color="yellow"><b><?php echo $tim ?></b></font> : có <?php echo $tong?> kết quả </h2>
	<div class="sanphamcon">
        <div class="row">
            <?php

            while($row=mysqli_fetch_array($rows))
            {
                ?>
                <div class="col-md-4 mb-3">
                    <div class="card shadow" style="width: 19rem;">
                        <?php
                        if ($row['khuyenmai1'] > 0) {
                            ?>
                            <div class="moi"><h3>-<?php echo $row['khuyenmai1'] ?>%</h3></div>
                        <?php } ?>
                        <h1><a href="index.php?content=chitietsp&idsp=<?php echo $row['idsp'] ?>"><img
                                        class="card-img-top" src="img/uploads/<?php echo $row['hinhanh']; ?>" height="200"></a>
                        </h1>
                        <div class="card-body">
                            <h5 class="card-title"><a
                                        href="index.php?content=chitietsp&idsp=<?php echo $row['idsp'] ?>"><?php echo $row['tensp']; ?></a>
                            </h5>
                            <div class="card-text">
                                <div class="row">
                                    <div class="col-8">
                                        <h5 class="mt-2 text-danger">
                                            Giá: <?php echo number_format(($row['gia'] * ((100 - $row['khuyenmai1']) / 100)), 0, ",", "."); ?> VNĐ</h5>
                                    </div>
                                    <div class="col-4">
                                        <div class="button">
                                            <a href="index.php?content=cart&action=add&idsp=<?php echo $row['idsp'] ?>"
                                               class="btn btn-outline-primary"><i class="fas fa-shopping-cart"></i></a>
                                        </div><!-- End .button-->
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            <?php } ?>
        </div>
		</div><!-- End .sanphamcon-->
	</div><!-- End .sanpham-->
 
<?php 
}}
?>
