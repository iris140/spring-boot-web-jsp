package com.iris.hai8tech;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class PasswordGenerator {
    public static void main(String[] args) {

        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

        String rawPassword = "123456";

        String encodedPassword = encoder.encode(rawPassword);

        System.out.println("Encoded password:");
        System.out.println(encodedPassword);

        System.out.println("Match:");
        System.out.println(
                encoder.matches(rawPassword, encodedPassword)
        );
    }
}
