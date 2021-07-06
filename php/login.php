<?php
header("Access-Control-Max-Age: 3600");


$config = parse_ini_file("config.ini", true);

isset($_POST['username']) or die("no username specified");
isset($_POST['password']) or die("no password specified");


// Initialize the session
session_start();

// Check if the user is already logged in, if yes then redirect him to main page
if (isset($_SESSION["loggedin"]) && isset($_COOKIE["loggedin"]) && $_COOKIE["loggedin"] == "true" && $_SESSION["loggedin"] === true) {
    header("location: ../index.php");
    exit;
}

// Define variables and initialize with empty values
$username = $password = "";

// Processing form data when form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Check if username is empty
    if (empty(trim($_POST["username"]))) {
        $error = "Please enter username.";
    } else {
        $username = trim($_POST["username"]);
    }
    // Check if password is empty
    if (empty($_POST["password"])) {
        $error = "Please enter your password.";
    } else {
        $password = $_POST["password"];
    }
    // Validate credentials
    if (!empty($username) && !empty($password)) {
        $user_object = array_filter($config["users"], function ($user) use ($username) {
            return $username ==  $user["username"];
        });
        $user_object = array_values($user_object);
        if (isset($user_object[0]) && password_verify($password, $user_object[0]["password"])) {
            // Set cookies
            setcookie("loggedin", "true", time() + 3600, "/");
            setcookie("write", $user_object[0]["write"], time() + 3600, "/");
            setcookie("username", $username, time() + 3600, "/");

            // Store data in session variables
            $_SESSION["loggedin"] = true;
            $_SESSION["username"] = $username;
            $_SESSION["write"] = $user_object[0]["write"] == "true";
            $_SESSION["id"] = $user_object[0]["id"];
        } else {
            // Password is not valid, set error message accordingly
            $error = "Invalid username or password.";
        }
    }
}
// redirect to page
header("location: ../index.php");
// may be omitted, if there is another way of indicating an error
if (isset($error)) {
    echo '<script>alert("' . $error . ' ")</script>';
}
