<?php

session_start();

@include('../connection.php');

$user_id = $_SESSION['user']['id'];
$product_id = $_GET['product_id'];

$check_existing_cart = mysqli_query($conn, "SELECT * FROM cart WHERE user_id='$user_id' AND id_product='$product_id'");

if ($check_existing_cart->num_rows > 0) {
    $id = mysqli_fetch_assoc($check_existing_cart)['cart_id'];
    mysqli_query($conn, "UPDATE cart SET quantity_product=quantity_product + 1 WHERE cart_id='$id'");
} else {
    mysqli_query($conn, "INSERT INTO cart(user_id, id_product, quantity_product) VALUES('$user_id', '$product_id', '1')");
}

header("Location: cart.php");
