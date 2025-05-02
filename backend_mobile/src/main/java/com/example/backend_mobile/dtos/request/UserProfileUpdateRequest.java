package com.example.backend_mobile.dtos.request;

import lombok.Data;

@Data
public class UserProfileUpdateRequest {
    private String ten;
    private String soDienThoai;
    private String ngaySinh; // Định dạng yyyy-MM-dd
    private String gioiTinh; // Chuỗi giá trị tương ứng với enum GioiTinh
    private String diaChi;
}