package com.iris.hai8tech.repository;

import com.iris.hai8tech.builder.BuildingSearchBuilder;
import com.iris.hai8tech.entity.BuildingEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.awt.print.Pageable;
import java.util.List;
@Repository
public interface BuildingRepository extends JpaRepository<BuildingEntity, Long>{
}
