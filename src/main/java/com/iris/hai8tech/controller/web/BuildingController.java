package com.iris.hai8tech.controller.web;

import com.iris.hai8tech.enums.District;
import com.iris.hai8tech.enums.TypeCode;
import com.iris.hai8tech.model.dto.BuildingDTO;
import com.iris.hai8tech.model.request.BuildingSearchRequest;
import com.iris.hai8tech.model.response.BuildingSearchResponse;
import com.iris.hai8tech.service.BuildingService;
import com.iris.hai8tech.service.UserService;
import org.displaytag.tags.TableTagParameters;
import org.displaytag.util.ParamEncoder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
public class BuildingController {

    @Autowired
    UserService userService;

    @Autowired
    BuildingService buildingService;

    @GetMapping("/admin/building-list")
    public ModelAndView buildingList(@ModelAttribute BuildingSearchRequest buildingSearchRequest, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/building/list");

        // Lấy page từ DisplayTag
        String pageParam = new ParamEncoder("tableList")
                .encodeParameterName(TableTagParameters.PARAMETER_PAGE);

        String pageValue = request.getParameter(pageParam);

        if (pageValue != null) {
            buildingSearchRequest.setPage(Integer.parseInt(pageValue));
        } else {
            buildingSearchRequest.setPage(1);
        }


        mav.addObject("modelSearch", buildingSearchRequest);

        Pageable pageable = PageRequest.of(
                buildingSearchRequest.getPage() - 1,
                buildingSearchRequest.getMaxPageItem()
        );

        List<BuildingSearchResponse> reponseList = buildingService.findAll(buildingSearchRequest,pageable);

        BuildingSearchResponse buildingSearchResponse = new BuildingSearchResponse();
        buildingSearchResponse.setListResult(reponseList);
//        buildingSearchResponse.setTotalItem(buildingService.countTotalItem(reponseList));
        buildingSearchResponse.setTotalItem(buildingService.countTotalItem(buildingSearchRequest));

        // dùng cái này sau khi làm phân trang
//        mav.addObject("reponseList", buildingSearchResponse);
        mav.addObject("buildingList", buildingSearchResponse);
        mav.addObject("listStaffs", userService.getStaffs());
        mav.addObject("districts", District.dicstrictMap());
        mav.addObject("typeCodes", TypeCode.typeCodeMap());
        return mav;
    }

    @GetMapping("/admin/building-edit")// ModelAttribute nếu href 3 cấp là k nhận
    public ModelAndView buildingEdit(@ModelAttribute("building") BuildingDTO buildingDTO, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/building/edit");
        mav.addObject("districts", District.dicstrictMap());
        mav.addObject("typeCodes", TypeCode.typeCodeMap());
//        mav.addObject("building", buildingDTO);
        return mav;
    }

    @GetMapping("/admin/building-edit-{id}")// ModelAttribute nếu href 3 cấp là k nhận
    public ModelAndView buildingEdit(@PathVariable("id") Long Id, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/building/edit");

        BuildingDTO buildingDTO = new BuildingDTO();
        mav.addObject("building", buildingDTO);
        buildingDTO.setId(1L);
        buildingDTO.setName("Tòa nhà Alpha");
        buildingDTO.setNumberOfBasement(2L);
        buildingDTO.setManagerName("Nguyễn Văn An");
        buildingDTO.setManagerPhone("0901234567");
        buildingDTO.setFloorArea(800L);

        List<BuildingDTO> reponseList = new ArrayList<>();
        reponseList.add(buildingDTO);
        mav.addObject("reponseList", reponseList);
        return mav;
    }
}
