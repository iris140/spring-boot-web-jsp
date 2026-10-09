package com.iris.hai8tech.repository;

import com.iris.hai8tech.entity.BuildingEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BuildingRepository extends JpaRepository<BuildingEntity, Long>{
    void deleteByIdIn(Long[] id);
}
