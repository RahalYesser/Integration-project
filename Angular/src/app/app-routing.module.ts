import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

import { DashboardComponent } from './Admin_dashboard/dashboard/dashboard.component';
import { StudentsComponent } from './Admin_dashboard/students/students.component';
import { EditTrainerComponent } from './Admin_dashboard/Trainer/edit-trainer/edit-trainer.component';
import { TrainersComponent } from './Admin_dashboard/Trainer/trainers/trainers.component';
import { EditComponent } from './Admin_dashboard/Training/edit/edit.component';
import { TrainingsComponent } from './Admin_dashboard/Training/trainings/trainings.component';

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
  {path:'edit/:id',component:EditComponent},
  {path:'edit-trainer/:id',component:EditTrainerComponent},

  {path:'students',component:StudentsComponent},
  {path:'trainers',component:TrainersComponent},

  {path:'profile',component:ProfileComponent ,canActivate:[AuthGuard]},
  {path:'ssidenav',component:SsidenavComponent ,canActivate:[AuthGuard]},
  {path:'straining',component:StrainingComponent ,canActivate:[AuthGuard]},
  {path:'sdashboard',component:SdashboardComponent ,canActivate:[AuthGuard]},
];
@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
