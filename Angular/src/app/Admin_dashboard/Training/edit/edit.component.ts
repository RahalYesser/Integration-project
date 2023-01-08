import { Component, NgZone, OnInit } from '@angular/core';
import { FormGroup, FormBuilder } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { CrudService } from 'src/app/service/crud.service';

@Component({
  selector: 'app-edit',
  templateUrl: './edit.component.html',
  styleUrls: ['./edit.component.css']
})
export class EditComponent implements OnInit {
  getId: any;
  updateForm: FormGroup;

  constructor(
    public formBuilder: FormBuilder,
    private router: Router,
    private ngZone: NgZone,
    private activatedRoute: ActivatedRoute,
    private crudService: CrudService
  ) {
    this.getId = this.activatedRoute.snapshot.paramMap.get('id');
    this.crudService.GetTraining(this.getId).subscribe(res => {
      this.updateForm.setValue({
        name: res['name'],
        trainerName: res['trainerName'],
        date: res['date'],
        description: res['description']
      });
    });
    this.updateForm = this.formBuilder.group({
      name: [''],
      trainerName: [''],
      date: [''],
      description: ['']
    })
  }
  ngOnInit() { }
  onUpdate(): any {
    this.crudService.updateTraining(this.getId, this.updateForm.value)
    .subscribe(() => {
        console.log('Data updated successfully!')
        this.ngZone.run(() => this.router.navigateByUrl('/trainings'))
      }, (err) => {
        console.log(err);
    });
  }
}
