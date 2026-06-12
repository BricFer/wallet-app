package com.walletapp.demo.dtos.request;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class IncomeRequestDto {
    private Long categoryId;
    private String source;
    private double amount;
    private String currency;
    private Long paymentMethodId;
    private LocalDateTime date;
    private String note;
}
