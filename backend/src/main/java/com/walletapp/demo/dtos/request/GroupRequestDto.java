package com.walletapp.demo.dtos.request;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.PositiveOrZero;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class GroupRequestDto {

    @NotBlank
    @NotEmpty
    private String name;

    @NotEmpty
    @Size(min = 3, max = 15)
    private String description;
    
    @PositiveOrZero
    private double budgetLimit;
}
