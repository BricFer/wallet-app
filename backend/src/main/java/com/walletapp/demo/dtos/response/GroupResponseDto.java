package com.walletapp.demo.dtos.response;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class GroupResponseDto {
    private Long groupId;
    private String name;
    private String description;
    private double budgetLimit;
    private boolean isActive;
}
