<?php
session_start();

// Check if the user is logged in
if (!isset($_SESSION["username"])) {
    // If not logged in, redirect to the login page
    header("Location: login.php");
    exit();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="images/CrisisCrew.png" type="image/x-icon">
    <title>Admin Dashboard</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap/dist/css/bootstrap.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/style.css">
    <style>
        /* Additional Styles */
        .table-container {
            max-width: 800px;
            margin: 0 auto;
        }
        /* Adjustments for Admin Appearance */
        body {
            background-color: #f8f9fa; /* Light gray background */
        }
        .sidebar {
            background-color: #343a40; /* Dark background color for the sidebar */
            color: #dee2e6; /* Light text color for the sidebar */
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1); /* Subtle box shadow for the sidebar */
        }
        .list-group a {
            color: #adb5bd; /* Light text color for sidebar links */
        }
        .list-group a:hover {
            background-color: #495057; /* Darker background color on hover */
        }
        .welcome-message {
            background-color: #ffffff; /* White background for the main content area */
            padding: 20px;
            border-radius: 8px; /* Rounded corners for the content area */
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* Subtle box shadow for the content area */
            margin-top: 20px;
        }
        .welcome-message h4 {
            color: #343a40; /* Dark text color for the welcome message header */
        }
        .welcome-message p {
            color: #6c757d; /* Gray text color for the welcome message paragraph */
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <nav class="col-12 col-md-3 col-lg-2 sidebar">
            <a href="index.php">
                <img src="images/CrisisCrew.png" alt="logo" class="img-fluid" />
            </a>
            <!-- Sidebar Navigation Links -->
            <div class="list-group mt-3">
                <a href="admin_dashboard.php">Dashboard</a>
                <a href="add_event.php">Add Event</a>
                <a href="add_task.php">Add Task</a>
                <a href="add_resource.php">Add Resource</a>
                <a href="task_management.php">Task Management</a>
                <a href="view.php">Assigned Tasks</a>
                <a href="resource_management.php">Resource Management</a>
            </div>
            <!-- Logout Link -->
            <footer class="mt-3">
                <a href="logout.php" style="color: #adb5bd">Logout</a>
            </footer>
        </nav>
        <!-- Main Content Area -->
        <div class="col-lg-10 col-md-9 col-12">
            <div class="welcome-message">
                <h4 style="color: #343a40">Welcome, <?php echo htmlspecialchars($_SESSION['username']); ?>!</h4>
                <p style="color: #6c757d">
                    This is the admin dashboard. You can manage events, tasks, and resources from here.
                </p>
                <!-- Form to assign a task to a volunteer -->
                <h5>Assign Task to Volunteer</h5>
                <form method="POST" action="assigne_process.php">
                    <div class="form-group">
                        <label for="task_id">Task:</label>
                        <!-- Dynamically populate this select dropdown with available tasks -->
                        <select class="form-control" id="task_id" name="task_id" required>
                            <option value="">Select Task</option>
                            <?php
                            // Database connection settings
                            $servername = "localhost";
                            $username = "root";
                            $password = "";
                            $dbname = "crisiscrew20"; // Replace 'your_database_name' with your actual database name

                            // Create connection
                            $conn = new mysqli($servername, $username, $password, $dbname);

                            // Check connection
                            if ($conn->connect_error) {
                                die("Connection failed: " . $conn->connect_error);
                            }

                            // Fetch task data from the database
                            $sql = "SELECT task_id, name FROM task_event"; // Assuming 'task_event' table has 'task_id' and 'name' columns
                            $result = $conn->query($sql);

                            // Check if there are any tasks
                            if ($result->num_rows > 0) {
                                // Output data of each row
                                while($row = $result->fetch_assoc()) {
                                    // Output each task as an option in the select dropdown
                                    echo '<option value="' . $row["task_id"] . '">' . $row["name"] . '</option>';
                                }
                            } else {
                                echo '<option value="">No tasks available</option>';
                            }

                            // Close the database connection
                            $conn->close();
                            ?>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="volunteer_id">Volunteer:</label>
                        <!-- Dynamically populate this select dropdown with available volunteers -->
                        <select class="form-control" id="volunteer_id" name="volunteer_id" required>
                            <option value="">Select Volunteer</option>
                            <?php
                            // Database connection settings
                            $servername = "localhost";
                            $username = "root";
                            $password = "";
                            $dbname = "crisiscrew20"; // Replace 'your_database_name' with your actual database name

                            // Create connection
                            $conn = new mysqli($servername, $username, $password, $dbname);

                            // Check connection
                            if ($conn->connect_error) {
                                die("Connection failed: " . $conn->connect_error);
                            }

                            // Fetch volunteer data from the database
                            $sql = "SELECT id, firstName, lastName FROM volunteers"; // Assuming 'volunteers' table has 'id', 'firstName', and 'lastName' columns
                            $result = $conn->query($sql);

                            // Check if there are any volunteers
                            if ($result->num_rows > 0) {
                                // Output data of each row
                                while($row = $result->fetch_assoc()) {
                                    // Output each volunteer as an option in the select dropdown
                                    echo '<option value="' . $row["id"] . '">' . $row["firstName"] . " " . $row["lastName"] .'</option>';
                                }
                            } else {
                                echo '<option value="">No volunteers available</option>';
                            }

                            // Close the database connection
                            $conn->close();
                            ?>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="message">Message:</label>
                        <textarea class="form-control" id="message" name="message" rows="3"></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary">Assign Task</button>
                </form>
                <!-- End of assignment form -->
            </div>
        </div>
    </div>
</div>
<!-- Bootstrap JS and dependencies (optional) -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
