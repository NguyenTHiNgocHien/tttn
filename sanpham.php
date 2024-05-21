<?php
$sql = "select * from danhmuc where dequi=1 order by madm";
$result = mysqli_query($link, $sql);


while ($row = mysqli_fetch_array($result)) {
    ?>
    <div class="sanpham"> <?php
        $sql1 = "select * from sanpham where madm={$row['madm']} order by idsp  LIMIT 0,6";
        $kq = mysqli_query($link, $sql1);
        $dem = mysqli_num_rows($kq);
        if ($dem > 0) {
            ?>
<!--                Tên danh mục -->
            <div class="card category-name-block mb-3">
                <div class="card-header bg-transparent pt-0" style="padding-left: 15px">
                    <div class="row">
                        <div class="col-4 category-header pt-2" style="padding-bottom: 12px;">
                            <span class="font-weight-bold text-white text-uppercase"><?php echo $row["tendm"]; ?></span>
                        </div>
                        <div class="col-8 d-inline-flex flex-row-reverse">
                            <a href="index.php?madm=<?php echo $row['madm'] ?>" class="btn btn-primary mb-2">Xem tất cả</a>
                        </div>
                    </div>
                </div>
            </div>
        <?php } ?>
        <div class="sanphamcon">
            <div class="row">
                <?php
                while ($row = mysqli_fetch_array($kq)) { ?>
                    <div class="col-md-4 mb-3">
                        <div class="card shadow" style="width: 19rem;">
                            <?php
                            if ($row['khuyenmai1'] > 0) {
                                ?>
                                <div class="moi"><h3>-<?php echo $row['khuyenmai1'] ?>%</h3></div>
                            <?php } ?>
                            <h1><a href="index.php?content=chitietsp&idsp=<?php echo $row['idsp'] ?>"><img
                                            class="card-img-top" src="img/uploads/<?php echo $row['hinhanh']; ?>"
                                            height="200"></a>
                            </h1>
                            <div class="card-body">
                                <h5 class="card-title"><a
                                            href="index.php?content=chitietsp&idsp=<?php echo $row['idsp'] ?>"><?php echo $row['tensp']; ?></a>
                                </h5>
                                <div class="card-text">
                                    <div class="row">
                                        <div class="col-8">
                                            <h5 class="mt-2 text-danger">
                                                Giá: <?php echo number_format(($row['gia'] * ((100 - $row['khuyenmai1']) / 100)), 0, ",", "."); ?>
                                                VNĐ</h5>
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

                        </div><!-- End .dienthoai-->
                    </div>
                <?php } ?>
            </div>

        </div>
    </div><!-- end san pham-->
<?php } ?>