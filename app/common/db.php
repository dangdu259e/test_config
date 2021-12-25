<?php
    $severName = "localhost";
    $username = "root";
    $password = "";
    $myDB = "db_no1";
    // thực hiện kết nối db
    try{
        $conn = new PDO("mysql:host=$severName;dbname=$myDB",$username, $password);
        $conn ->  setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    }
    // thông báo lỗi nếu có
    catch(PDOException $e){
        echo "Connection failed" . $e -> getMessage();
        echo "Connection failed" . $e -> getMessage();

    }
?>