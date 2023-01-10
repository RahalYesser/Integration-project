import { AfterViewInit, Component, Directive, ViewChild } from '@angular/core';
import { MatPaginator } from '@angular/material/paginator';
import { MatTableDataSource } from '@angular/material/table';
import { UserService } from 'src/app/service/user.service';
@Component({
  selector: 'app-students',
  templateUrl: './students.component.html',
  styleUrls: ['./students.component.scss']
})
export class StudentsComponent {
  Users: any;
  constructor(private userService: UserService,) { }
  ngOnInit(): void {
    this.userService.GetUsers().subscribe((res: any) => {
      console.log(res)
      this.Users =res;
    });
  }
  title = 'admin';
  sideBarOpen = true;

  sideBarToggler() {
    this.sideBarOpen = !this.sideBarOpen;
  }
}

