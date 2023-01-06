import { Component} from '@angular/core';

@Component({
  selector: 'app-landing-page',
  templateUrl: './landing-page.component.html',
  styleUrls: ['./landing-page.component.scss']
})
export class LandingPageComponent {
  
  KEY ="admin";

  value = '';
  onKey(event: any) {
    this.value = event.target.value;
    console.log(this.value);

  }
  

  }

