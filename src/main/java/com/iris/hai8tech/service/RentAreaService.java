package com.iris.hai8tech.service;

import com.iris.hai8tech.entity.RentAreaEntity;
import com.iris.hai8tech.model.dto.BuildingDTO;

public interface RentAreaService {
    RentAreaEntity findById(Long id);
    void addRentArea(BuildingDTO buildingDTO);
    void deleteByBuildingsIn(Long[] ids);
}
