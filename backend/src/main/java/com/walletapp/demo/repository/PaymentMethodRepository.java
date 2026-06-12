package com.walletapp.demo.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.walletapp.demo.entity.PaymentMethod;
import com.walletapp.demo.enums.PaymentType;

@Repository
public interface PaymentMethodRepository extends JpaRepository<PaymentMethod, Long> {
    Optional<PaymentMethod> findByUserIdAndPaymentMethodId(Long userId, Long methodId);
    
    List<PaymentMethod> findByUserId(Long userId);

    List<PaymentMethod> findByUserIdAndType(Long userId, PaymentType type);

    List<PaymentMethod> findByUserIdAndIsActiveTrue(Long userId);
}
