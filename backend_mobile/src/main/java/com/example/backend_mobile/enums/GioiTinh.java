package com.example.backend_mobile.enums;

public enum GioiTinh {
    NAM("Nam"),
    NỮ("Nữ"),
    KHAC("Khác");

    private String value;

    GioiTinh(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }
}