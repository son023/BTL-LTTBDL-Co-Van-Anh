package com.example.backend_mobile.dtos.request;

import lombok.Data;

import java.time.LocalDate;

@Data
public class SignupRequest {

    private String email;

    private String ten;

    private String matKhau;

}