package com.walletapp.demo.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.walletapp.demo.entity.CategoryBudget;

public interface CategoryBudgetRepository extends JpaRepository<CategoryBudget, Long> {
    Optional<CategoryBudget> findByIdAndUserId(Long budgetId, Long userId);

    List<CategoryBudget> findByUserId(Long userId);

    List<CategoryBudget> findByUserIdOrderByAmountDesc(Long userId);

    Optional<CategoryBudget> findByUserIdAndCategoryIdAndIsActiveTrue(Long userId, Long categoryId);
}
