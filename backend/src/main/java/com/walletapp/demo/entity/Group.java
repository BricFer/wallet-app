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
@Table(name = "expense_groups", uniqueConstraints = {
                @UniqueConstraint(columnNames = { "created_by_id", "name" })
}, indexes = {
                @Index(name = "idx_group_user_id", columnList = "created_by_id"),
})
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class Group {

        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        @Column(name = "group_id")
        private Long id;

        @ManyToOne
        @JoinColumn(name = "created_by_id", nullable = false)
        private User user;

        @Column(nullable = false)
        private String name;
        private String description;

        @Column(name = "budget_limit")
        private double budgetLimit;

        @Column(name = "is_active")
        private boolean isActive;

        @CreationTimestamp
        @Column(name = "created_at")
        private LocalDateTime createdAt;

        @UpdateTimestamp
        @Column(name = "updated_at")
        private LocalDateTime updatedAt;
}
