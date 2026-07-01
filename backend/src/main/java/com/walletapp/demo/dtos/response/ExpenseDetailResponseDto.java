package com.walletapp.demo.dtos.response;

import java.time.LocalDateTime;

import com.walletapp.demo.enums.PaymentType;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ExpenseDetailResponseDto {
    private Long expenseId;
    private String categoryName;
    private Long categoryId;
    private String groupName;
    private Long groupId;
    private String commerce;
    private String concept;
    private String paymentMethodAlias;
    private String issuer;
    private PaymentType type;
    private Long paymentMethodId;
    private double amount;
    private String currency;
    private LocalDateTime date;
    private String note;
}