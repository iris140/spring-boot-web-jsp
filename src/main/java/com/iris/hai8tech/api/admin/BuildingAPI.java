package com.iris.hai8tech.api.admin;

import com.iris.hai8tech.model.dto.AssignmentBuildingDTO;
import com.iris.hai8tech.model.dto.BuildingDTO;
import com.iris.hai8tech.model.response.ResponseDTO;
import com.iris.hai8tech.service.BuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RestController
@RequestMapping("/api/building")
public class BuildingAPI {

    @Autowired
    BuildingService buildingService;

    @PostMapping
    public BuildingDTO addOrUpdateBuilding(@RequestBody BuildingDTO buildingDTO) {

        buildingService.addOrUpdateBuilding(buildingDTO);
        return buildingDTO;
    }

    @DeleteMapping("/{ids}")
    public ResponseEntity<Void> deleteBuilding(@PathVariable("ids") Long[] ids) {
        //xuống DB xóa building theo danh sách id
        buildingService.deleteBuilding(ids);
        return ResponseEntity.noContent().build();
    }

    @GetMapping("/{id}/staffs")
    public ResponseDTO loadStaffs(@PathVariable Long id) {
        ResponseDTO result = buildingService.listStaffs(id);
        return result;
    }

    @PostMapping("/assignment")
    public void updateAssignmentBuilding(@RequestBody AssignmentBuildingDTO assignmentBuildingDTO){
        buildingService.addOrUpdateAssignmentBuilding(assignmentBuildingDTO);
    }

}
