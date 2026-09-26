package com.iris.hai8tech.service;

import com.iris.hai8tech.entity.UserEntity;

import java.util.List;
import java.util.Map;

public interface UserService {
    UserEntity findByUsername(String username);

    UserEntity findById(Long id);

    List<UserEntity> findAll();

    UserEntity save(UserEntity user);

    void delete(Long id);

    Map<Long, String> getStaffs();
}
