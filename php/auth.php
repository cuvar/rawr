<?php
class Auth {
    /**
     * returns the specific user array based on a given username
     * @param string $username username of the corresponding user
     * @param string $group group to check
     * @return boolean True, if user owns given group. False, if user does not exist, or if user does not own given group
     */
    public static function hasGroup(String $username, String $group) {
        $user = Auth::getUser($username);
        # user not found -> return false
        if (sizeof($user) == 0) {
            return false;
        }
        $user = array_values($user)[0];
        $hasGroup =  (isset($user["TINF20B2"]) && $user["TINF20B2"]);
        return $hasGroup;
    }
    /**
     * returns whether a specific user is admin
     * @param string $username username of the corresponding user
     * @return boolean True, if user is admin. False, if user does not exist, or if user is not an admin
     */
    public static function isAdmin(String $username) {
        $user = Auth::getUser($username);
        # user not found -> return false
        if (sizeof($user) == 0) {
            return false;
        }
        $hasGroup =  isset($user["admin"]) && $user["admin"];
        return $hasGroup;
    }
    /**
     * authentificates a user based on username and password
     * @param string $username username of the corresponding user
     * @param string $password supplied password (e.g. by client)
     * @return boolean True, if password matches. False, if user does not exist or if password is wrong
     */
    public static function authentificate(String $username, String $password) {
        $user = Auth::getUser($username);
        if (sizeof($user) == 0) {
            return false;
        }
        $user = array_values($user);
        # user not found -> return false
        return password_verify($password, $user[0]["password"]);
    }
    /**
     * returns the specific user array based on username
     * @param string $username username of the corresponding user
     * @return array array containing information about user
     */
    private static function getUser(String $username) {
        $config = parse_ini_file("config.ini", true);
        $user = array_filter($config["users"], function ($user) use ($username) {
            return $username ==  $user["username"];
        });
        return $user;
    }
}
