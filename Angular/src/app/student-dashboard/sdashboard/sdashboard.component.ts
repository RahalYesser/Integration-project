import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-sdashboard',
  templateUrl: './sdashboard.component.html',
  styleUrls: ['./sdashboard.component.scss']
})
export class SdashboardComponent implements OnInit {

  constructor() { }

  ngOnInit(): void {
  }
  title = 'admin';
  sideBarOpen = true;

  sideBarToggler() {
    this.sideBarOpen = !this.sideBarOpen;
  }
}
