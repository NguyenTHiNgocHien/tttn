<div class="cart">

    <h3>Giỏ hàng của bạn</h3>
    <?php

    if (isset($_SESSION['cart']))
        $count = count($_SESSION['cart']);
    else $count = 0;
    $tongtien = 0;
    if ($count == 0)
        echo "Giỏ hàng của bạn chưa có sản phẩm nào";
    else {
        ?>

        <table class="table table-stripped table-bordered table-hover">
            <tr class="table-danger">
                <td><b>Tên sản phẩm</b></td>
                <td><b>Giá</b></td>
                <td><b>Số lượng</b></td>
                <td><b>Thành tiền</b></td>
                <td><b>Tùy chọn</b></td>
            </tr>
            <?php

            $sql = "select * from sanpham where idsp in(";
            foreach ($_SESSION['cart'] as $stt => $soluong) {
                if ($soluong > 0)
                    $sql .= $stt . ",";
            }
            if (substr($sql, -1, 1) == ',') {
                $sql = substr($sql, 0, -1);
            }
            $sql .= ' )order by idsp DESC';
            $rows = mysqli_query($link, $sql);
            while ($row = mysqli_fetch_array($rows)) {
                ?>


                <form action="index.php?content=cart&action=update&idsp=<?php echo $row['idsp'] ?>" method="POST"
                      name="update">
                    <tr class="sanphamcart">
                        <td><p class="carta"><a
                                        href="index.php?content=chitietsp&idsp=<?php echo $row['idsp'] ?>"><?php echo $row['tensp'] ?></a>
                            </p></td>
                        <td><?php echo number_format(($row['gia'] * ((100 - $row['khuyenmai1']) / 100)), 0, ",", "."); ?></td>
                        <td width="100"><input class="form-control" type="number" name="sl"
                                   value="<?php echo $_SESSION['cart'][$row['idsp']] ?>"/></td>
                        <td><?php echo number_format(($row['gia'] * ((100 - $row['khuyenmai1']) / 100)) * $_SESSION['cart'][$row['idsp']], 0, ",", ".") ?></td>
                        <td><input type="submit" name="huy" value="Xóa" class="btn btn-danger"/>
                                <input type="submit" value="Cập nhập" name="submit" class="btn btn-warning"/></td>
                    </tr>
                </form>

                <?php $tongtien += $_SESSION['cart'][$row['idsp']] * ($row['gia'] * ((100 - $row['khuyenmai1']) / 100)); ?>
                <?php
            }
            ?>
            <tr>
                <td colspan="3">
                    <div class="d-flex justify-content-center">
                        <a href="index.php?content=cart&action=xoa" class="btn btn-danger">
                            <i class="fa fa-trash"></i>&nbsp Xóa toàn bộ
                        </a>
                    </div>
                </td>
                <td colspan="2">
                    <div class="d-flex justify-content-center">
                        <p>Tổng cộng: <span><?php echo number_format($tongtien, 0, ",", ".") ?></span>VNĐ</p>
                    </div>
                </td>
            </tr>

        </table>

        <div class="row">
            <div class="col-6">
                <div class="d-flex justify-content-center">
                    <a href="index.php" class="btn btn-primary"><i class="fa fa-shopping-cart"></i>&nbsp Tiếp tục mua
                        hàng </a>
                </div>
            </div>
            <div class="col-6">
                <div class="d-flex justify-content-center">
                    <a href="index.php?content=cart&action=check" class="btn btn-success"><i class="fa fa-check"></i>&nbsp
                        Thanh toán</a>
                </div>
            </div>
        </div>
        <?php
    }
    ?>
</div>