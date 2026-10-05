package com.iris.hai8tech.utils;

public class StringUtil {
    public static boolean checkString(String data) {
        if (data != null && !data.equals("")) {
            return true;
        }
        return false;
    }
}
