package com.iris.hai8tech.converter;

import com.iris.hai8tech.entity.BuildingEntity;
import com.iris.hai8tech.entity.RentAreaEntity;
import com.iris.hai8tech.model.dto.BuildingDTO;
import org.springframework.stereotype.Component;

@Component
public class RentAreaConvertor {

    public RentAreaEntity toRentAreaEntity(BuildingDTO buildingDTO, String val) {
        BuildingEntity buildingEntity = new BuildingEntity();
        buildingEntity.setId(buildingDTO.getId());

        RentAreaEntity rentAreaEntity = new RentAreaEntity();
        rentAreaEntity.setValue(val);
        rentAreaEntity.setBuilding(buildingEntity);

        return rentAreaEntity;
    }
}
