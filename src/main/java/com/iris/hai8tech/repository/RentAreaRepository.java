package com.iris.hai8tech.repository;

import com.iris.hai8tech.entity.BuildingEntity;
import com.iris.hai8tech.entity.RentAreaEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RentAreaRepository extends JpaRepository<RentAreaEntity, Long> {
    void deleteByBuilding(BuildingEntity buildingEntity);
}
