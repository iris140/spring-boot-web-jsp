package com.iris.hai8tech.service.impl;

import com.iris.hai8tech.entity.AssignBuildingEntity;
import com.iris.hai8tech.entity.BuildingEntity;
import com.iris.hai8tech.entity.UserEntity;
import com.iris.hai8tech.model.dto.AssignmentBuildingDTO;
import com.iris.hai8tech.repository.AssignmentBuildingRepository;
import com.iris.hai8tech.repository.BuildingRepository;
import com.iris.hai8tech.repository.UserRepository;
import com.iris.hai8tech.service.AssignmentBuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class AssignmentBuildingServiceImpl implements AssignmentBuildingService {

    @Autowired
    private AssignmentBuildingRepository assignmentBuildingRepository;

    @Autowired
    private BuildingRepository buildingRepository;

    @Autowired
    private UserRepository userRepository;

    @Override
    public void deleteByBuildingsIn(Long[] ids) {
        for (Long id : ids) {
            BuildingEntity buildingEntity = buildingRepository.findById(id).get();
            assignmentBuildingRepository.deleteById(id);
        }
    }

    @Override
    public void addAssignmentBuilding(AssignmentBuildingDTO assignmentBuildingDTO) {
        BuildingEntity buildingEntity = buildingRepository.findById(assignmentBuildingDTO.getBuildingId()).get();
        assignmentBuildingRepository.deleteByBuildingEntity(buildingEntity);
        List<Long> staffId =  assignmentBuildingDTO.getStaffs();
        for(Long it : staffId){
            AssignBuildingEntity assignBuildingEntity = new AssignBuildingEntity();
            assignBuildingEntity.setBuildingEntity(buildingEntity);

            UserEntity userEntity = userRepository.findById(it).get();
            assignBuildingEntity.setUserEntity(userEntity);

            assignmentBuildingRepository.save(assignBuildingEntity);
        }
    }
}
