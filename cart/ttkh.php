<script language="javascript">
    function kiemtra() {
        if (a.hoten.value == "") {
            alert("Bạn chưa điền tên")
            a.hoten.focus();
            return false;

        }

        if (a.dienthoai.value == "") {
            alert("Bạn chưa điền SĐT<br> hãy điền số điện thoại để chúng tôi liên lạc lại với bạn")
            a.dienthoai.focus();
            return false;
        }
        if (a.diachi.value == "") {
            alert("Bạn chưa điền địa chỉ")
            a.diachi.focus();
            return false;
        }

        if (a.hoten.value != "" && a.dienthoai.value != "" && a.diachi.value != "") {
            a.submit();
        }
    }

</script>

<div class="thongtinkhachhang">
    <h3>Thông tin thanh toán</h3>
    <form class="form-group" action="index.php?content=cart&action=insert" method="POST" id="a"
          onsubmit="return kiemtra();">
        <table class="table table-borderless">
            <?php
            if (isset($_SESSION['idnd'])) {


                $sql = mysqli_query($link, "select * from nguoidung where idnd='" . $_SESSION['idnd'] . "'");
                $row = mysqli_fetch_array($sql);
            }
            ?>
            <tr>
                <td colspan="2" align="center"><span class="font-weight-bold text-uppercase">Thông tin khách hàng</span>
                </td>
            </tr>
            <tr>
                <td class="tieude">Tên khách hàng</td>
                <td><input class="form-control" type="text" name="hoten" value="<?php echo $row['tennd'] ?? '' ?>"/></td>
            </tr>
            <tr>
                <td class="tieude">Địa chỉ giao hàng</td>
                <td><input class="form-control" type="text" name="diachi" value="<?php echo $row['diachi'] ?? '' ?>"/></td>
            </tr>
            <tr>
                <td class="tieude">Số điện thoại</td>
                <td><input class="form-control" type="text" name="dienthoai" value="0<?php echo $row['dienthoai'] ?? '' ?>"/></td>
            </tr>
            <tr>
                <td class="tieude">Email</td>
                <td><input class="form-control" type="text" name="email" value="<?php echo $row['email'] ?? '' ?>"/></td>
            </tr>

            <tr>
                <td colspan="2" align="center" style=""><span class="font-weight-bold text-uppercase">Phương thức thanh toán</span>
                </td>
            </tr>
            <tr>
                <td class="tieude">Phương thức:</td>
                <td>
                    <select name="phuongthuc">
                        <option value="">Chọn phương thức thanh toán</option>
                        <option value="2">Chuyển khoản</option>
                        <option value="3">Thanh toán trực tiếp</option>

                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="submit">
                    <center><input type="submit" value="Đặt hàng"/></center>
                </td>
            </tr>
        </table>
    </form>

</div>
