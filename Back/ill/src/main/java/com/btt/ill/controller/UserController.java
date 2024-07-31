package com.btt.ill.controller;

import com.btt.ill.model.UserModel;
import com.btt.ill.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/login")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private PasswordEncoder passwordEncoder;

    // 승인 요청
    @GetMapping("/access")
    public String login() {
        return "login";
    }

    // 등록 요청 ( 추후에 관리자 페이지로 뺄꺼임 )
    @GetMapping("/register")
    public String register(Model model) {
        model.addAttribute("user", new UserModel());
        return "register";
    }

    @PostMapping("/register")
    public String registerUser(@ModelAttribute UserModel user) {
        user.setPw(passwordEncoder.encode(user.getPw()));
        userService.createUser(user);

        return "redirect:/login";
    }
}
