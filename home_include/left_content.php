
 <div id="danhmucsp">
					<div class="center mb-4">
                        <table class="table table-striped table-bordered">
                            <thead>
                                <tr class="table-danger">
                                    <th class="text-uppercase">Ưa Chuộng</th>
                                </tr>
                            </thead>
                            <tbody>
                            <?php
                            $sql="select * from danhmuc where dequi=1";
                            $result=mysqli_query($link,$sql);
                            ?>
                                <?php
                                while($row=mysqli_fetch_array($result))
                                {
                                    ?>
                                    <tr>
                                        <td class="text-monospace font-weight-normal">
                                            <a href="index.php?madm=<?php echo $row['madm'] ?>"><?php echo $row["tendm"];?></a>
                                        </td>
                                    </tr>
                                <?php } ?>
                            </tbody>
                        </table>
                        </div>
				</div>	<!-- End .menu-left -->
				
				<div id="dodikem">
					<div class="center">
                        <table class="table table-striped table-bordered mb-4">
                            <thead>
                            <tr class="table-danger">
                                <th class="text-uppercase">Phổ Biến </th>
                            </tr>
                            </thead>
                            <tbody>
                            <?php
                            $sql="select * from danhmuc where dequi=2";
                            $result=mysqli_query($link,$sql);
                            ?>
                            <?php
                            while($row=mysqli_fetch_array($result))
                            {
                                ?>
                                <tr>
                                    <td class="text-monospace font-weight-normal">
                                        <a href="index.php?madm=<?php echo $row['madm'] ?>"><?php echo $row["tendm"];?></a>
                                    </td>
                                </tr>
                            <?php } ?>
                            </tbody>
                        </table>
					</div><!-- End .center -->
				</div>