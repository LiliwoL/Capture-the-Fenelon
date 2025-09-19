<?php
    $host = "03-docker-vulnerable-app-sqlinjection-mysql";
    $db_name = $_SERVER["MYSQL_DATABASE"];
    $db_username = $_SERVER["MYSQL_USER"];
    $db_password = $_SERVER["MYSQL_PASSWORD"];

    $conn = new mysqli($host, $db_username, $db_password, $db_name);
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
?>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>CRM Login</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                background-color: #f4f6f9;
            }
            .crm-card {
                max-width: 400px;
                margin: 60px auto;
                border-radius: 12px;
                box-shadow: 0 2px 8px rgba(0,0,0,0.08);
            }
            .crm-table {
                max-width: 600px;
                margin: 40px auto;
            }
        </style>
    </head>
<body>
<div class="container">
    <?php if (!isset($_POST['s'])): ?>
        <div class="card crm-card">
            <div class="card-body">
                <h3 class="card-title text-center mb-4">CRM Login</h3>
                <form action="" method="post">
                    <div class="mb-3">
                        <label for="user" class="form-label">User</label>
                        <input type="text" class="form-control" id="user" name="user" required>
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" class="form-control" id="password" name="password" required>
                    </div>
                    <div class="d-grid">
                        <button type="submit" class="btn btn-primary" name="s">Login</button>
                    </div>
                </form>
            </div>
        </div>
    <?php endif; ?>

<?php
if ($_POST) {
    $user = $_POST['user'];
    error_log("USERNAME:" . $user);
    $pass = $_POST['password'];
    error_log("PASSWORD:" . $pass);
    $sql = "select username, salary from users where username = '$user' and password = '$pass'";
    error_log("QUERY:" . $sql);

    if ($conn->multi_query($sql)) {
        do {
            echo '<div class="crm-table">';
            echo "<h4 class='mb-3'>Welcome, " . htmlspecialchars($user) . "</h4>";
            echo "<table class='table table-bordered table-striped'>";
            echo "<thead class='table-light'><tr><th>Username</th><th>Salary</th></tr></thead><tbody>";
            if ($result = $conn->store_result()) {
                while ($row = $result->fetch_assoc()) {
                    echo "<tr>";
                    echo "<td>" . htmlspecialchars($row['username']) . "</td>";
                    echo "<td>" . htmlspecialchars($row['salary']) . "</td>";
                    echo "</tr>";
                }
                $result->free();
            }
            echo "</tbody></table></div>";
        } while ($conn->next_result());
    }
}
?>
</div>
</body>
</html>
