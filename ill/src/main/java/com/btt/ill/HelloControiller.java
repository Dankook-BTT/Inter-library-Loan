package com.btt.ill;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloControiller {

    @GetMapping(path="/hello")
    public String helloWorld() {
        return "hello World";
    }
}
