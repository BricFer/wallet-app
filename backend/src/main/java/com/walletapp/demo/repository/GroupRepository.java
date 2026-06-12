package com.walletapp.demo.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.walletapp.demo.entity.Group;

@Repository
public interface GroupRepository extends JpaRepository<Group, Long> {

    Optional<Group> findByUserIdAndGroupId(Long userId, Long groupId);

    List<Group> findByUserId(Long userId);

    List<Group> findByUserIdAndIsActiveTrue(Long userId);
}
