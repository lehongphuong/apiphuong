<?php
    header("Access-Control-Allow-Origin: *");
    header('Content-Type: text/html; charset=utf-8');
    header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
    $servername = "localhost";  
    $username = "root";
    $password = ""; 
    $dbname = "izicar";

    // $username = "hoctien1_schools";
    // $password = "Anhyeuem1.";
    // $dbname = "hoctien1_schools";

    // $username = "id6417611_company_root";
    // $password = "Anhyeuem1.";
    // $dbname = "id6417611_company";
    
    
    $conn = new mysqli($servername, $username, $password, $dbname);
    // Check connection
    // if ($conn->connect_error) {
    //     die("Connection failed: " . $conn->connect_error);
    // } 
    mysqli_set_charset($conn,"utf8"); 

?> 