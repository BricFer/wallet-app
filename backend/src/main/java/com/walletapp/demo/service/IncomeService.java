package com.walletapp.demo.service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.walletapp.demo.constants.Message;
import com.walletapp.demo.dtos.request.IncomeRequestDto;
import com.walletapp.demo.dtos.response.IncomeDetailResponseDto;
import com.walletapp.demo.dtos.response.IncomeResumeResponseDto;
import com.walletapp.demo.entity.Category;
import com.walletapp.demo.entity.Income;
import com.walletapp.demo.entity.PaymentMethod;
import com.walletapp.demo.entity.User;
import com.walletapp.demo.repository.CategoryRepository;
import com.walletapp.demo.repository.IncomeRepository;
import com.walletapp.demo.repository.PaymentMethodRepository;
import com.walletapp.demo.repository.WalletAppUserRepository;

import lombok.AllArgsConstructor;

@Service
@Transactional(readOnly = true)
@AllArgsConstructor
public class IncomeService {
    private CategoryRepository categoryRepo;
    private IncomeRepository incomeRepo;
    private PaymentMethodRepository methodRepo;
    private WalletAppUserRepository userRepo;

    @Transactional
    public IncomeDetailResponseDto saveIncome(IncomeRequestDto dto, Long userId) {

        Income income = new Income();
        income.setAmount(dto.getAmount());
        income.setCurrency(dto.getCurrency());
        income.setDate(dto.getDate());
        income.setNote(dto.getNote());
        income.setSource(dto.getSource());

        User user = userRepo.findById(userId).orElseThrow(() -> new RuntimeException(Message.USER_NOT_FOUND));

        income.setUser(user);

        if (dto.getCategoryId() != null) {
            Category category = categoryRepo.findById(dto.getCategoryId())
                    .orElseThrow(() -> new RuntimeException(Message.CATEGORY_NOT_FOUND));
            income.setCategory(category);
        }

        if (dto.getPaymentMethodId() != null) {
            PaymentMethod method = methodRepo.findById(dto.getPaymentMethodId())
                    .orElseThrow(() -> new RuntimeException(Message.PAYMENT_METHOD_NOT_FOUND));
            income.setPaymentMethod(method);
        }

        Income saved = incomeRepo.save(income);

        return toDetailDto(saved);
    }

    @Transactional
    public IncomeDetailResponseDto updateIncome(IncomeRequestDto dto, Long userId, Long incomeId) {
        Income income = incomeRepo.findByIdAndUserId(incomeId, userId).orElseThrow(() -> new RuntimeException(Message.INCOME_NOT_FOUND));

        income.setAmount(dto.getAmount());
        income.setCurrency(dto.getCurrency());
        income.setDate(dto.getDate());
        income.setNote(dto.getNote());
        income.setSource(dto.getSource());

        if (dto.getCategoryId() != null) {
            Category category = categoryRepo.findById(dto.getCategoryId())
                    .orElseThrow(() -> new RuntimeException(Message.CATEGORY_NOT_FOUND));
            income.setCategory(category);
        }

        if (dto.getPaymentMethodId() != null) {
            PaymentMethod method = methodRepo.findById(dto.getPaymentMethodId())
                    .orElseThrow(() -> new RuntimeException(Message.PAYMENT_METHOD_NOT_FOUND));
            income.setPaymentMethod(method);
        }

        return toDetailDto(incomeRepo.save(income));
    }
    
    public IncomeDetailResponseDto getIncome(Long userId, Long incomeId) {
        Income income = incomeRepo.findByIdAndUserId(incomeId, userId)
                .orElseThrow(() -> new RuntimeException(Message.INCOME_NOT_FOUND));

        return toDetailDto(income);
    }

    public List<IncomeResumeResponseDto> getAllIncomes(Long userId) {
        return toResumeDto(incomeRepo.findByUserId(userId));
    }

    public List<IncomeResumeResponseDto> getAllByCurrency(Long userId, String currency) {
        return toResumeDto(incomeRepo.findByUserIdAndCurrency(userId, currency));
    }

    public List<IncomeResumeResponseDto> getAllByCategory(Long userId, Long categoryId) {
        return toResumeDto(incomeRepo.findByUserIdAndCategoryId(userId, categoryId));
    }

    public Double getTotalAmount(Long userId, String currency) {
        return incomeRepo.totalIncomeAmount(userId, currency);
    }

    public Double getTotalByMonth(Long userId, String currency, int month) {
        return incomeRepo.sumByCurrencyAndMonth(userId, currency, month);
    }

    public List<IncomeResumeResponseDto> getAllByPaymentMethod(Long userId, String currency, Long paymentMethodId) {
        return toResumeDto(incomeRepo.findByUserIdAndCurrencyAndPaymentMethodId(userId, currency, paymentMethodId));
    }

    public List<IncomeResumeResponseDto> getAllByDatePeriod(Long userId, LocalDateTime start, LocalDateTime end) {
        return toResumeDto(incomeRepo.findByUserIdAndDateBetween(userId, start, end));
    }

    @Transactional
    public void deleteIncome(Long userId, Long incomeId) {
        incomeRepo.findByIdAndUserId(incomeId, userId)
                .orElseThrow(() -> new RuntimeException(Message.INCOME_NOT_FOUND));

        incomeRepo.deleteById(incomeId);
    }

    private IncomeDetailResponseDto toDetailDto(Income income) {
        return new IncomeDetailResponseDto(
                income.getId(),
                income.getCategory() != null ? income.getCategory().getName() : null,
                income.getCategory() != null ? income.getCategory().getId() : null,
                income.getSource(),
                income.getAmount(),
                income.getCurrency(),
                income.getPaymentMethod() != null ? income.getPaymentMethod().getAlias() : null,
                income.getPaymentMethod() != null ? income.getPaymentMethod().getType() : null,
                income.getPaymentMethod() != null ? income.getPaymentMethod().getId() : null,
                income.getDate(),
                income.getNote());
    }

    private List<IncomeResumeResponseDto> toResumeDto(List<Income> incomes) {
        return incomes.stream().map(income -> new IncomeResumeResponseDto(
                income.getId(),
                income.getSource(),
                income.getCategory() != null ? income.getCategory().getName() : null,
                income.getAmount(),
                income.getCurrency(),
                income.getDate())).toList();
    }
}
