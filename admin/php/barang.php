<?php

include "../app/db.php";

session_start();

if (isset($_POST['simpan_brg'])) {
    $name = $_POST['name'];
    $harga = $_POST['harga'];
    $stok = $_POST['stok'];

    if ($name == NULL and $harga == NULL and $stok == NULL) {
        echo "<script>alert('Mohon isi data dengan lengkap'),
        location.replace('../views/barang.php')";
    } else {
        $save = $conn->query("INSERT INTO tbl_barang VALUES(NULL,'$name','$harga','$stok')");

        if ($save) {
            echo "<script>
            alert('Data berhasil disimpan'),
            location.replace('../views/barang.php')
            </script>";
        } else {
            echo "error data or code";
        }
    }
}

if (isset($_POST['edit'])) {
    $id = $_POST['id_adm'];
    $user = $_POST['username'];
    $name = $_POST['name'];
    $pw = $_POST['password'];

    $update = $conn->query("UPDATE tbl_adm SET username = '$user', name = '$name', password = '$pw' WHERE id = '$id'");

    if ($update) {
        echo "<script>alert('Data berhasil di update')
        location.replace('../views/admin.php')</script>";
    } else {
        echo "<script>alert('Data gagal di update')
        location.replace('../views/admin.php')</script>";
    }
}

if (isset($_GET['id'])) {
    $id = $_GET['id'];
    $delete = $conn->query("DELETE FROM tbl_adm WHERE id = '$id'");

    if ($delete) {
        echo "<script>alert('Data berhasil dihapus')
        location.replace('../views/admin.php')</script";
    } else {
        echo "<script>alert('Data gagal dihapus')
        location.replace('../views/admin.php')</script";
    }
}
