package com.walletapp.demo.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.walletapp.demo.entities.GroupBudget;

@Repository
public interface GroupBudgetRepository extends JpaRepository<GroupBudget, Long> {
    List<GroupBudget> findByUserId(Long userId);

    List<GroupBudget> findByUserIdAndGroupId(Long userId, Long groupId);

    Optional<GroupBudget> findByUserIdAndGroupBudgetId(Long userId, Long budgetId);

    List<GroupBudget> findByUserIdAndIsActiveTrue(Long userId);

    Optional<GroupBudget> findByUserIdAndGroupIdAndIsActiveTrue(Long userId, Long groupId);
}
