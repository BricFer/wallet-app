package com.walletapp.demo.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.walletapp.demo.dtos.request.PaymentMethodRequestDto;
import com.walletapp.demo.dtos.response.PaymentMethodResponseDto;
import com.walletapp.demo.enums.PaymentType;
import com.walletapp.demo.service.PaymentMethodService;

import lombok.AllArgsConstructor;

@RestController
@RequestMapping("/payment-methods")
@AllArgsConstructor
public class PaymentMethodController {

    private PaymentMethodService methodService;

    @GetMapping("/{methodId}")
    public ResponseEntity<PaymentMethodResponseDto> getPaymentMethod(
            @RequestHeader Long userId,
            @PathVariable Long methodId) {
        return ResponseEntity.ok(methodService.getPaymentMethod(userId, methodId));
    }

    @GetMapping
    public ResponseEntity<List<PaymentMethodResponseDto>> getAllMethods(@RequestHeader Long userId) {
        return ResponseEntity.ok(methodService.getAllPaymentMethods(userId));
    }

    @GetMapping("/active-methods")
    public ResponseEntity<List<PaymentMethodResponseDto>> getAllActiveMethods(@RequestHeader Long userId) {
        return ResponseEntity.ok(methodService.getAllActivePaymentMethods(userId));
    }

    @GetMapping("/by-type")
    public ResponseEntity<List<PaymentMethodResponseDto>> getAllMethodsByType(@RequestHeader Long userId,
            @RequestParam String type) {
        return ResponseEntity
                .ok(methodService.getAllPaymentMethodsByType(userId, PaymentType.valueOf(type.toUpperCase())));
    }

    @PostMapping
    public ResponseEntity<PaymentMethodResponseDto> savePaymentMethod(@RequestBody PaymentMethodRequestDto dto,
            @RequestHeader Long userId) {
        return ResponseEntity.status(HttpStatus.CREATED).body(methodService.savePaymentMethod(dto, userId));
    }

    @PutMapping("/{methodId}")
    public ResponseEntity<PaymentMethodResponseDto> updatePaymentMethod(
            @RequestBody PaymentMethodRequestDto dto,
            @RequestHeader Long userId,
            @PathVariable Long methodId) {
        return ResponseEntity.ok(methodService.updatePaymentMethod(dto, userId, methodId));
    }

    @DeleteMapping("/{methodId}")
    public ResponseEntity<Void> deletePaymentMethod(@RequestHeader Long userId, @PathVariable Long methodId) {
        methodService.deleteMethod(userId, methodId);

        return ResponseEntity.noContent().build();
    }

}
