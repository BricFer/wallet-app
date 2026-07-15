package com.walletapp.demo.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.walletapp.demo.entity.Group;

public interface GroupRepository extends JpaRepository<Group, Long> {

    Optional<Group> findByIdAndUserId(Long groupId, Long userId);

    List<Group> findByUserId(Long userId);

    List<Group> findByUserIdAndIsActiveTrue(Long userId);
}
