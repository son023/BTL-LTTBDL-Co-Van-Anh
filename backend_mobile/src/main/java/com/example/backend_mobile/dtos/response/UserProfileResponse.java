package com.example.backend_mobile.dtos.response;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserProfileResponse {
    private Integer id;
    private String email;
    private String ten;
    private String soDienThoai;
    private String ngaySinh; // Định dạng yyyy-MM-dd
    private String gioiTinh;
    private String diaChi;
    private String avatar;
    private String hangThanhVien;
    private Integer diemTichLuy;
}