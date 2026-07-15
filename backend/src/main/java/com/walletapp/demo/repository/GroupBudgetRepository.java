package com.walletapp.demo.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.walletapp.demo.entity.GroupBudget;

public interface GroupBudgetRepository extends JpaRepository<GroupBudget, Long> {
    List<GroupBudget> findByUserId(Long userId);

    List<GroupBudget> findByGroupIdAndUserId(Long groupId, Long userId);

    Optional<GroupBudget> findByIdAndUserId(Long budgetId, Long userId);

    List<GroupBudget> findByUserIdAndIsActiveTrue(Long userId);

    Optional<GroupBudget> findByIdAndUserIdAndIsActiveTrue(Long groupId, Long userId);
}
