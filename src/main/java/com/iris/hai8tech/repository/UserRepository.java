package com.iris.hai8tech.repository;

import com.iris.hai8tech.entity.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface UserRepository extends JpaRepository<UserEntity, Long> {

    UserEntity findByUserName(String username);
    List<UserEntity> findByStatusAndRoles_Code(Integer status, String roleCode);
}
