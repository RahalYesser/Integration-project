package com.example.demo.controller;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.entity.Training;
import com.example.demo.service.TrainingService;

@RestController
@RequestMapping("/api/training")
@CrossOrigin(origins = "*")
public class TrainingController {

	private final TrainingService trainingService;

	public TrainingController(TrainingService trainingService) {
		this.trainingService = trainingService;
	}
	
	@GetMapping("/List")
	public Page<Training> findAll(@RequestParam("size") int size, @RequestParam("nb") int nb) {
		return trainingService.findAll(size, nb);
	}

	@GetMapping("/all")
	public List<Training> listTrainig() {
		return trainingService.listTraining();
	}

	@PostMapping("/create")
	public Training save(@RequestBody Training training) {
		return trainingService.save(training);
	}

	@DeleteMapping("/delete")
	public void delete(@RequestParam Integer id) {
		trainingService.deleteById(id);
	}

	@PutMapping("/update")
	public void updateTraining(@RequestBody Training training) {
		trainingService.save(training);
	}

	@GetMapping("/{id}")
	public Training getTrainingById(@PathVariable Integer id) {
		return trainingService.getById(id);
	}

	@GetMapping("/name")
	public Page<Training> findByContainingName(@RequestParam("size") int size,
			@RequestParam("nbPage") int nb,
			@RequestParam("name") String name) {
		return trainingService.findByName(size, nb, name);
	}


}
