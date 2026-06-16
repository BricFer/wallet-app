package com.walletapp.demo.controller;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.walletapp.demo.dtos.request.ExpenseRequestDto;
import com.walletapp.demo.dtos.response.ExpenseDetailResponseDto;
import com.walletapp.demo.dtos.response.ExpenseResumeResponseDto;
import com.walletapp.demo.service.ExpenseService;

import lombok.AllArgsConstructor;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;

@RestController
@RequestMapping("/expenses")
@AllArgsConstructor
public class ExpenseController {
    private ExpenseService expenseService;

    @GetMapping("/{expenseId}")
    public ResponseEntity<ExpenseDetailResponseDto> getExpense(@PathVariable Long expenseId,
            @RequestHeader Long userId) {

        return ResponseEntity.ok(expenseService.getExpense(userId, expenseId));
    }

    @PostMapping
    public ResponseEntity<ExpenseDetailResponseDto> saveExpense(@RequestBody ExpenseRequestDto dto,
            @RequestHeader Long userId) {
        return ResponseEntity.status(HttpStatus.CREATED).body(expenseService.saveExpense(dto, userId));
    }

    @PutMapping("/{expenseId}")
    public ResponseEntity<ExpenseDetailResponseDto> updateExpense(@RequestBody ExpenseRequestDto dto,
            @RequestHeader Long userId, @PathVariable Long expenseId) {
        return ResponseEntity.ok(expenseService.updateExpense(dto, userId, expenseId));
    }

    @GetMapping
    public ResponseEntity<List<ExpenseResumeResponseDto>> getAllExpenses(@RequestHeader Long userId) {
        return ResponseEntity.ok(expenseService.getAllExpenses(userId));
    }

    @GetMapping("/by-currency")
    public ResponseEntity<List<ExpenseResumeResponseDto>> getAllExpensesByCurrency(@RequestHeader Long userId,
            @RequestParam String currency) {
        return ResponseEntity.ok(expenseService.getAllByCurrency(userId, currency));
    }

    @GetMapping("/by-category")
    public ResponseEntity<List<ExpenseResumeResponseDto>> getAllExpensesByCategory(@RequestHeader Long userId,
            @RequestParam Long categoryId) {
        return ResponseEntity.ok(expenseService.getAllByCategory(userId, categoryId));
    }

    @GetMapping("/total")
    public ResponseEntity<Double> getTotalExpensesAmount(
            @RequestHeader Long userId,
            @RequestParam String currency) {
        return ResponseEntity.ok(expenseService.getTotalExpensesAmount(userId, currency));
    }

    @GetMapping("/monthly-total")
    public ResponseEntity<Double> getTotalByMonth(
            @RequestHeader Long userId,
            @RequestParam String currency,
            @RequestParam int month) {
        return ResponseEntity.ok(expenseService.getTotalByMonth(userId, currency, month));
    }

    @GetMapping("/payment-method/{paymentMethodId}/total")
    public ResponseEntity<Double> getTotalByPaymentMethodAndMonth(
            @RequestHeader Long userId,
            @RequestParam String currency,
            @PathVariable Long paymentMethodId,
            @RequestParam int month) {
        return ResponseEntity
                .ok(expenseService.getTotalByPaymentMethodAndMonth(userId, currency, paymentMethodId, month));
    }

    @GetMapping("/payment-method/{paymentMethodId}")
    public ResponseEntity<List<ExpenseResumeResponseDto>> getAllExpensesByPaymentMethod(
        @RequestHeader Long userId,
            @RequestParam String currency,
            @PathVariable Long paymentMethodId) {
        return ResponseEntity.ok(expenseService.getAllByPaymentMethod(userId, currency, paymentMethodId));
    }

    @GetMapping("/by-group")
    public ResponseEntity<List<ExpenseResumeResponseDto>> getAllExpensesByGroup(@RequestHeader Long userId,
            @RequestParam Long groupId) {
        return ResponseEntity.ok(expenseService.getAllByGroup(userId, groupId));
    }

    @GetMapping("/by-date")
    public ResponseEntity<List<ExpenseResumeResponseDto>> getAllExpensesByPeriodOfTime(
            @RequestHeader Long userId,
            @RequestParam String start,
            @RequestParam String end) {
        return ResponseEntity
                .ok(expenseService.getAllByDatePeriod(userId, LocalDateTime.parse(start), LocalDateTime.parse(end)));
    }

    @GetMapping("/category-total")
    public ResponseEntity<Double> getTotalByCategory(
            @RequestHeader Long userId,
            @RequestParam Long categoryId,
            @RequestParam String currency) {
        return ResponseEntity.ok(expenseService.getTotalByCategory(userId, categoryId, currency));
    }

    @DeleteMapping("/{expenseId}")
    public ResponseEntity<Void> deleteExpense(@RequestHeader Long userId, @PathVariable Long expenseId) {
        expenseService.deleteExpense(userId, expenseId);
        return ResponseEntity.noContent().build();
    }
}
