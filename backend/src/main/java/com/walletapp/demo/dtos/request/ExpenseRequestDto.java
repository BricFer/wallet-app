package com.walletapp.demo.dtos.request;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author BricFer
 * @version 1.0
 * 
 *          Class representing a request send by Flutter to the backend
 */
@AllArgsConstructor
@NoArgsConstructor
@Data
public class ExpenseRequestDto {
    private Long categoryId;
    private Long groupId;
    private String commerce;
    private String concept;
    private Long paymentMethodId;
    private double amount;
    private String currency;
    private String note;
    private LocalDateTime date;
}
