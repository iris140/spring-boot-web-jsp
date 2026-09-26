package com.iris.hai8tech.converter;

import com.iris.hai8tech.builder.BuildingSearchBuilder;
import com.iris.hai8tech.entity.BuildingEntity;
import com.iris.hai8tech.model.request.BuildingSearchRequest;
import com.iris.hai8tech.model.response.BuildingSearchResponse;
import com.iris.hai8tech.security.utils.MapUtil;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Component
public class BuildingSearchBuilderConvertor {

    public BuildingSearchBuilder toBuildingSearchBuilder(
            BuildingSearchRequest buildingSearchRequest,
            List<String> typeCode) {

        BuildingSearchBuilder buildingSearchBuilder =
                new BuildingSearchBuilder.Builder()
                        .setName(buildingSearchRequest.getName())
                        .setDistrict(buildingSearchRequest.getDistrict())
                        .setBuildingRank(buildingSearchRequest.getBuildingRank())
                        .setDirection(buildingSearchRequest.getDirection())
                        .setFloorArea(buildingSearchRequest.getFloorArea())
                        .setWard(buildingSearchRequest.getWard())
                        .setStreet(buildingSearchRequest.getStreet())
//                        .setDistrictId(buildingSearchRequest.getDistrictId())
                        .setNumberOfBasement(buildingSearchRequest.getNumberOfBasement())
                        .setTypeCode(typeCode)
                        .setManagerName(buildingSearchRequest.getManagerName())
                        .setManagerPhone(buildingSearchRequest.getManagerPhone())
                        .setRentPriceTo(buildingSearchRequest.getRentPriceTo())
                        .setRentPriceFrom(buildingSearchRequest.getRentPriceFrom())
                        .setAreaFrom(buildingSearchRequest.getAreaFrom())
                        .setAreaTo(buildingSearchRequest.getAreaTo())
                        .setStaffId(buildingSearchRequest.getStaffId())
                        .build();

        return buildingSearchBuilder;
    }

//    public BuildingSearchBuilder toBuildingSearchBuilder(Map<String, Object> params, List<String> typeCode) {
//
//        BuildingSearchBuilder buildingSearchBuilder = new BuildingSearchBuilder.Builder()
//                .setName(MapUtil.getObject(params, "name", String.class))
//                .setFloorArea(MapUtil.getObject(params, "floorArea", Long.class))
//                .setWard(MapUtil.getObject(params, "ward", String.class))
//                .setStreet(MapUtil.getObject(params, "street", String.class))
//                .setDistrictId(MapUtil.getObject(params, "districtId", Long.class))
//                .setNumberOfBasement(MapUtil.getObject(params, "numberofbasement", Integer.class))
//                .setTypeCode(typeCode)
//                .setManagerName(MapUtil.getObject(params, "managername", String.class))
//                .setManagerPhoneNumber(MapUtil.getObject(params, "managerphonenumber", String.class))
//                .setRentPriceTo(MapUtil.getObject(params, "rentpriceto", Long.class))
//                .setRentPriceFrom(MapUtil.getObject(params, "rentpricefrom", Long.class))
//                .setAreaFrom(MapUtil.getObject(params, "areaFrom", Long.class))
//                .setAreaTo(MapUtil.getObject(params, "areaTo", Long.class))
//                .setStaffId(MapUtil.getObject(params, "staffId", Long.class))
//                .build();
//
//        return buildingSearchBuilder;
//    }

}
