package com.walletapp.demo.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Entity
@RequiredArgsConstructor
@Table(name = "category_budget")
@Setter
@Getter
public class CategoryBudget extends Budget {

    @ManyToOne
    @JoinColumn(name = "category_id")
    private Category category;
}
