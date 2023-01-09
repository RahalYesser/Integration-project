import { Component, OnInit } from '@angular/core';
import { CrudService } from 'src/app/service/crud.service';
import { TrainerService } from 'src/app/service/trainer.service';
@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.scss']
})
export class DashboardComponent implements OnInit {
  Trainers: any = [];
  Trainings: any = [];
  constructor(
     private trainerService: TrainerService,
     private crudService: CrudService
     ) { }

  ngOnInit(): void {
    this.trainerService.GetTrainers().subscribe((res: any) => {
      console.log(res)
      this.Trainers =res;});

      this.crudService.GetTrainings().subscribe((res: any) => {
        console.log(res)
        this.Trainings =res;
    });
  }
  title = 'admin';
  sideBarOpen = true;

  sideBarToggler() {
    this.sideBarOpen = !this.sideBarOpen;
  }
}
