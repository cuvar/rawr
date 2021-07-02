<?php
header("Access-Control-Max-Age: 3600");


// Initialize the session
session_start();

// unset cookies and session
foreach ($_COOKIE as $k => $v) {
    setcookie($k, "", time() + 3600 * 24 * (-100), "/");
}
unset($_SESSION['loggedin']);
session_destroy();
session_write_close();

// redirect 
header("location: ../index.xml");
exit;
