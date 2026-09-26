package com.iris.hai8tech.repository.custom;

import com.iris.hai8tech.builder.BuildingSearchBuilder;
import com.iris.hai8tech.entity.BuildingEntity;
import com.iris.hai8tech.model.response.BuildingSearchResponse;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BuildingRepositoryCustom {
    List<BuildingEntity> findAll(BuildingSearchBuilder buildingSearchBuilder, Pageable pageable);
//    int countTotalItem(BuildingSearchResponse buildingSearchResponse);
    int countTotalItem(BuildingSearchBuilder BuildingSearchBuilder);
}
