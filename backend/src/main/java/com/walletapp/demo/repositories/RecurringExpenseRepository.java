package com.walletapp.demo.repositories;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.walletapp.demo.entities.RecurringExpense;

@Repository
public interface RecurringExpenseRepository extends JpaRepository<RecurringExpense, Long> {
    Optional<RecurringExpense> findByUserIdAndRecurringExpenseId(Long userId, Long recurringExpenseId);

    List<RecurringExpense> findByUserId(Long userId);

    List<RecurringExpense> findByUserIdAndFrequency(Long userId, String frequency);

    List<RecurringExpense> findByUserIdAndIsActiveTrue(Long userId);

    @Query("SELECT r FROM RecurringExpense r WHERE r.user.id = :userId AND r.nextChargeDate BETWEEN :now AND :limit")
    List<RecurringExpense> findUpcomingByUserId(
            @Param("userId") Long userId,
            @Param("now") LocalDateTime now,
            @Param("limit") LocalDateTime limit);

    List<RecurringExpense> findByUserIdAndCategoryId(Long userId, Long categoryId);
}
