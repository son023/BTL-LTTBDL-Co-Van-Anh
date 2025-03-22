package com.example.backend_mobile.enums;

public enum TrangThaiNguoiDung {
    HOAT_DONG("Hoạt động"),
    BI_KHOA("Bị khóa"),
    CHUA_KICH_HOAT("Chưa kích hoạt");

    private String value;

    TrangThaiNguoiDung(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }
}