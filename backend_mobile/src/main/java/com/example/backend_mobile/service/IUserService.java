package com.example.backend_mobile.service;


import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;

public interface IUserService {
    ResponseEntity<?> getUserProfile();
    ResponseEntity<?> checkAuthentication();
    ResponseEntity<?> getUserById(Integer id);
    ResponseEntity<?> getUserFromAuthentication(Authentication authentication);
}