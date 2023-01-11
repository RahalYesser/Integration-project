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
import com.example.demo.entity.Trainer;
import com.example.demo.service.TrainerService;

@RestController
@RequestMapping()
@CrossOrigin(origins ="http://localhost:4200")
public class TrainerController {

    private final TrainerService service;

    public TrainerController(TrainerService service){
        this.service = service;
    }

    @GetMapping("/List")
    public Page<Trainer> findAll(@RequestParam("size") int size,@RequestParam("nb") int nb){
        return service.findAll(size, nb);
    }

    @GetMapping("/all")
    public List<Trainer> listTrainer(){
        return service.listTrainer();
    }

    @PostMapping("/create")
    public Trainer save(@RequestBody Trainer trainer){
        return service.save(trainer);
    }

    @DeleteMapping("/delete/{id}")
    public void delete(@PathVariable Integer id){
        service.deleteById(id);
    }


    @PutMapping(value="/update/{id}")
    public Trainer updateTrainer( @RequestBody Trainer data,@PathVariable Integer id ){
        Trainer trainer =service.findbyId(id);
        trainer.setName(data.getName());
        trainer.setEmail(data.getEmail());
        trainer.setImage(data.getImage());
        trainer.setPassword(data.getPassword());
        service.save(trainer);
        return trainer;
    };

    @GetMapping("/read/{id}")
    public Trainer getTrainer(@PathVariable Integer id){
        return service.getById(id);
    }

    @GetMapping("/name")
        public Page<Trainer> findByName(@RequestParam("size") int size,
                @RequestParam("nb") int nb,
                @RequestParam("name") String name) {
                    return service.findbyName(nb, nb, name);
            
     }
}
    
    

