package com.example.backend_mobile.enums;

public enum HangThanhVien {
    THUONG("Thường"),
    BAC("VIP");

    private String value;

    HangThanhVien(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }
}