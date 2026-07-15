package com.walletapp.demo.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.walletapp.demo.entity.PaymentMethod;
import com.walletapp.demo.enums.PaymentType;

public interface PaymentMethodRepository extends JpaRepository<PaymentMethod, Long> {
    Optional<PaymentMethod> findByIdAndUserId(Long methodId, Long userId);
    
    List<PaymentMethod> findByUserId(Long userId);

    List<PaymentMethod> findByUserIdAndType(Long userId, PaymentType type);

    List<PaymentMethod> findByUserIdAndIsActiveTrue(Long userId);
}
