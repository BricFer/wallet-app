package com.walletapp.demo.entity;

import java.time.LocalDateTime;

import jakarta.persistence.*;
import lombok.RequiredArgsConstructor;

@Entity
@Table(name = "group_budget")
@RequiredArgsConstructor
public class GroupBudget extends Budget {

    @ManyToOne
    @JoinColumn(name = "group_id")
    private Group group;

    @Column(name = "start_date")
    private LocalDateTime startDate;

    @Column(name = "end_date")
    private LocalDateTime endDate;

}
