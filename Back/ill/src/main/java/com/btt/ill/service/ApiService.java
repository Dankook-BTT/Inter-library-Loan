package com.btt.ill.service;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class ApiService {

    public ResponseEntity<Map<String, String>> createResponse(String status, String message, HttpStatus httpStatus) {
        Map<String, String> response = new HashMap<>();
        response.put("status", status);
        response.put("message", message);
        return new ResponseEntity<>(response, httpStatus);
    }

    public ResponseEntity<Map<String, String>> createSuccessResponse(String message) {
        return createResponse("success", message, HttpStatus.OK);
    }

    public ResponseEntity<Map<String, String>> createFailureResponse(String message, HttpStatus httpStatus) {
        return createResponse("failure", message, httpStatus);
    }
}