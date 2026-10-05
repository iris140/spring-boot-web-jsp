package com.iris.hai8tech.service;

import com.iris.hai8tech.entity.BuildingEntity;
import com.iris.hai8tech.model.dto.BuildingDTO;
import com.iris.hai8tech.model.request.BuildingSearchRequest;
import com.iris.hai8tech.model.response.BuildingSearchResponse;
import com.iris.hai8tech.model.response.ResponseDTO;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface BuildingService {

    List<BuildingSearchResponse> findAll(BuildingSearchRequest buildingSearchRequest, Pageable pageable);

    ResponseDTO listStaffs(Long buildingId);

    void deleteBuilding(Long[] ids);

    BuildingDTO addOrUpdateBuilding(BuildingDTO buildingDTO);

    BuildingEntity findById(Long id);

    int countTotalItem(List<BuildingSearchResponse> list);

    //    int countTotalItem(List<BuildingSearchResponse> list);
    int countTotalItem(BuildingSearchRequest buildingSearchRequest);
}
