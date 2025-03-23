package com.example.backend_mobile.converter;


import com.example.backend_mobile.enums.TrangThaiNguoiDung;
import jakarta.persistence.AttributeConverter;
import jakarta.persistence.Converter;

@Converter
public class TrangThaiNguoiDungConverter implements AttributeConverter<TrangThaiNguoiDung, String> {
    @Override
    public String convertToDatabaseColumn(TrangThaiNguoiDung attribute) {
        if (attribute == null)
            return null;
        return attribute.getValue();
    }

    @Override
    public TrangThaiNguoiDung convertToEntityAttribute(String dbData) {
        if (dbData == null)
            return null;
        for (TrangThaiNguoiDung trangThai : TrangThaiNguoiDung.values()) {
            if (trangThai.getValue().equals(dbData)) {
                return trangThai;
            }
        }
        throw new IllegalArgumentException("Unknown database value: " + dbData);
    }
}