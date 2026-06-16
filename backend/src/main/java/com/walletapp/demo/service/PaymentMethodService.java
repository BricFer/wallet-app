package com.walletapp.demo.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.walletapp.demo.constants.Message;
import com.walletapp.demo.dtos.request.PaymentMethodRequestDto;
import com.walletapp.demo.dtos.response.PaymentMethodResponseDto;
import com.walletapp.demo.entity.PaymentMethod;
import com.walletapp.demo.entity.User;
import com.walletapp.demo.enums.PaymentType;
import com.walletapp.demo.repository.PaymentMethodRepository;
import com.walletapp.demo.repository.WalletAppUserRepository;

import lombok.AllArgsConstructor;

@Service
@Transactional(readOnly = true)
@AllArgsConstructor
public class PaymentMethodService {
    private PaymentMethodRepository methodRepo;
    private WalletAppUserRepository userRepo;

    public List<PaymentMethodResponseDto> getAllPaymentMethods(Long userId) {
        return methodRepo.findByUserId(userId).stream().map(this::toResponseDto).toList();
    }

    public List<PaymentMethodResponseDto> getAllPaymentMethodsByType(Long userId, PaymentType type) {
        return methodRepo.findByUserIdAndType(userId, type).stream().map(this::toResponseDto).toList();
    }

    public List<PaymentMethodResponseDto> getAllActivePaymentMethods(Long userId) {
        return methodRepo.findByUserIdAndIsActiveTrue(userId).stream().map(this::toResponseDto).toList();
    }

    public PaymentMethodResponseDto getPaymentMethod(Long userId, Long methodId) {
        PaymentMethod method = methodRepo.findByIdAndUserId(methodId, userId)
                .orElseThrow(() -> new RuntimeException(Message.PAYMENT_METHOD_NOT_FOUND));

        return toResponseDto(method);
    }

    @Transactional
    public PaymentMethodResponseDto savePaymentMethod(PaymentMethodRequestDto dto, Long userId) {

        PaymentMethod method = new PaymentMethod();

        User user = userRepo.findById(userId).orElseThrow(() -> new RuntimeException(Message.USER_NOT_FOUND));

        method.setUser(user);

        if (dto.getAlias() != null)
            method.setAlias(dto.getAlias());

        method.setType(dto.getType());
        method.setIssuer(dto.getIssuer());
        method.setDefault(dto.isDefault());
        method.setActive(dto.isActive());

        return toResponseDto(methodRepo.save(method));
    }

    @Transactional
    public PaymentMethodResponseDto updatePaymentMethod(PaymentMethodRequestDto dto, Long userId, Long methodId) {

        PaymentMethod method = methodRepo.findByIdAndUserId(methodId, userId)
                .orElseThrow(() -> new RuntimeException(Message.PAYMENT_METHOD_NOT_FOUND));

        if (dto.getAlias() != null)
            method.setAlias(dto.getAlias());

        method.setType(dto.getType());
        method.setIssuer(dto.getIssuer());
        method.setDefault(dto.isDefault());
        method.setActive(dto.isActive());

        return toResponseDto(methodRepo.save(method));
    }

    @Transactional
    public void deleteMethod(Long userId, Long methodId) {
        methodRepo.findByIdAndUserId(methodId, userId)
                .orElseThrow(() -> new RuntimeException(Message.PAYMENT_METHOD_NOT_FOUND));

        methodRepo.deleteById(methodId);
    }

    private PaymentMethodResponseDto toResponseDto(PaymentMethod method) {
        return new PaymentMethodResponseDto(
                method.getId(),
                method.getAlias(),
                method.getType(),
                method.getIssuer(),
                method.isDefault(),
                method.isActive());
    }
}
