package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import com.example.demo.entity.Training;
import com.example.demo.repository.TrainingRepository;

@Service
public class TrainingService {

	private final TrainingRepository trainingRepository;

	@Autowired
	public TrainingService(TrainingRepository trainingRepository) {
		this.trainingRepository = trainingRepository;
	}

	public List<Training> listTraining() {
		return trainingRepository.findAll();
	}

	public Page<Training> findAll(int size, int nb) {
		return trainingRepository.findAll(PageRequest.of(nb, size));
	}

	public Page<Training> findByName(int size, int nb, String name) {
		return trainingRepository.findByNameContainingIgnoreCase(name, PageRequest.of(nb, size));
	}

	public Training save(Training training) {
		return trainingRepository.save(training);
	}

	public void deleteById(Integer id) {
		trainingRepository.deleteById(id);
	}

	public Training getById(Integer id) {

		return trainingRepository.findById(id).get();
	}

}
