package com.example.backend_mobile.dtos.request;

import lombok.Data;

@Data
public class GoogleLoginRequest {
    private String idToken;
    private String email;
    private String name;
    private String photoUrl;
}

