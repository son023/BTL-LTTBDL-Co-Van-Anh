package com.example.backend_mobile.converter;


import com.example.backend_mobile.enums.GioiTinh;
import jakarta.persistence.AttributeConverter;
import jakarta.persistence.Converter;

@Converter
public class GioiTinhConverter implements AttributeConverter<GioiTinh, String> {
    @Override
    public String convertToDatabaseColumn(GioiTinh attribute) {
        if (attribute == null)
            return null;
        return attribute.getValue();
    }

    @Override
    public GioiTinh convertToEntityAttribute(String dbData) {
        if (dbData == null)
            return null;
        for (GioiTinh gioiTinh : GioiTinh.values()) {
            if (gioiTinh.getValue().equals(dbData)) {
                return gioiTinh;
            }
        }
        throw new IllegalArgumentException("Unknown database value: " + dbData);
    }
}