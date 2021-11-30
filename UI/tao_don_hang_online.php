<?php
include_once('init.php');

$check = false;


if (isset($_POST["btn_create"])) {
  $ma_thanh_vien = $_POST["ma_thanh_vien"];
  if (
    empty($ma_thanh_vien) 
  ) {
    $check = true;
  } else {
    $sql = 'CALL tao_don_hang_online("' . $ma_thanh_vien . '")';

    $result = $conn->query($sql);
    if ($result) {
      header("Location: don_hang_online.php");
    }
  }
}


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

  <style>
  .myform {
    max-width: 500px;
    margin: auto;
  }
  </style>
</head>

<body>
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
      <a class="navbar-brand" href="./don_hang_online.php" style="font-weight: 700;">Bảng Đơn hàng Online</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <a class="nav-link" href="#">Trang của Phước</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Trang của Hoà</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Trang của Toàn</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Trang của Đạt</a>
          </li>
        </ul>
        <ul class="navbar-nav ml-auto mb-2 mb-lg-0">
    <li class="nav-item">
      <a href="./don_hang_online.php" class="btn btn-primary"><i class="bi bi-arrow-90deg-left"></i> Trở về trang Đon hàng Online</a>
    </li>
  </ul>

               

      </div>
    </div>
  </nav>

  <div class="container">
    <?php
    if ($check) echo '<div class="alert alert-warning" role="alert">
      Vui lòng điền đầy đủ thông tin !
    </div>';
    if ($conn->error) echo '<div class="alert alert-warning" role="alert">
      ' . $conn->error . '
    </div>'
    ?>
    <form action="" method="POST">
      <div class="myform">

         <div class="mb-3">
          <label for="ma_thanh_vien" class="form-label">Mã Thành viên</label>
          <select class="form-select" name="ma_thanh_vien" require>
            <option selected value="">Chọn Mã Thành viên</option>
            <?php
                $sql_thanh_vien = "SELECT cccd FROM thanh_vien;";
                $result_thanh_vien = $conn->query($sql_thanh_vien);
               while ($row = $result_thanh_vien->fetch_assoc()){
                  echo "<option value='" . $row["cccd"] . "'>" . $row["cccd"] . "</option>";
                }
            ?>  
          </select>
        </div>
       
        <button class="btn btn-primary" type="submit" name="btn_create">Tạo Đơn hàng</button>
      </div>

    </form>
  </div>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
  </script>
</body>

</html>