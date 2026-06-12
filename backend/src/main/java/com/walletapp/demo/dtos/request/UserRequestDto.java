package com.walletapp.demo.dtos.request;


import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class UserRequestDto {
    private String username;
    private String phoneNumber;
    private LocalDateTime dateOfBirth;
    private String country;
    private String defaultCurrency;
}
