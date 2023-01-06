package com.example.demo.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.example.demo.entity.Trainer;
import com.example.demo.repository.TrainerRepository;

@Service
public class TrainerService {

    private final TrainerRepository repository;
    public TrainerService(TrainerRepository repository){
        this.repository = repository;
    }

    public List<Trainer> listTrainer() {
        return repository.findAll();
        
    }

    public Page<Trainer> findAll(int size,int nb){
        return repository.findAll(PageRequest.of(nb, size));
    }

    public Page<Trainer> findbyName(int size,int nb,String name){
        return repository.findByNameContainingIgnoreCase(name, PageRequest.of(nb, size));
    }
    public Trainer save(Trainer trainer){
        return repository.save(trainer);
    }
    public void deleteById(Integer id){
        repository.deleteById(id);
    }
    public Trainer getById(Integer id){
        return repository.findById(id).get();   }

    
}
