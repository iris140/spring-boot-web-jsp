package com.iris.hai8tech.controller.admin;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
public class AdminHomeController {
    @GetMapping("/admin")
    public String home() {
        return "admin/home";
    }
}
