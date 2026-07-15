package com.walletapp.demo.repository;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.walletapp.demo.entity.Expense;

public interface ExpenseRepository extends JpaRepository<Expense, Long> {
        Optional<Expense> findByIdAndUserId(Long expenseId, Long userId);

        List<Expense> findByUserId(Long userId);

        List<Expense> findByUserIdAndCurrency(Long userId, String currency);

        List<Expense> findByUserIdAndCategoryId(Long userId, Long categoryId);

        @Query("SELECT SUM(e.amount) FROM Expense e WHERE e.user.id = :userId AND e.currency = :currency")
        Double totalExpenseAmount(@Param("userId") Long userId, @Param("currency") String currency);

        @Query("SELECT SUM(e.amount) FROM Expense e WHERE e.user.id = :userId AND e.currency = :currency AND MONTH(e.date) = :month")
        Double sumByCurrencyAndMonth(@Param("userId") Long userId, @Param("currency") String currency,
                        @Param("month") int month);

        @Query("SELECT SUM(e.amount) FROM Expense e WHERE e.user.id = :userId AND e.currency = :currency AND e.paymentMethod.id = :paymentMethodId AND MONTH(e.date) = :month")
        Double sumByCurrencyAndPaymentMethodAndMonth(@Param("userId") Long userId, @Param("currency") String currency,
                        @Param("paymentMethodId") Long paymentMethodId, @Param("month") int month);

        List<Expense> findByUserIdAndCurrencyAndPaymentMethodId(Long userId, String currency, Long paymentMethodId);

        List<Expense> findByUserIdAndGroupId(Long userId, Long groupId);

        List<Expense> findByUserIdAndDateBetween(Long userId, LocalDateTime start, LocalDateTime end);

        @Query("SELECT SUM(e.amount) FROM Expense e WHERE e.user.id = :userId AND e.category.id = :categoryId AND e.currency = :currency")
        Double sumByCategoryAndCurrency(@Param("userId") Long userId, @Param("categoryId") Long categoryId,
                        @Param("currency") String currency);
}
