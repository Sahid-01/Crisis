<?php
// Database connection settings
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "crisiscrew20"; // Change to your database name

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Retrieve data from the assigned tasks view
$sql = "SELECT * FROM assigned_tasks_view";
$result = $conn->query($sql);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="images/CrisisCrew.png" type="image/x-icon">
    <title>Assigned Tasks</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap/dist/css/bootstrap.min.css">
    <style>
        /* Sidebar Styles */
        .sidebar {
            background-color: #343a40;
            color: #dee2e6;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
        }
        .list-group a {
            color: #adb5bd;
        }
        .list-group a:hover {
            background-color: #495057;
        }

        /* Main Content Styles */
        body {
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 20px;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #343a40;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #ddd;
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Assigned Tasks</h2>
        <table class="table">
            <thead>
                <tr>
                    <th>Assignee ID</th>
                    <th>Volunteer Name</th>
                    <th>Task Name</th>
                    <th>Task Description</th>
                    <th>Message</th>
                </tr>
            </thead>
            <tbody>
                <?php
                if ($result->num_rows > 0) {
                    // Output data of each row
                    while($row = $result->fetch_assoc()) {
                        echo "<tr>";
                        echo "<td>" . $row["assignee_id"] . "</td>";
                        echo "<td>" . $row["volunteer_firstName"] . " " . $row["volunteer_lastName"] . "</td>";
                        echo "<td>" . $row["task_name"] . "</td>";
                        echo "<td>" . $row["task_description"] . "</td>";
                        echo "<td>" . $row["message"] . "</td>";
                        echo "</tr>";
                    }
                } else {
                    echo "<tr><td colspan='5'>No assigned tasks</td></tr>";
                }
                ?>
            </tbody>
        </table>
        <div class="text-center">
            <a href="admin_dashboard.php" class="btn btn-primary">Dashboard</a>
        </div>
    </div>
</body>
</html>

<?php
// Close the database connection
$conn->close();
?>
