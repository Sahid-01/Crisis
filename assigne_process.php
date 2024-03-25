<?php
session_start();

// Check if the user is logged in
if (!isset($_SESSION["username"])) {
    // If not logged in, redirect to the login page
    header("Location: login.php");
    exit();
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Database connection settings
    $servername = "localhost";
    $dbUsername = "root";
    $dbPassword = "";
    $dbname = "crisiscrew20"; // Change to the appropriate database name

    // Create a connection to the database
    $conn = new mysqli($servername, $dbUsername, $dbPassword, $dbname);

    // Check the connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    // Get data from the form
    // Modify this part based on your form fields
    $taskId = $_POST["task_id"];
    $volunteerId = $_POST["volunteer_id"];
    $message = $_POST["message"];

    // Insert assignment into the "assignee" table
    $sql = "INSERT INTO assignee (task_id, id, message) VALUES (?, ?, ?)";
    $stmt = $conn->prepare($sql);

    if ($stmt === false) {
        die("Error preparing statement: " . $conn->error);
    }

    // Bind parameters
    $stmt->bind_param("iis", $taskId, $volunteerId, $message);

    // Execute the query
    if ($stmt->execute()) {
        // Assignment successful, redirect to a success page
        header("Location: admin_dashboard.php");
        exit();
    } else {
        echo "Error executing query: " . $stmt->error;
    }

    $stmt->close();
    $conn->close();
} else {
    // If the form was not submitted through POST, redirect to an error page or handle accordingly
    echo "Invalid request";
}
?>
