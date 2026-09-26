package com.iris.hai8tech.converter;

import com.iris.hai8tech.entity.BuildingEntity;
import com.iris.hai8tech.entity.RentAreaEntity;
import com.iris.hai8tech.enums.District;
import com.iris.hai8tech.model.response.BuildingSearchResponse;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Component
public class BuildingConvertor {
    @Autowired
    private ModelMapper modelMapper;

    public BuildingSearchResponse toBuildingSearchResponse(BuildingEntity buildingEntity)
    {
        BuildingSearchResponse res = modelMapper.map(buildingEntity, BuildingSearchResponse.class);
        List<RentAreaEntity> rentAreaEntities = buildingEntity.getRentAreaEntities();

        String rentArea = rentAreaEntities.stream().map(it -> it.getValue().toString()).collect(Collectors.joining(", "));
        res.setRentArea(rentArea);

        Map<String, String> districts = District.dicstrictMap();

        String districtName = "";
        if(buildingEntity.getDistrict() != null && buildingEntity.getDistrict() != "")
        {
            districtName = districts.get(buildingEntity.getDistrict());
        }

        if(districtName != null && districtName != "")
        {
            res.setAddress(buildingEntity.getStreet() + ", " + buildingEntity.getWard() + ", " + districtName);
        }
        return res;
    }
}
