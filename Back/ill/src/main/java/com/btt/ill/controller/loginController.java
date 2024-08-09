package com.btt.ill.controller;

import com.btt.ill.service.ApiService;
import com.btt.ill.model.UserModel;
import com.btt.ill.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/")
public class loginController {

    @Autowired
    private UserService userService;

    @Autowired
    private ApiService apiService;

    @PostMapping("/")
    public ResponseEntity<Map<String, String>> login(@RequestBody UserModel user) {
        // 받은 데이터를 처리하는 로직 (예: 데이터베이스에 저장 등)
        System.out.println("Received data: " + user.getName());

        // 사용자 정보를 로드합니다.
        UserModel existing_user = userService.loadUserById(user.getId());

        // 비밀번호를 확인합니다.
        if (userService.checkPassword(existing_user, user.getPassword())) {
            // 로그인 성공 시 응답
            return apiService.createSuccessResponse("Login successful");
        } else {
            // 비밀번호가 일치하지 않을 때의 응답
            return apiService.createFailureResponse("Invalid password", HttpStatus.UNAUTHORIZED);
        }
    }

    @ExceptionHandler(UsernameNotFoundException.class)
    @ResponseStatus(HttpStatus.NOT_FOUND)
    public String handleUsernameNotFoundException(UsernameNotFoundException ex) {
        return ex.getMessage();
    }
}
