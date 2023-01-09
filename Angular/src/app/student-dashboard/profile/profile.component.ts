import { Component } from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms';
import { KeycloakService } from 'keycloak-angular';
import { HttpService } from "../../service/http.service";
@Component({
  selector: 'app-profile',
  templateUrl: './profile.component.html',
  styleUrls: ['./profile.component.css']
})
export class ProfileComponent {
  sendForm: FormGroup;

  constructor(private keycloakService: KeycloakService,
    public formBuilder: FormBuilder,
    public http: HttpService){
      this.sendForm = this.formBuilder.group({
        email: [''],
        message: [''],
        })
    }
  async ngOnInit(): Promise<void>
  {
    console.log(this.keycloakService.getUsername());
    let userDetails = await this.keycloakService.loadUserProfile();
    console.log(userDetails);
  }
  onsend(){
    this.http.sendEmail(this.sendForm.value).subscribe(
      data => {
        let res:any = data;
        console.log(res)
        console.log(
          `successfully mail has been sent`
        );
      },
    );
  }
}
window.addEventListener('DOMContentLoaded', event => {

  // Navbar shrink function
  var navbarShrink = function () {
      const navbarCollapsible = document.body.querySelector('#mainNav');
      if (!navbarCollapsible) {
          return;
      }
      if (window.scrollY === 0) {
          navbarCollapsible.classList.remove('navbar-shrink')
      } else {
          navbarCollapsible.classList.add('navbar-shrink')
      }

  };

  // Shrink the navbar
  navbarShrink();

  // Shrink the navbar when page is scrolled
  document.addEventListener('scroll', navbarShrink);

});
