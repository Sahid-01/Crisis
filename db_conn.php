<?php
$servername = "localhost";
$dbUsername = "root";
$dbPassword= "";
$dbname = "crisiscrew20";

        // Create a connection to the database
$conn = new mysqli($servername, $dbUsername,$dbPassword, $dbname);

        // Check the connection
if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
}