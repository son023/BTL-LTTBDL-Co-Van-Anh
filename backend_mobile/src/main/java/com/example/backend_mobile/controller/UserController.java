package com.example.backend_mobile.controller;

import com.example.backend_mobile.dtos.request.UserProfileUpdateRequest;
import com.example.backend_mobile.service.IUserService;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;

import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@RestController
@RequestMapping("/user")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class UserController {

    IUserService userService;

    @GetMapping("/profile")
    @PreAuthorize("hasRole('USER')")
    public ResponseEntity<?> getUserProfile() {
        return userService.getUserProfile();
    }

    @GetMapping("/check")
    public ResponseEntity<?> checkAuthentication() {
        return userService.checkAuthentication();
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> getUserById(@PathVariable Integer id) {
        return userService.getUserById(id);
    }

    @PutMapping("/profile")
    @PreAuthorize("hasRole('USER')")
    public ResponseEntity<?> updateUserProfile(@RequestBody UserProfileUpdateRequest request) {
        return userService.updateUserProfile(request);
    }

    @PostMapping("/avatar")
    @PreAuthorize("hasRole('USER')")
    public ResponseEntity<?> uploadAvatar(@RequestParam("file") MultipartFile file) {
        return userService.uploadAvatar(file);
    }
}