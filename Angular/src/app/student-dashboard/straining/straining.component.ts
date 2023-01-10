import { Component, NgZone} from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms';
import { CrudService } from 'src/app/service/crud.service';
import { CourseService } from 'src/app/service/course.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-straining',
  templateUrl: './straining.component.html',
  styleUrls: ['./straining.component.scss']
})
export class StrainingComponent {
  courseForm: FormGroup;
  Trainings: any = [];
  // Courses: any = [];

  constructor(
    public formBuilder: FormBuilder,
    private router: Router,
    private crudService: CrudService,
    private ngZone: NgZone,
    private courseService: CourseService,
    ) {
      this.courseForm = this.formBuilder.group({
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
    // this.courseService.GetCourses().subscribe((res: any) => {
    //   console.log(res)
    //   this.Courses =res;
    // });
  }
  onSubmit(): any {
    this.courseService.AddCourse(this.courseForm.value)
    .subscribe(() => {
        console.log('Data added successfully!')
        this.ngZone.run(() => (<any>this.router).navigateByUrl('/courses'))
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
