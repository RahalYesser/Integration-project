import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss'],
})
export class AppComponent implements OnInit {
  title = 'admin';

  input_key! : string;
  key ="admin2022";
  
  constructor() { }

  ngOnInit(): void {
  }

  sideBarOpen = true;



  sideBarToggler() {
    this.sideBarOpen = !this.sideBarOpen;
  }
}
