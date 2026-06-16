package com.walletapp.demo.dtos.response;

import com.walletapp.demo.enums.PaymentType;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class PaymentMethodResponseDto {
    private Long id;
    private String alias;
    private PaymentType type;
    private String issuer;
    private boolean isDefault;
    private boolean isActive;
}
