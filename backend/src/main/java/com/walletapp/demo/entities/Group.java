package com.walletapp.demo.entities;

import java.time.LocalDateTime;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "groups", uniqueConstraints = {
                @UniqueConstraint(columnNames = { "user_id", "name" })
}, indexes = {
                @Index(name = "idx_group_user_id", columnList = "user_id"),
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
        @JoinColumn(name = "user_id", nullable = false)
        private User user;

        @Column(nullable = false)
        private String name;
        private String description;

        @Column(name = "budget_limit")
        private double budgetLimit;

        private String color;

        @Column(name = "is_active")
        private boolean isActive;

        @CreationTimestamp
        @Column(name = "created_at")
        private LocalDateTime createdAt;

        @UpdateTimestamp
        @Column(name = "updated_at")
        private LocalDateTime updatedAt;
}
