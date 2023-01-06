package com.example.demo.repository;

import org.springframework.data.domain.Page;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.entity.Training;

public interface TrainingRepository extends JpaRepository<Training, Integer> {

	Page<Training> findAll(Pageable page);

	Page<Training> findByNameContainingIgnoreCase(String name, Pageable pageable);
}
