package com.iris.hai8tech.service.impl;

import com.iris.hai8tech.entity.UserEntity;
import com.iris.hai8tech.repository.UserRepository;
import com.iris.hai8tech.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;

    @Override
    public UserEntity findByUsername(String username) {
        return userRepository.findByUserName(username);
    }

    @Override
    public UserEntity findById(Long id) {
        return userRepository.findById(id).orElse(null);
    }

    @Override
    public List<UserEntity> findAll() {
        return userRepository.findAll();
    }

    @Override
    public UserEntity save(UserEntity user) {
        return userRepository.save(user);
    }

    @Override
    public void delete(Long id) {
        userRepository.deleteById(id);
    }

    @Override
    public Map<Long, String> getStaffs() {
        Map<Long, String> listStaffs = new HashMap<>();
        List<UserEntity> staffs = userRepository.findByStatusAndRoles_Code(1, "STAFF");

        for (UserEntity it : staffs){
            listStaffs.put(it.getId(), it.getFullName());
        }
        return listStaffs;
    }
}
