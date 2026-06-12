package com.walletapp.demo.dtos.response;

import java.time.LocalDateTime;

import com.walletapp.demo.enums.PaymentType;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class IncomeDetailResponseDto {
    private Long incomeId;
    private String categoryName;
    private Long categoryId;
    private String source;
    private double amount;
    private String currency;
    private String paymentMethodAlias;
    private PaymentType paymentMethodType;
    private Long paymentMethodId;
    private LocalDateTime date;
    private String note;
}
