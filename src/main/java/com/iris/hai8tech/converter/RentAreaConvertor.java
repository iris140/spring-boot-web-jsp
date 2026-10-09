package com.iris.hai8tech.converter;

import java.util.ArrayList;
import java.util.List;

import com.iris.hai8tech.entity.BuildingEntity;
import com.iris.hai8tech.entity.RentAreaEntity;
import com.iris.hai8tech.model.dto.BuildingDTO;
import org.springframework.stereotype.Component;

@Component
public class RentAreaConvertor {

	public RentAreaEntity toRentAreaEntity(String val, BuildingEntity buildingEntity) {
		RentAreaEntity res = new RentAreaEntity();
		res.setBuilding(buildingEntity);
		res.setValue(val);
		return res;
	}

	public List<RentAreaEntity> toRentAreaEntityList(BuildingDTO buildingDTO, BuildingEntity buildingEntity) {
		String[] rentArea = buildingDTO.getRentArea().split(",");
		List<RentAreaEntity> rentAreaEntities = new ArrayList<>();

		for (String val : rentArea) {
			rentAreaEntities.add(toRentAreaEntity(val, buildingEntity));
		}
		return rentAreaEntities;
	}

}
