package com.iris.hai8tech.service.impl;

import com.iris.hai8tech.entity.UserEntity;
import com.iris.hai8tech.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    private UserService userService;

//    @Override
//    public UserDetails loadUserByUsername(String username)
//            throws UsernameNotFoundException {
//
//        // 1. Lấy user từ database
//        UserEntity userEntity = userService.findByUsername(username);
//
//        // 2. Không tìm thấy user
//        if (userEntity == null) {
//            throw new UsernameNotFoundException(
//                    "Không tìm thấy tài khoản: " + username
//            );
//        }
//
//        // 3. Lấy quyền của user
//        List<GrantedAuthority> authorities = new ArrayList<>();
//
//        userEntity.getRoles().forEach(role -> {
//
//            authorities.add(
//                    new SimpleGrantedAuthority(
//                            "ROLE_" + role.getCode()
//                    )
//            );
//
//        });
//
//        // 4. Chuyển UserEntity thành UserDetails của Spring Security
//        return new org.springframework.security.core.userdetails.User(
//                userEntity.getUserName(),
//                userEntity.getPassword(),
//                authorities
//        );
//    }

    @Override
    public UserDetails loadUserByUsername(String username)
            throws UsernameNotFoundException {

        System.out.println("LOGIN USERNAME = " + username);

        UserEntity userEntity = userService.findByUsername(username);

        System.out.println("USER FOUND = " + (userEntity != null));

        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

        System.out.println("PASSWORD LENGTH = "
                + userEntity.getPassword().length());

        System.out.println("PASSWORD BCrypt = "
                + userEntity.getPassword().startsWith("$2"));

        System.out.println("PASSWORD MATCH = "
                + encoder.matches("123456", userEntity.getPassword()));

        if (userEntity == null) {
            throw new UsernameNotFoundException(
                    "Không tìm thấy tài khoản: " + username
            );
        }

        System.out.println("DB USERNAME = " + userEntity.getUserName());
        System.out.println("ROLE COUNT = " + userEntity.getRoles().size());

        List<GrantedAuthority> authorities = new ArrayList<>();

        userEntity.getRoles().forEach(role -> {
            authorities.add(
                    new SimpleGrantedAuthority(
                            "ROLE_" + role.getCode()
                    )
            );
        });

        return new org.springframework.security.core.userdetails.User(
                userEntity.getUserName(),
                userEntity.getPassword(),
                authorities
        );
    }
}
