package com.walletapp.demo.entity;

import java.time.LocalDateTime;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import com.walletapp.demo.enums.PaymentType;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "payment_methods", uniqueConstraints = @UniqueConstraint(columnNames = { "user_id", "name" }), indexes = {
        @Index(name = "idx_payment_method_user_id", columnList = "user_id"),
        @Index(name = "idx_payment_method_issuer", columnList = "issuer"),

})
@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
public class PaymentMethod {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "payment_method_id")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User user;
    private String alias;

    @Enumerated(EnumType.STRING)
    @Column(name = "payment_type")
    private PaymentType type;

    private String issuer;

    @Column(name = "is_default")
    private boolean isDefault;

    @Column(name = "is_active")
    private boolean isActive;

    @CreationTimestamp
    @Column(name = "created_at")
    private LocalDateTime createdAt;

    @UpdateTimestamp
    @Column(name = "updated_at")
    private LocalDateTime updatedAt;
}
