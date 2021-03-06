<?php
include_once('init.php');

$ma_don_online = $_GET["ma_don_online"];

if (isset($_POST["btn-del"])) {
  $ma_dau_sach = $_POST["ma_dau_sach"];
  $query_del = "DELETE FROM don_hang_online WHERE ma ='" . $ma . "';";
  $conn->query($query_del);
}

$data_don_hang .='
  <form class="d-flex" style="max-width: 500px; margin-left: auto;" method="GET" action="them_bao_gom_online.php">
    <input type="text" value="' . $ma_don_online . '" name ="ma_don_online" hidden>
    <button class="btn btn-success " style="min-width: 100px;"  type="submit"><i class="bi bi-plus-square"></i> Thêm Sách vào Đơn hàng</button>
  </form> ';

$sql_bao_gom_online = "CALL thong_tin_don_hang_online ('" . $ma_don_online . "');";

$result_bao_gom_online = $conn->query($sql_bao_gom_online);

if ($result_bao_gom_online->num_rows > 0) {
  $col = 1;
  $data_bao_gom_online = '';
  while ($row = $result_bao_gom_online->fetch_assoc()) {
    $data_bao_gom_online .= '<tr>
        <td scope="col">' . $col . '</td>
        <td scope="col">' . $row["ma_dau_sach"] . '</td>
        <td scope="col">' . $row["ten"] . '</td>
        <td scope="col">' . $row["the_loai"] . '</td>
        <td scope="col">' . $row["so_luong"] . '</td>
        <td scope="col">' . $row["gia_niem_yet"] . '</td>
        <td scope="col">' . $row["tong_cong"] . '</td>
        <td scope="col">

        <form action="sua_bao_gom_online.php" method="GET">
        <input type="text" value="' . $row["ma_dau_sach"] . '" name ="ma_dau_sach" hidden>
        <input type="text" value="' . $ma_don_online . '" name ="ma_don_online" hidden>
        <button class="btn btn-secondary">Thay đổi số lượng</button></td>
        </form>
      </tr>';
    $col++;
  }
} else {
  echo "0 results";
}
$conn->close();

?>




<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
</head>

<body>
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
      <a class="navbar-brand" href="don_hang_online.php" style="font-weight: 700;">Bảng Đơn hàng Online</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
            <a class="nav-link" href="nha_xuat_ban.php">Nhà xuất bản</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="voucher.php">Voucher</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="nhan_vien.php">Nhân viên</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="dau_sach.php">Bảng đầu sách</a>
          </li>
        </ul>
        <ul class="navbar-nav ml-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <!-- <?php echo $data_don_hang ?> -->
          </li>
        </ul>
      </div>
    </div>
  </nav>
  <h2 style="text-align: center;"></h2>

  
  <div class="container">
    <div class="myform d-flex">
      <h4>Thông tin chi tiết đơn hàng <?php echo $ma_don_online ?></h4>
      <?php echo $data_don_hang ?>
     
    </div>
    <table class="table table-striped table-hover">
      <thead>
        <tr>
          <th scope="col">STT</th>
          <th scope="col">Mã đầu sách</th>
          <th scope="col">Tên</th>
          <th scope="col">Thể loại</th>
          <th scope="col">Số lượng</th>
          <th scope="col">Giá niêm yết (VNĐ)</th>
          <th scope="col">Tổng tiền (VNĐ)</th>
        </tr>
      </thead>
      <tbody>
        <?php echo $data_bao_gom_online ?>
      </tbody>
    </table>
  </div>

    
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
  </script>
</body>

</html>