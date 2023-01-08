import { Component, NgZone, OnInit } from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { TrainerService } from 'src/app/service/trainer.service';

@Component({
  selector: 'app-edit-trainer',
  templateUrl: './edit-trainer.component.html',
  styleUrls: ['./edit-trainer.component.css']
})
export class EditTrainerComponent implements OnInit {
  getId: any;
  updateForm: FormGroup;

  constructor(
    public formBuilder: FormBuilder,
    private router: Router,
    private ngZone: NgZone,
    private activatedRoute: ActivatedRoute,
    private trainerService: TrainerService
  ) {
    this.getId = this.activatedRoute.snapshot.paramMap.get('id');
    this.trainerService.GetTrainer(this.getId).subscribe(res => {
      this.updateForm.setValue({
        name: res['name'],
        email: res['email'],
        image:res['image'],
        password: res['password']
      });
    });
    this.updateForm = this.formBuilder.group({
      name: [''],
      email: [''],
      image:[''],
      password: ['']
    })
  }
  ngOnInit() { }
  onUpdate(): any {
    this.trainerService.updateTrainer(this.getId, this.updateForm.value)
    .subscribe(() => {
        console.log('Data updated successfully!')
        this.ngZone.run(() => this.router.navigateByUrl('/trainers'))
      }, (err) => {
        console.log(err);
    });
  }
}
