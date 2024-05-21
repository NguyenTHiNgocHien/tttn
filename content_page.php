<?php
if (isset($_GET['action'])) {
    $action = $_GET['action'];
} else $action = "";
if (isset($_GET['content'])) {
    switch ($_GET['content']) {
        case "gioithieu":
            include('gioithieu.php');
            break;
        case "timkiem":
            include('timkiem.php');
            break;
        case "dangky":
            include('dangky.php');
            break;
        case "dangnhap":
            include('dangnhap.php');
            break;
        case "chitietsp":
            include('chitietsp.php');
            break;
        case "cart":
            include('cart/index.php');
            break;
        case "hotro":
            include('hotro.php');
            break;
        case "sanpham":
            include('sanpham.php');
            break;
        case "dodikem":
            include('dodikem.php');
            break;
        case "hethang":
            include('hethang.php');
            break;
        case "khuyenmai":
            include('khuyenmai.php');
            break;
    }
} elseif (isset($_GET['madm'])) {
    $sql = "SELECT * FROM sanpham  WHERE madm='{$_GET['madm']}'";
    if (isset($GET['madm'])) {
        $sql .= "where madm='" . $_GET['madm'] . "'";
    }
    // Nếu đã có sẵn số thứ tự của trang thì giữ nguyên (ở đây tôi dùng biến $page)
    // nếu chưa có, đặt mặc định là 1!

    if (!isset($_GET['page'])) {
        $page = 1;
    } else {
        $page = $_GET['page'];
    }

    // Số sản phẩm hiển thị trên mỗi trang
    $so_san_pham_moi_trang = 10;

    // Trang hiện tại (mặc định là trang 1)
    $trang_hien_tai = isset($_GET['page']) ? $_GET['page'] : 1;

    // Tính vị trí bắt đầu cho truy vấn SQL
    $bat_dau = ($trang_hien_tai - 1) * $so_san_pham_moi_trang;

    // Truy vấn để lấy số lượng sản phẩm
    $sql_tong_san_pham = "SELECT COUNT(*) AS tong_san_pham FROM sanpham where madm={$_GET['madm']}";
    $result_tong_san_pham = mysqli_query($link,$sql_tong_san_pham);
    $row_tong_san_pham = $result_tong_san_pham->fetch_assoc();

    $tong_san_pham = $row_tong_san_pham['tong_san_pham'];

    // Tính số trang
    $tong_so_trang = ceil($tong_san_pham / $so_san_pham_moi_trang);

    // Chạy 1 MySQL query để hiện thị kết quả trên trang hiện tại

    $sql .= "LIMIT $bat_dau, $so_san_pham_moi_trang";


    $query = mysqli_query($link, $sql);
    $total = mysqli_num_rows($query);
    if ($total > 0) {
        ?>

        <div class="sanpham">
            <?php
            $sql1 = "select tendm from danhmuc where madm='{$_GET['madm']}'";
            $query1 = mysqli_query($link, $sql1);
            $row = mysqli_fetch_array($query1);
            ?>
<!--            Tên danh mục -->
            <div class="card category-name-block mb-3">
                <div class="card-header bg-transparent pt-0" style="padding-left: 15px">
                    <div class="row">
                        <div class="col-4 category-header pt-2" style="padding-bottom: 12px;">
                            <span class="font-weight-bold text-white text-uppercase"><?php echo $row['tendm'] ?></span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="sanphamcon">

                <div class="row">
                    <?php
                    while ($row = mysqli_fetch_array($query)) { ?>
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

                            </div><!-- End .dienthoai-->
                        </div>
                    <?php } ?>
                </div>

            </div><!-- End .sanphamcon-->

        </div><!-- End .sanpham-->
        <!-- Hiển thị phân trang -->
        <div class="phantrang">
            <nav aria-label="Page navigation example">
                <ul class="pagination">
                    <li class="page-item <?php echo ($trang_hien_tai == 1) ? 'disabled' : ''; ?>">
                        <a class="page-link" href="<?= $_SERVER['PHP_SELF'] . "?madm=" . $_GET['madm'] ?>&page=<?php echo $trang_hien_tai - 1; ?>" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <?php for ($i = 1; $i <= $tong_so_trang; $i++) : ?>
                        <li class="page-item <?php echo ($i == $trang_hien_tai) ? 'active' : ''; ?>">
                            <a class="page-link" href="<?= $_SERVER['PHP_SELF'] . "?madm=" . $_GET['madm'] ?>&page=<?php echo $i; ?>"><?php echo $i; ?></a>
                        </li>
                    <?php endfor; ?>
                    <li class="page-item <?php echo ($trang_hien_tai == $tong_so_trang) ? 'disabled' : ''; ?>">
                        <a class="page-link" href="<?= $_SERVER['PHP_SELF'] . "?madm=" . $_GET['madm'] ?>&page=<?php echo $trang_hien_tai + 1; ?>" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>            <?php
    } else {
        echo "Không có sản phẩm nào";
    }
} else {

    ?>
    <div class="sanpham">
        <div class="card category-name-block mb-3">
            <div class="card-header bg-transparent pt-0" style="padding-left: 15px">
                <div class="row">
                    <div class="col-4 category-header pt-2" style="padding-bottom: 12px;">
                        <span class="font-weight-bold text-white">DANH SÁCH SẢN PHẨM</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="sanphamcon">
            <?php
            $sql1 = "select * from sanpham inner join danhmuc on sanpham.madm = danhmuc.madm where dequi=1 order by daban  DESC limit 8 ";
            $result1 = mysqli_query($link, $sql1);
            ?>
            <div class="row">
                <?php
                while ($row = mysqli_fetch_array($result1)) { ?>
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

                        </div><!-- End .dienthoai-->
                    </div>
                <?php } ?>
            </div>


        </div><!-- End .sanphamcon-->

    </div><!-- End .sanpham-->

    <!------------------------------------------------------------------------------------------------------------------->
    <div class="sanpham">
        <div class="card category-name-block mb-3">
            <div class="card-header bg-transparent pt-0" style="padding-left: 15px">
                <div class="row">
                    <div class="col-4 category-header pt-2" style="padding-bottom: 12px;">
                        <span class="font-weight-bold text-white">SẢN PHẨM BÁN CHẠY</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="sanphamcon">
            <?php
            $sql1 = "select * from sanpham inner join danhmuc on sanpham.madm = danhmuc.madm where dequi=1 order by idsp  DESC limit 6 ";
            $result1 = mysqli_query($link, $sql1);
            ?>
            <div class="row">
                <?php
                while ($row = mysqli_fetch_array($result1)) { ?>
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

                        </div><!-- End .dienthoai-->
                    </div>
                <?php } ?>
            </div>

        </div><!-- End .sanphamcon-->

    </div><!-- End .sanpham-->
<?php } ?>