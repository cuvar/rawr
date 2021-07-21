<?php
class Auth {
    /**
     * returns the specific user array based on a given username
     * @param string $username username of the corresponding user
     * @param string $group group to check
     * @return bool True, if user owns given group. False, if user does not exist, or if user does not own given group
     */
    public static function hasGroup(string $username, string $group) {
        $user = Auth::getUser($username);
        # user not found -> return false
        if (sizeof($user) == 0) {
            return false;
        }
        $user = array_values($user)[0];
        $hasGroup =  (isset($user[$group]) && $user[$group]);
        return $hasGroup;
    }
    /**
     * returns whether a specific user is admin
     * @param string $username username of the corresponding user
     * @return bool True, if user is admin. False, if user does not exist, or if user is not an admin
     */
    public static function isAdmin(string $username) {
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
     * @return bool True, if password matches. False, if user does not exist or if password is wrong
     */
    public static function authentificate(string $username, string $password) {
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
    private static function getUser(string $username) {
        $config = parse_ini_file("config.ini", true);
        $user = array_filter($config["users"], function ($user) use ($username) {
            return $username ==  $user["username"];
        });
        return $user;
    }
    /**
     * returns the specific permissions of a user based on username
     * @param string $username username of the corresponding user 
     * @return array array containing all permissions of user. Empty array, if user not found or if user does not have any permissions.
     */
    public static function getPerms(string $username) {
        # array contains all keys, corresponding to a "non-permission"- value
        $NO_PERMS = ["username", "password", "id"];

        $user = Auth::getUser($username);
        # user not found -> return empty array
        if (sizeof($user) == 0) {
            return [];
        }
        $user = array_values($user)[0];
        # filter array keys
        $filtered = array_filter(
            $user,
            function ($key) use ($NO_PERMS, $user) {
                return !in_array($key, $NO_PERMS) && $user[$key];
            },
            ARRAY_FILTER_USE_KEY
        );
        return array_keys($filtered);
    }
}
