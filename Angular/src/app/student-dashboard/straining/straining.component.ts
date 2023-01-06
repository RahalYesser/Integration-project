import { Component, NgZone, OnInit} from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms';
import { Router,ActivatedRoute  } from '@angular/router';
import { CrudService } from 'src/app/service/crud.service';


@Component({
  selector: 'app-straining',
  templateUrl: './straining.component.html',
  styleUrls: ['./straining.component.scss']
})
export class StrainingComponent {
  trainingForm: FormGroup;
  Trainings: any = [];
  getId: any;

  constructor(
    public formBuilder: FormBuilder,
    private router: Router,
    private ngZone: NgZone,
    private activatedRoute: ActivatedRoute,
    private crudService: CrudService
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
  // onSubmit(): any {
  //   this.crudService.AddTraining(this.trainingForm.value)
  //   .subscribe(() => {
  //       console.log('Data added successfully!')
  //       this.ngZone.run(() => (<any>this.router).navigateByUrl('/trainings'))
  //     }, (err) => {
  //       console.log(err);
  //   });
  // }
  title = 'admin';
  sideBarOpen = true;
  sideBarToggler() {
    this.sideBarOpen = !this.sideBarOpen;
  }
}
export class CardOverviewExample {}
export class GridListOverviewExample {}
