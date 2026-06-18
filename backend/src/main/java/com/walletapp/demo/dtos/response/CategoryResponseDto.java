package com.walletapp.demo.dtos.response;

import com.walletapp.demo.enums.CategoryType;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class CategoryResponseDto {
    private Long categoryId;
    private String name;
    private CategoryType type;
    private String iconKey;
}