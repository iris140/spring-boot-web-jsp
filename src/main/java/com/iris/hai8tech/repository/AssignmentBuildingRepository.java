package com.iris.hai8tech.repository;

import com.iris.hai8tech.entity.AssignBuildingEntity;
import com.iris.hai8tech.entity.BuildingEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface AssignmentBuildingRepository extends JpaRepository<AssignBuildingEntity, Long> {
    void  deleteByBuildingEntity(BuildingEntity buildingEntity);
    List<AssignBuildingEntity> findByBuildingEntity(BuildingEntity buildingEntity);
    void deleteByBuildingEntity_IdIn(List<Long> buildingIds);
}
