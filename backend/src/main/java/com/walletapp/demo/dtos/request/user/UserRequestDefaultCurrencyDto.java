package com.walletapp.demo.dtos.request.user;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class UserRequestDefaultCurrencyDto {
    private String defaultCurrency;
}
