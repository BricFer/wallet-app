package com.walletapp.demo.controller;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.walletapp.demo.dtos.response.CategoryResponseDto;
import com.walletapp.demo.enums.CategoryType;
import com.walletapp.demo.service.CategoryService;

import lombok.AllArgsConstructor;

@RestController
@RequestMapping("/categories")
@AllArgsConstructor
public class CategoryController {
    private CategoryService categoryService;

    @GetMapping
    public ResponseEntity<List<CategoryResponseDto>> getAllCategories() {
        return ResponseEntity.ok(categoryService.getAllCategories());
    }

    @GetMapping("/by-type")
    public ResponseEntity<List<CategoryResponseDto>> getAllCategoriesByType(@RequestParam String type) {
        return ResponseEntity.ok(categoryService.getAllByType(CategoryType.valueOf(type.toUpperCase())));
    }
}
