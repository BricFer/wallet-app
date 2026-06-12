package com.walletapp.demo.dtos.response;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ExpenseResumeResponseDto {
    private Long expenseId;
    private String commerce;
    private String categoryName;
    private String concept;
    private double amount;
    private String currency;
    private LocalDateTime date;
}
