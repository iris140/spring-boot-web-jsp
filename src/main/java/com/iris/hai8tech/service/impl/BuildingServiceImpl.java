package com.iris.hai8tech.service.impl;

import com.iris.hai8tech.builder.BuildingSearchBuilder;
import com.iris.hai8tech.converter.BuildingConvertor;
import com.iris.hai8tech.converter.BuildingSearchBuilderConvertor;
import com.iris.hai8tech.entity.BuildingEntity;
import com.iris.hai8tech.entity.UserEntity;
import com.iris.hai8tech.model.dto.BuildingDTO;
import com.iris.hai8tech.model.request.BuildingSearchRequest;
import com.iris.hai8tech.model.response.BuildingSearchResponse;
import com.iris.hai8tech.model.response.ResponseDTO;
import com.iris.hai8tech.model.response.StaffResponseDTO;
import com.iris.hai8tech.repository.BuildingRepository;
import com.iris.hai8tech.repository.UserRepository;
import com.iris.hai8tech.repository.custom.BuildingRepositoryCustom;
import com.iris.hai8tech.service.AssignmentBuildingService;
import com.iris.hai8tech.service.BuildingService;
import com.iris.hai8tech.service.RentAreaService;
import com.iris.hai8tech.utils.StringUtil;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

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

    @Autowired
    private ModelMapper modelMapper;

    @Autowired
    private RentAreaService rentAreaService;

    @Autowired
    private AssignmentBuildingService assignmentBuildingService;

    @Override
    public List<BuildingSearchResponse> findAll(BuildingSearchRequest buildingSearchRequest, Pageable pageable) {

        List<String> typeCode = buildingSearchRequest.getTypeCode();
        BuildingSearchBuilder buildingSearchBuilder = buildingSearchBuilderConverter.toBuildingSearchBuilder(buildingSearchRequest, typeCode);

        List<BuildingEntity> buildingEntities = buildingRepositoryCustom.findAll(buildingSearchBuilder, pageable);
        List<BuildingSearchResponse> res = new ArrayList<>();

        for (BuildingEntity item : buildingEntities) {
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


    // chưa làm cascade thì làm thử công như bên dưới
    @Override
    public void deleteBuilding(Long[] ids) {
        rentAreaService.deleteByBuildingsIn(ids);// deleteByBuildingIdIn()
        assignmentBuildingService.deleteByBuildingsIn(ids);
        for (Long id : ids) {
            buildingRepository.deleteById(id);
        }
    }

    @Override
    public BuildingDTO addOrUpdateBuilding(BuildingDTO buildingDTO) {

        BuildingEntity buildingEntity = modelMapper.map(buildingDTO, BuildingEntity.class);
        ;
//        if (buildingDTO.getId() != null) {
//            buildingEntity = buildingRepository.findById(buildingDTO.getId()).get();
//        }

        buildingEntity.setTypeCode(String.join(",", buildingDTO.getTypeCode()));
        buildingRepository.save(buildingEntity);
        if (StringUtil.checkString(buildingDTO.getRentArea())) rentAreaService.addRentArea(buildingDTO);
        return buildingDTO;

//            if(!checkAddBuilding(buildingDTO)) return null;
//            Long buildingId = buildingDTO.getId();
//            BuildingEntity buildingEntity = modelMapper.map(buildingDTO, BuildingEntity.class);
//            buildingEntity.setTypeCode(removeAccent(buildingDTO.getTypeCode()));
//            if (buildingId != null)
//            { // update
//                BuildingEntity foundBuilding = buildingRepository.findById(buildingId)
//                        .orElseThrow(() -> new NotFoundException("Building not found!"));
//                buildingEntity.setImage(foundBuilding.getImage());
//            }
//            saveThumbnail(buildingDTO, buildingEntity);
//            buildingRepository.save(buildingEntity);
//            buildingDTO.setId(buildingEntity.getId());
//            if(StringUtils.check(buildingDTO.getRentArea())) rentAreaService.addRentArea(buildingDTO);
    }

//    private void saveThumbnail(BuildingDTO buildingDTO, BuildingEntity buildingEntity)
//    {
//        String path = "/building/" + buildingDTO.getImageName();
//        if (null != buildingDTO.getImageBase64())
//        {
//            if (null != buildingEntity.getImage())
//            {
//                if (!path.equals(buildingEntity.getImage()))
//                {
//                    File file = new File("C://home/office" + buildingEntity.getImage());
//                    file.delete();
//                }
//            }
//            byte[] bytes = Base64.decodeBase64(buildingDTO.getImageBase64().getBytes());
//            uploadFileUtils.writeOrUpdate(path, bytes);
//            buildingEntity.setImage(path);
//        }
//    }

    @Override
    public BuildingEntity findById(Long id) {
        return buildingRepository.findById(id).get();
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
}
