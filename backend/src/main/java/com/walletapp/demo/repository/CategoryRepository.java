package com.walletapp.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.walletapp.demo.entity.Category;
import com.walletapp.demo.enums.CategoryType;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Long> {
    List<Category> findByType(CategoryType type);
}
