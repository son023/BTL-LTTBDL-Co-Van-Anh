package com.example.backend_mobile.dtos.request;


import lombok.Data;


@Data
public class LoginRequest {

    private String email;

    private String password;
}