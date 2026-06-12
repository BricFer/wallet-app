package com.walletapp.demo.dtos.request;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class GroupRequestDto {
    private String name;
    private String description;
    private double budgetLimit;
}
