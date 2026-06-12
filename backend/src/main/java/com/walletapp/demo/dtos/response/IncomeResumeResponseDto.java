package com.walletapp.demo.dtos.response;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class IncomeResumeResponseDto {
    private Long incomeId;
    private String source;
    private String categoryName;
    private double amount;
    private String currency;
    private LocalDateTime date;
}
