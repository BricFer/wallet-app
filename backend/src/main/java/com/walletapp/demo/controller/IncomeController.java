package com.walletapp.demo.controller;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.walletapp.demo.dtos.request.IncomeRequestDto;
import com.walletapp.demo.dtos.response.IncomeDetailResponseDto;
import com.walletapp.demo.dtos.response.IncomeResumeResponseDto;
import com.walletapp.demo.service.IncomeService;

import lombok.AllArgsConstructor;

@RestController
@RequestMapping("/incomes")
@AllArgsConstructor
public class IncomeController {
    private IncomeService incomeService;

    @GetMapping("/{incomeId}")
    public ResponseEntity<IncomeDetailResponseDto> getIncome(
            @PathVariable Long incomeId,
            @RequestAttribute Long userId) {
        return ResponseEntity.ok(incomeService.getIncome(userId, incomeId));
    }

    @PostMapping
    public ResponseEntity<IncomeDetailResponseDto> saveIncome(
            @RequestBody IncomeRequestDto dto,
            @RequestAttribute Long userId) {
        return ResponseEntity.status(HttpStatus.CREATED).body(incomeService.saveIncome(dto, userId));
    }

    @PutMapping("/{incomeId}")
    public ResponseEntity<IncomeDetailResponseDto> updateIncome(
            @RequestBody IncomeRequestDto dto,
            @RequestAttribute Long userId,
            @PathVariable Long incomeId) {
        return ResponseEntity.ok(incomeService.updateIncome(dto, userId, incomeId));
    }

    @GetMapping
    public ResponseEntity<List<IncomeResumeResponseDto>> getAllIncomes(@RequestAttribute Long userId) {
        return ResponseEntity.ok(incomeService.getAllIncomes(userId));
    }

    @GetMapping("/by-currency")
    public ResponseEntity<List<IncomeResumeResponseDto>> getAllIncomesByCurrency(
            @RequestAttribute Long userId,
            @RequestParam String currency) {
        return ResponseEntity.ok(incomeService.getAllByCurrency(userId, currency));
    }

    @GetMapping("/by-category")
    public ResponseEntity<List<IncomeResumeResponseDto>> getAllIncomesByCategory(
            @RequestAttribute Long userId,
            @RequestParam Long categoryId) {
        return ResponseEntity.ok(incomeService.getAllByCategory(userId, categoryId));
    }

    @GetMapping("/total")
    public ResponseEntity<Double> getIncomesTotal(
            @RequestAttribute Long userId,
            @RequestParam String currency) {
        return ResponseEntity.ok(incomeService.getTotalAmount(userId, currency));
    }

    @GetMapping("/monthly-total")
    public ResponseEntity<Double> getIncomesTotalByMonth(
            @RequestAttribute Long userId,
            @RequestParam String currency,
            @RequestParam int month) {
        return ResponseEntity.ok(incomeService.getTotalByMonth(userId, currency, month));
    }

    @GetMapping("/by-payment-method")
    public ResponseEntity<List<IncomeResumeResponseDto>> getAllIncomesByPaymentMethod(
            @RequestAttribute Long userId,
            @RequestParam Long paymentMethodId,
            @RequestParam String currency) {
        return ResponseEntity.ok(incomeService.getAllByPaymentMethod(userId, currency, paymentMethodId));
    }

    @GetMapping("/by-date")
    public ResponseEntity<List<IncomeResumeResponseDto>> getAllIncomesByPeriodOfTime(
            @RequestAttribute Long userId,
            @RequestParam String start,
            @RequestParam String end) {
        return ResponseEntity
                .ok(incomeService.getAllByDatePeriod(userId, LocalDateTime.parse(start), LocalDateTime.parse(end)));
    }

    @DeleteMapping("/{incomeId}")
    public ResponseEntity<Void> deleteIncome(@RequestAttribute Long userId, @PathVariable Long incomeId) {
        incomeService.deleteIncome(userId, incomeId);

        return ResponseEntity.noContent().build();
    }
}
