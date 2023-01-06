package com.example.demo.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.entity.Trainer;

public interface TrainerRepository extends JpaRepository<Trainer,Integer> {
    
    Page<Trainer> findAll(Pageable page);

	Page<Trainer> findByNameContainingIgnoreCase(String name, Pageable pageable);
}
