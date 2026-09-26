package com.iris.hai8tech.controller.admin;

import com.iris.hai8tech.entity.UserEntity;
import com.iris.hai8tech.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/admin/user")
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping
    public String list(Model model) {

        List<UserEntity> users = userService.findAll();

        model.addAttribute("users", users);

        return "admin/user/list";
    }

//    @GetMapping("/edit/{id}")
//    public String edit(@PathVariable("id") Long id,
//                       Model model) {
//
//        UserEntity user = userService.findById(id);
//
//        if (user == null) {
//            return "redirect:/admin/user";
//        }
//
//        model.addAttribute("user", user);
//        model.addAttribute("userId", id);
//
//        return "admin/user/edit";
//    }
//
//    @PostMapping("/edit/{id}")
//    public String update(@PathVariable("id") Long id,
//                         @RequestParam("userName") String userName,
//                         Model model) {
//
//        UserEntity user = userService.findById(id);
//
//        if (user == null) {
//            return "redirect:/admin/user";
//        }
//
//        userName = userName == null
//                ? ""
//                : userName.trim();
//
//        if (userName.isEmpty()) {
//
//            model.addAttribute(
//                    "error",
//                    "Tên tài khoản không được để trống."
//            );
//
//            model.addAttribute("user", user);
//            model.addAttribute("userId", id);
//
//            return "admin/user/edit";
//        }
//
//        user.setUserName(userName);
//
//        userService.save(user);
//
//        return "redirect:/admin/user";
//    }
//
//    @GetMapping("/profile/{id}")
//    public String profile(@PathVariable("id") Long id,
//                          Model model) {
//
//        UserEntity user = userService.findById(id);
//
//        model.addAttribute("user", user);
//
//        return "admin/user/profile";
//    }
}
