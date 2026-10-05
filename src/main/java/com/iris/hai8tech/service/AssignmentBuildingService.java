package com.iris.hai8tech.service;

import com.iris.hai8tech.model.dto.AssignmentBuildingDTO;

public interface AssignmentBuildingService {
    void deleteByBuildingsIn(Long[] ids);
    void addAssignmentBuilding(AssignmentBuildingDTO assignmentBuildingDTO);
}
