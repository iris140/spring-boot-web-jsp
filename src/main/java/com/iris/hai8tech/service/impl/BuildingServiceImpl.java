package com.iris.hai8tech.service.impl;

import com.iris.hai8tech.builder.BuildingSearchBuilder;
import com.iris.hai8tech.converter.BuildingConvertor;
import com.iris.hai8tech.converter.BuildingSearchBuilderConvertor;
import com.iris.hai8tech.entity.BuildingEntity;
import com.iris.hai8tech.entity.UserEntity;
import com.iris.hai8tech.model.dto.AssignmentBuildingDTO;
import com.iris.hai8tech.model.dto.BuildingDTO;
import com.iris.hai8tech.model.request.BuildingSearchRequest;
import com.iris.hai8tech.model.response.BuildingSearchResponse;
import com.iris.hai8tech.model.response.ResponseDTO;
import com.iris.hai8tech.model.response.StaffResponseDTO;
import com.iris.hai8tech.repository.BuildingRepository;
import com.iris.hai8tech.repository.UserRepository;
import com.iris.hai8tech.repository.custom.BuildingRepositoryCustom;
import com.iris.hai8tech.service.BuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

@Service
public class BuildingServiceImpl implements BuildingService {

    @Autowired
    private BuildingRepositoryCustom buildingRepositoryCustom;

    @Autowired
    private BuildingRepository buildingRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private BuildingSearchBuilderConvertor buildingSearchBuilderConverter;

    @Autowired
    private BuildingConvertor buildingConvertor;

    @Override
    public List<BuildingSearchResponse> findAll(BuildingSearchRequest buildingSearchRequest, Pageable pageable) {

        List<String> typeCode = buildingSearchRequest.getTypeCode();
        BuildingSearchBuilder buildingSearchBuilder = buildingSearchBuilderConverter.toBuildingSearchBuilder(buildingSearchRequest, typeCode);

        List<BuildingEntity> buildingEntities = buildingRepositoryCustom.findAll(buildingSearchBuilder, pageable);
        List<BuildingSearchResponse> res = new ArrayList<>();

        for(BuildingEntity item : buildingEntities)
        {
            BuildingSearchResponse building = buildingConvertor.toBuildingSearchResponse(item);
            res.add(building);
        }

        return res;
    }

    @Override
    public ResponseDTO listStaffs(Long buildingId) {

        Optional<BuildingEntity> buildingOptional =
                buildingRepository.findById(buildingId);

        if (!buildingOptional.isPresent()) {
            throw new RuntimeException("Building not found: " + buildingId);
        }

        BuildingEntity buildingEntity = buildingOptional.get();

        List<UserEntity> staffs = userRepository.findByStatusAndRoles_Code(1, "STAFF");
        List<UserEntity> staffAssignment = buildingEntity.getUserEntities();
        List<StaffResponseDTO> staffResponseDTOS = new ArrayList<>();
        ResponseDTO responseDTO = new ResponseDTO();

        for (UserEntity it : staffs) {
            StaffResponseDTO staffResponseDTO = new StaffResponseDTO();
            staffResponseDTO.setFullName(it.getFullName());
            staffResponseDTO.setStaffId(it.getId());
            if (staffAssignment.contains(it)) {
                staffResponseDTO.setChecked("checked");
            } else {
                staffResponseDTO.setChecked("");
            }
            staffResponseDTOS.add(staffResponseDTO);
        }

        responseDTO.setData(staffResponseDTOS);
        responseDTO.setMessage("success");
        return responseDTO;
    }

    @Override
    @Transactional
    public void deleteBuilding(Long[] ids) {
//        BuildingEntity buildingEntity = buildingRepository.findById(ids[0]).orElse(null);
        buildingRepository.deleteByIdIn(ids);
    }

    @Override
    public BuildingDTO addOrUpdateBuilding(BuildingDTO buildingDTO) {

    	BuildingEntity buildingEntity = buildingConvertor.toBuildingEnity(buildingDTO);
    	buildingRepository.save(buildingEntity);
        return buildingDTO;
    }

    @Override
    public BuildingDTO findById(Long id) {
        BuildingEntity buildingEntity = buildingRepository.findById(id).orElse(null);
        BuildingDTO buildingDTO = buildingConvertor.toBuildingDTO(buildingEntity);
        return buildingDTO;
    }

    @Override
    public int countTotalItem(List<BuildingSearchResponse> list) {
        return list.size();
    }

    @Override
    public int countTotalItem(BuildingSearchRequest buildingSearchRequest) {
        List<String> typeCode = buildingSearchRequest.getTypeCode();

        BuildingSearchBuilder buildingSearchBuilder =
                buildingSearchBuilderConverter.toBuildingSearchBuilder(
                        buildingSearchRequest,
                        typeCode
                );

        return buildingRepositoryCustom.countTotalItem(
                buildingSearchBuilder
        );
    }

    @Override
    public AssignmentBuildingDTO addOrUpdateAssignmentBuilding(AssignmentBuildingDTO assignmentBuildingDTO) {

        BuildingEntity buildingEntity = buildingRepository.findById(assignmentBuildingDTO.getBuildingId()).get();
        List<UserEntity> staffs = userRepository.findByIdIn(assignmentBuildingDTO.getStaffs());
//        List<Long> staffs = assignmentBuildingDTO.getStaffs();
//
//        for (Long staffId : staffs) {
//            UserEntity userEntity = userRepository.findById(staffId).get();
//            userEntities.add(userEntity);
//        }
        buildingEntity.setUserEntities(staffs);
        buildingRepository.save(buildingEntity);

        return assignmentBuildingDTO;
    }
}
