package com.example.backend_mobile.service;

import com.example.backend_mobile.dtos.request.LoginRequest;
import com.example.backend_mobile.dtos.request.SignupRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;

public interface IAuthenticationService {
    ResponseEntity<?> authenticateUser(LoginRequest loginRequest);
    ResponseEntity<?> registerUser(SignupRequest signupRequest);
    ResponseEntity<?> refreshToken(String refreshToken);
    ResponseEntity<?> logoutUser(String token);
    String generateToken(Authentication authentication, boolean isRefreshToken);
}
