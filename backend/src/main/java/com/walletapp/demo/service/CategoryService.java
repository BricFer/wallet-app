package com.walletapp.demo.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.walletapp.demo.dtos.response.CategoryResponseDto;
import com.walletapp.demo.enums.CategoryType;
import com.walletapp.demo.repository.CategoryRepository;

import lombok.AllArgsConstructor;

@Service
@Transactional(readOnly = true)
@AllArgsConstructor
public class CategoryService {
    private CategoryRepository categoryRepository;

    public List<CategoryResponseDto> getAllCategories() {
        return categoryRepository.findAll()
            .stream()
            .map(category -> new CategoryResponseDto(
                category.getId(),
                category.getName(),
                category.getType()
            ))
            .toList();
    }

    public List<CategoryResponseDto> getAllByType(CategoryType type) {
        return categoryRepository.findByType(type)
            .stream()
            .map(category -> new CategoryResponseDto(
                category.getId(),
                category.getName(),
                category.getType()
            ))
            .toList();
    }
}