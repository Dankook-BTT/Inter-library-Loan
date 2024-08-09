package com.btt.ill.controller;

import com.btt.ill.model.UserModel;
import com.btt.ill.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

@RestController
public class AdminController {

    private final PasswordEncoder passwordEncoder;
    private final UserService userService;

    @Autowired
    public AdminController(PasswordEncoder passwordEncoder, UserService userService) {
        this.passwordEncoder = passwordEncoder;
        this.userService = userService;
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @GetMapping("/admin/dashboard")
    public String adminDashboard() {
        return "adminDashboard";
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @PostMapping("/register")
    public UserModel registerUser(@RequestBody UserModel user) {
        user.setPw(passwordEncoder.encode(user.getPw()));
        return userService.createUser(user);
    }
}
