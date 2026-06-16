package com.walletapp.demo.dtos.request;

import java.time.LocalDateTime;

import com.walletapp.demo.constants.Message;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Positive;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ExpenseRequestDto {
    private Long categoryId;
    private Long groupId;
    
    @NotBlank(message = Message.COMMERCE_MANDATORY)
    @NotEmpty
    private String commerce;
    private String concept;
    private Long paymentMethodId;
    
    @NotBlank(message = Message.AMOUNT_MANDATORY)
    @Positive(message = Message.AMOUNT_NO_NEGATIVE)
    private double amount;

    @NotEmpty(message = Message.CURRENCY_MANDATORY)
    private String currency;
    private String note;
    private LocalDateTime date;
}
