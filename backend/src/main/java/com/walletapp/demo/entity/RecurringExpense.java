package com.walletapp.demo.entity;

import java.time.LocalDateTime;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "recurring_expenses", indexes = {
        @Index(name = "idx_recurring_expense_user_id", columnList = "user_id"),
        @Index(name = "idx_recurring_expense_category_id", columnList = "category_id"),

})
@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
public class RecurringExpense {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "recurring_expense_id")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @ManyToOne
    @JoinColumn(name = "category_id")
    private Category category;
    private String name;

    @Column(nullable = false)
    private double amount;

    @Column(nullable = false)
    private String currency;

    @Column(nullable = false)
    private String frequency;

    @Column(name = "next_charge_date")
    private LocalDateTime nextChargeDate;

    @Column(name = "last_charged_date")
    private LocalDateTime lastChargedDate;

    @Column(name = "end_date")
    private LocalDateTime endDate;

    @Column(name = "is_active")
    private boolean isActive;

    @CreationTimestamp
    @Column(name = "created_at")
    private LocalDateTime createdAt;

    @UpdateTimestamp
    @Column(name = "updated_at")
    private LocalDateTime updatedAt;
}
