package com.walletapp.demo.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

@Entity
@Table(name = "incomes", indexes = {
        @Index(name = "idx_income_id", columnList = "created_by_id"),
        @Index(name = "idx_income_category_id", columnList = "category_id"),
        @Index(name = "idx_income_payment_method_id", columnList = "payment_method_id"),
    })
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class Income {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "income_id")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "created_by_id", nullable = false)
    private User user;

    @ManyToOne
    @JoinColumn(name = "category_id")
    private Category category;

    private String source;

    @Column(nullable = false)
    private double amount;

    @Column(nullable = false)
    private String currency;

    @ManyToOne
    @JoinColumn(name = "payment_method_id")
    private PaymentMethod paymentMethod;

    private LocalDateTime date;
    private String note;

    @CreationTimestamp
    @Column(name = "created_at")
    private LocalDateTime createdAt;

    @UpdateTimestamp
    @Column(name = "updated_at")
    private LocalDateTime updatedAt;

}
