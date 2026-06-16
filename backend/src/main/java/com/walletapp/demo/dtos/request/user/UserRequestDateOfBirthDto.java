package com.walletapp.demo.dtos.request.user;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class UserRequestDateOfBirthDto {
    private LocalDateTime dateOfBirth;
}
