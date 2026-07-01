package com.walletapp.demo.service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.walletapp.demo.dtos.response.ExpenseResumeResponseDto;
import com.walletapp.demo.constants.Message;
import com.walletapp.demo.dtos.request.ExpenseRequestDto;
import com.walletapp.demo.dtos.response.ExpenseDetailResponseDto;
import com.walletapp.demo.entity.Category;
import com.walletapp.demo.entity.Expense;
import com.walletapp.demo.entity.Group;
import com.walletapp.demo.entity.PaymentMethod;
import com.walletapp.demo.entity.User;
import com.walletapp.demo.repository.CategoryRepository;
import com.walletapp.demo.repository.ExpenseRepository;
import com.walletapp.demo.repository.GroupRepository;
import com.walletapp.demo.repository.PaymentMethodRepository;
import com.walletapp.demo.repository.WalletAppUserRepository;

import lombok.AllArgsConstructor;

@Service
@Transactional(readOnly = true)
@AllArgsConstructor
public class ExpenseService {
    private ExpenseRepository expenseRepo;
    private WalletAppUserRepository userRepo;
    private CategoryRepository categoryRepo;
    private GroupRepository groupRepo;
    private PaymentMethodRepository paymentMethodRepository;

    @Transactional
    public ExpenseDetailResponseDto saveExpense(ExpenseRequestDto dto, Long userId) {
        Expense expense = new Expense();
        expense.setCommerce(dto.getCommerce());
        expense.setConcept(dto.getConcept());
        expense.setNote(dto.getNote());
        expense.setAmount(dto.getAmount());
        expense.setCurrency(dto.getCurrency());
        expense.setDate(dto.getDate());

        User user = userRepo.findById(userId).orElseThrow(() -> new RuntimeException(Message.USER_NOT_FOUND));

        expense.setUser(user);

        if (dto.getCategoryId() != null) {
            Category category = categoryRepo.findById(dto.getCategoryId())
                    .orElseThrow(() -> new RuntimeException(Message.CATEGORY_NOT_FOUND));
            expense.setCategory(category);
        }

        if (dto.getGroupId() != null) {
            Group group = groupRepo.findById(dto.getGroupId())
                    .orElseThrow(() -> new RuntimeException(Message.GROUP_NOT_FOUND));

            expense.setGroup(group);
        }

        if (dto.getPaymentMethodId() != null) {
            PaymentMethod paymentMethod = paymentMethodRepository.findById(dto.getPaymentMethodId())
                    .orElseThrow(() -> new RuntimeException(Message.PAYMENT_METHOD_NOT_FOUND));

            expense.setPaymentMethod(paymentMethod);
        }

        return toDetailDto(expenseRepo.save(expense));
    }

    @Transactional
    public ExpenseDetailResponseDto updateExpense(ExpenseRequestDto dto, Long userId, Long expenseId) {
        Expense expense = expenseRepo.findByIdAndUserId(expenseId, userId)
                .orElseThrow(() -> new RuntimeException(Message.EXPENSE_NOT_FOUND));

        expense.setCommerce(dto.getCommerce());
        expense.setConcept(dto.getConcept());
        expense.setNote(dto.getNote());
        expense.setAmount(dto.getAmount());
        expense.setCurrency(dto.getCurrency());
        expense.setDate(dto.getDate());

        if (dto.getCategoryId() != null) {
            Category category = categoryRepo.findById(dto.getCategoryId())
                    .orElseThrow(() -> new RuntimeException(Message.CATEGORY_NOT_FOUND));
            expense.setCategory(category);
        }

        if (dto.getGroupId() != null) {
            Group group = groupRepo.findById(dto.getGroupId())
                    .orElseThrow(() -> new RuntimeException(Message.GROUP_NOT_FOUND));

            expense.setGroup(group);
        }

        if (dto.getPaymentMethodId() != null) {
            PaymentMethod paymentMethod = paymentMethodRepository.findById(dto.getPaymentMethodId())
                    .orElseThrow(() -> new RuntimeException(Message.PAYMENT_METHOD_NOT_FOUND));

            expense.setPaymentMethod(paymentMethod);
        }

        return toDetailDto(expenseRepo.save(expense));
    }

    public ExpenseDetailResponseDto getExpense(Long userId, Long expenseId) {

        Expense expense = expenseRepo.findByIdAndUserId(expenseId, userId)
                .orElseThrow(() -> new RuntimeException(Message.EXPENSE_NOT_FOUND));

        return toDetailDto(expense);
    }

    public List<ExpenseResumeResponseDto> getAllExpenses(Long userId) {
        return toResumeDto(expenseRepo.findByUserId(userId));
    }

    public List<ExpenseResumeResponseDto> getAllByCurrency(Long userId, String currency) {
        return toResumeDto(expenseRepo.findByUserIdAndCurrency(userId, currency));
    }

    public List<ExpenseResumeResponseDto> getAllByCategory(Long userId, Long categoryId) {
        return toResumeDto(expenseRepo.findByUserIdAndCategoryId(userId, categoryId));
    }

    public Double getTotalExpensesAmount(Long userId, String currency) {
        Double total = expenseRepo.totalExpenseAmount(userId, currency);

        return total != null ? total : 0.0;
    }

    public Double getTotalByMonth(Long userId, String currency, int month) {
        Double total = expenseRepo.sumByCurrencyAndMonth(userId, currency, month);

        return total != null ? total : 0.0;
    }

    public Double getTotalByPaymentMethodAndMonth(Long userId, String currency, Long paymentMethodId, int month) {
        Double total = expenseRepo.sumByCurrencyAndPaymentMethodAndMonth(userId, currency, paymentMethodId, month);
        return total != null ? total : 0.0;
    }

    public List<ExpenseResumeResponseDto> getAllByPaymentMethod(Long userId, String currency,
            Long paymentMethodId) {
        return toResumeDto(
                expenseRepo.findByUserIdAndCurrencyAndPaymentMethodId(userId, currency, paymentMethodId));
    }

    public List<ExpenseResumeResponseDto> getAllByGroup(Long userId, Long groupId) {
        return toResumeDto(expenseRepo.findByUserIdAndGroupId(userId, groupId));
    }

    public List<ExpenseResumeResponseDto> getAllByDatePeriod(Long userId, LocalDateTime start, LocalDateTime end) {
        return toResumeDto(expenseRepo.findByUserIdAndDateBetween(userId, start, end));
    }

    public Double getTotalByCategory(Long userId, Long categoryId, String currency) {
        Double  total = expenseRepo.sumByCategoryAndCurrency(userId, categoryId, currency);

        return total != null ? total : 0.0;
    }

    @Transactional
    public void deleteExpense(Long userId, Long expenseId) {

        expenseRepo.findByIdAndUserId(expenseId, userId)
                .orElseThrow(() -> new RuntimeException(Message.EXPENSE_NOT_FOUND));

        expenseRepo.deleteById(expenseId);
    }

    private ExpenseDetailResponseDto toDetailDto(Expense expense) {
        return new ExpenseDetailResponseDto(
                expense.getId(),
                expense.getCategory() != null ? expense.getCategory().getName() : null,
                expense.getCategory() != null ? expense.getCategory().getId() : null,
                expense.getGroup() != null ? expense.getGroup().getName() : null,
                expense.getGroup() != null ? expense.getGroup().getId() : null,
                expense.getCommerce(),
                expense.getConcept(),
                expense.getPaymentMethod() != null ? expense.getPaymentMethod().getAlias() : null,
                expense.getPaymentMethod() != null ? expense.getPaymentMethod().getIssuer() : null,
                expense.getPaymentMethod() != null ? expense.getPaymentMethod().getType() : null,
                expense.getPaymentMethod() != null ? expense.getPaymentMethod().getId() : null,
                expense.getAmount(),
                expense.getCurrency(),
                expense.getDate(),
                expense.getNote());
    }

    private List<ExpenseResumeResponseDto> toResumeDto(List<Expense> expenses) {
        return expenses.stream().map(expense -> new ExpenseResumeResponseDto(
                expense.getId(),
                expense.getCommerce(),
                expense.getCategory() != null ? expense.getCategory().getName() : null,
                expense.getConcept(),
                expense.getAmount(),
                expense.getCurrency(),
                expense.getDate())).toList();
    }
}