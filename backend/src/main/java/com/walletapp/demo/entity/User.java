package com.walletapp.demo.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

/**
 * @author BricFer
 * @version 1.0
 * 
 *          Entity that represents a User in DB.
 */
@Entity
@Table(name = "users", uniqueConstraints = {
        @UniqueConstraint(columnNames = { "firebase_uid" })
})
@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_id")
    private Long id;

    @Column(name = "username", nullable = true)
    private String username;

    @Column(nullable = false)
    private String fullname;

    @Column(name = "firebase_uid", nullable = false, unique = true)
    private String firebaseUid;

    @Column(name = "phone_number", nullable = false)
    private String phoneNumber;

    @Column(name = "date_of_birth", nullable = false)
    private LocalDateTime dateOfBirth;

    private String address;
    
    @Column(nullable = false)
    private String email;
    
    @Column(nullable = false)
    private String country;

    @Column(name = "default_currency", nullable = false)
    private String defaultCurrency;

    @CreationTimestamp
    @Column(name = "created_at")
    private LocalDateTime createdAt;

    @UpdateTimestamp
    @Column(name = "updated_at")
    private LocalDateTime updatedAt;

    // @OneToMany(mappedBy = "user", cascade = CascadeType.ALL, orphanRemoval = true)
    // private List<Budget> budgets = new ArrayList<>();

    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Expense> expenses = new ArrayList<>();

    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Group> groups = new ArrayList<>();

    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Income> incomes = new ArrayList<>();

    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<PaymentMethod> paymentMethods = new ArrayList<>();

    // @OneToMany(mappedBy = "user", cascade = CascadeType.ALL, orphanRemoval = true)
    // private List<RecurringExpense> recurringExpenses = new ArrayList<>();
}