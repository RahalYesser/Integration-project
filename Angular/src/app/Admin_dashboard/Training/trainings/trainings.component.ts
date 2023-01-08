import { Component, NgZone, OnInit} from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms';
import { Router,ActivatedRoute  } from '@angular/router';
import { CrudService } from 'src/app/service/crud.service';


@Component({
  selector: 'app-trainings',
  templateUrl: './trainings.component.html',
  styleUrls: ['./trainings.component.scss']
})
export class TrainingsComponent implements OnInit {
  trainingForm: FormGroup;
  Trainings: any = [];

  constructor(
    public formBuilder: FormBuilder,
    private router: Router,
    private ngZone: NgZone,
    private crudService: CrudService,

    ) {
      this.trainingForm = this.formBuilder.group({
      name: [''],
      trainerName: [''],
      date: [''],
      description: ['']})

    }

    ngOnInit(): void {
    this.crudService.GetTrainings().subscribe((res: any) => {
      console.log(res)
      this.Trainings =res;
    });
  }

  delete(id:any, i:any) {
    console.log(id);
    if(window.confirm('Do you want to go ahead?')) {
      this.crudService.deleteTraining(id).subscribe((res: any) => {
        this.Trainings.splice(i, 1);
      })
    }
  }
  onSubmit(): any {
    this.crudService.AddTraining(this.trainingForm.value)
    .subscribe(() => {
        console.log('Data added successfully!')
        this.ngZone.run(() => (<any>this.router).navigateByUrl('/trainings'))
      }, (err) => {
        console.log(err);
    });
  }
  title = 'admin';
  sideBarOpen = true;
  sideBarToggler() {
    this.sideBarOpen = !this.sideBarOpen;
  }
}
export class CardOverviewExample {}
export class GridListOverviewExample {}
