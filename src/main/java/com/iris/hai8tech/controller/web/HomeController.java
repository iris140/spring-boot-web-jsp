package com.iris.hai8tech.controller.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping({"/", "/trang-chu"})
    public String home() {
        return "web/home";
    }

    @GetMapping("/login")
    public String login() {
        return "web/login";
    }
}