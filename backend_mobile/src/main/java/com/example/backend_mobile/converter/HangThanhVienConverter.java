package com.example.backend_mobile.converter;


import com.example.backend_mobile.enums.HangThanhVien;
import jakarta.persistence.AttributeConverter;
import jakarta.persistence.Converter;

@Converter
public class HangThanhVienConverter implements AttributeConverter<HangThanhVien, String> {
    @Override
    public String convertToDatabaseColumn(HangThanhVien attribute) {
        if (attribute == null)
            return null;
        return attribute.getValue();
    }

    @Override
    public HangThanhVien convertToEntityAttribute(String dbData) {
        if (dbData == null)
            return null;
        for (HangThanhVien hangThanhVien : HangThanhVien.values()) {
            if (hangThanhVien.getValue().equals(dbData)) {
                return hangThanhVien;
            }
        }
        throw new IllegalArgumentException("Unknown database value: " + dbData);
    }
}