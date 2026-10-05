package com.iris.hai8tech.service.impl;

import com.iris.hai8tech.converter.RentAreaConvertor;
import com.iris.hai8tech.entity.BuildingEntity;
import com.iris.hai8tech.entity.RentAreaEntity;
import com.iris.hai8tech.model.dto.BuildingDTO;
import com.iris.hai8tech.repository.BuildingRepository;
import com.iris.hai8tech.repository.RentAreaRepository;
import com.iris.hai8tech.service.RentAreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RentAreaServiceImpl implements RentAreaService {

    @Autowired
    RentAreaRepository rentAreaRepository;

    @Autowired
    BuildingRepository buildingRepository;

    @Autowired
    private RentAreaConvertor rentAreaConvertor;

    @Override
    public RentAreaEntity findById(Long id) {
        return rentAreaRepository.findById(id).get();
    }

    @Override
    public void addRentArea(BuildingDTO buildingDTO) {

        BuildingEntity buildingEntity = buildingRepository.findById(buildingDTO.getId()).get();
        rentAreaRepository.deleteByBuilding(buildingEntity);

        String[] rentAreas = buildingDTO.getRentArea().trim().split(",");

        for (String val : rentAreas) {
            RentAreaEntity rentAreaEntity = rentAreaConvertor.toRentAreaEntity(buildingDTO, val);
            rentAreaRepository.save(rentAreaEntity);
        }
    }

    @Override
    public void deleteByBuildingsIn(Long[] ids) {
        for(Long id : ids) {

            BuildingEntity buildingEntity = buildingRepository.findById(id).get();
            rentAreaRepository.deleteByBuilding(buildingEntity);
        }
    }
}
