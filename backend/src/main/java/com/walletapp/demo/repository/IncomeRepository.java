package com.walletapp.demo.repository;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.walletapp.demo.entity.Income;

public interface IncomeRepository extends JpaRepository<Income, Long> {

    Optional<Income> findByIdAndUserId(Long incomeId, Long userId);

    List<Income> findByUserId(Long userId);

    List<Income> findByUserIdAndCurrency(Long userId, String currency);

    List<Income> findByUserIdAndCategoryId(Long userId, Long categoryId);

    @Query("SELECT SUM(i.amount) FROM Income i WHERE i.user.id = :userId AND i.currency = :currency")
    Double totalIncomeAmount(@Param("userId") Long userId, @Param("currency") String currency);

    @Query("SELECT SUM(i.amount) FROM Income i WHERE i.user.id = :userId AND i.currency = :currency AND MONTH(i.date) = :month")
    Double sumByCurrencyAndMonth(@Param("userId") Long userId, @Param("currency") String currency,
            @Param("month") int month);

    List<Income> findByUserIdAndCurrencyAndPaymentMethodId(Long userId, String currency, Long paymentMethodId);

    List<Income> findByUserIdAndDateBetween(Long userId, LocalDateTime start, LocalDateTime end);
}
