package com.example.backend_mobile.service;

import com.example.backend_mobile.dtos.request.UserProfileUpdateRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.multipart.MultipartFile;

public interface IUserService {
    ResponseEntity<?> getUserProfile();
    ResponseEntity<?> checkAuthentication();
    ResponseEntity<?> getUserById(Integer id);
    ResponseEntity<?> getUserFromAuthentication(Authentication authentication);
    ResponseEntity<?> updateUserProfile(UserProfileUpdateRequest request);
    ResponseEntity<?> uploadAvatar(MultipartFile file);
}