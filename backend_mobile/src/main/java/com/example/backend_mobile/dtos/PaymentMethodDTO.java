package com.example.backend_mobile.dtos;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class PaymentMethodDTO {
    private Integer id;
    private String ten;
    private String soTaiKhoan;
    private String status;
}