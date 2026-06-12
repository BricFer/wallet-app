package com.walletapp.demo.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.walletapp.demo.entity.CategoryBudget;

@Repository
public interface CategoryBudgetRepository extends JpaRepository<CategoryBudget, Long> {
    Optional<CategoryBudget> findByUserIdAndCategoryBudgetId(Long userId, Long budgetId);

    List<CategoryBudget> findByUserId(Long userId);

    List<CategoryBudget> findByUserIdOrderByAmountDesc(Long userId);

    Optional<CategoryBudget> findByUserIdAndCategoryIdAndIsActiveTrue(Long userId, Long categoryId);
}
