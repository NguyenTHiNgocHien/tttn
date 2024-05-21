 <div id="dangnhap">
					<div class="center1">
						<h4>ĐĂNG NHẬP</h4>
						<?php if(isset( $_SESSION['username'])){
							?>
								<div id="dangnhap-in">
								<span id="xinchao"><p>Xin chào: <span> <?php echo $_SESSION['username'] ?> </span></p></span>
								<span id="logout"><p><a href="logout.php">Logout</a></p></span>
						</div><!-- End .dangnhap-in-->
							<?php 
						}
						else{
						?>
						<div id="dangnhap-in">
							<form action="dangnhap.php" method="post" class="form-group">
                                <div class="row mr-0">
                                    <div class="col-12">
                                        <label for="username" class="font-weight-bold">Tên đăng nhập</label>
                                        <input type="text" class="form-control" name="user" id="username" placeholder="Tên đăng nhập">
                                    </div>
                                    <div class="col-12">
                                        <label for="password" class="font-weight-bold">Mật khẩu</label>
                                        <input type="text" class="form-control" name="pass" id="password" placeholder="Mật khẩu">
                                    </div>
                                </div>
                                <div class="d-flex justify-content-center mt-2">
                                    <a href="index.php?content=dangnhap"><button name="login">Đăng nhập</button></a><br>
                                </div>
							</form>
                            <span class="text-warning"><a href="index.php?content=dangky">Đăng ký</a></span>
						</div><!-- End .dangnhap-in-->
						<?php } ?>
					</div><!-- End .center1-->
				</div><!-- End .giohang-->
				<div id="giohang">
					<div class="center1">
						<h4>GIỎ HÀNG</h4>
							<a href="index.php?content=cart"><img src="https://img.lovepik.com/free-png/20210918/lovepik-shopping-cart-png-image_400195457_wh1200.png" title="Vào giỏ hàng" width="100" height="80px"></a>
							<?php 
								$tongtien=0;
								if(isset($_SESSION['cart']))
								$count=count($_SESSION['cart']);
								else $count=0;
								if($count==0){
							?>
							<p>Không có sản phẩm</p>
							<?php } 
							else {
							?>
							<p id="soluonggioh ang">Có <span><?=$count?></span> sản phẩm trong giỏ</p>
							 
							<p id="tiengiohang">
							 <?php $sql ="select * from sanpham where idsp in(";
        
		foreach($_SESSION['cart'] as $id => $soluong)
            {
              if($soluong>0)
                $sql .= $id.",";
            }
            if (substr($sql,-1,1)==',')
            {
                $sql = substr($sql,0,-1);
            }
      $sql .=' )order by idsp 	';
      $rows=mysqli_query($link,$sql);
while ($row=mysqli_fetch_array($rows))
{  
$tongtien+=$_SESSION['cart'][$row['idsp']]*$row['gia']; 
}
?> <?php  echo number_format($tongtien,"0",",",".");?> VNĐ
							</p>
							

          
					<?php } ?>		
							
					</div><!-- End .center1-->
				</div><!-- End .giohang-->
				<div id="timkiem">
					<div class="center1">
						<h4>TÌM KIẾM </h4>
							<div id="select">
								<form action="index.php?content=timkiem" method="GET" class="form-group">
								<input type="hidden" name="content" value="timkiem">
								<input type="text" name="timkiem" class="form-control"/>
								<div id="select2">
									<select name="gia">
										<option value="0"> - Chọn giá - </option>
										<option value="1">  < 100.000</option>
										<option value="2">100.000 - 300.000</option>
										<option value="3">300.000 - 500.000</option>
									</select>
                                    <button type="submit" class="btn btn-primary mt-2">Tìm kiếm</button>
								</form>
								</div><!-- End .select2-->
							</div><!-- End .select-->
					
					</div><!-- End .center1-->
				</div><!-- End .timkiem-->
				
				<div id="yahoo">
					<div class="center1">
						<h4>HOTLINE</h4>
						<h2><a href="ymsgr:sendim?anhchanglangtu_yeubetocvang&amp;m=g&amp;t=14"><img src="img/imonline.png"></a></h2>
							<p>038 *** **30</p>
						<h2><a href="ymsgr:sendim?boydangyeu8188&amp;m=g&amp;t=14"><img src="img/imonline.png"></a></h2>
							<p>033 *** **43</p>
					</div><!-- End .center1-->
				</div><!-- End .yahoo -->
