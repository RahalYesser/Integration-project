import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { DashboardComponent } from './Admin_dashboard/dashboard/dashboard.component';
import { StudentsComponent } from './Admin_dashboard/students/students.component';
import { TrainingsComponent } from './Admin_dashboard/trainings/trainings.component';
import { AppComponent } from './app.component';
import { AuthGuard } from './Guards/security.guard';
import { LandingPageComponent } from './Landing-page/landing-page.component';
import { ProfileComponent } from './student-dashboard/profile/profile.component';
import { SdashboardComponent } from './student-dashboard/sdashboard/sdashboard.component';
import { SsidenavComponent } from './student-dashboard/ssidenav/ssidenav.component';
import { StrainingComponent } from './student-dashboard/straining/straining.component';


const routes: Routes = [
  {path:'',redirectTo:'landing',pathMatch:'full'},
  {path:'landing',component:LandingPageComponent},
  {path:'dashboard',component:DashboardComponent},
  {path:'trainings',component:TrainingsComponent},
  {path:'students',component:StudentsComponent},
  {path:'profile',component:ProfileComponent},
  {path:'ssidenav',component:SsidenavComponent},
  {path:'straining',component:StrainingComponent},
  {path:'sdashboard',component:SdashboardComponent},
];
@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
