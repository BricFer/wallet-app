package com.walletapp.demo.dtos.request;

import com.walletapp.demo.enums.PaymentType;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class PaymentMethodRequestDto {
    private String alias;

    @NotNull
    private PaymentType type;

    @NotBlank
    private String issuer;
    private boolean isDefault;
    private boolean isActive;
}
