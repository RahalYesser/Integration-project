import { BrowserModule } from '@angular/platform-browser';
import { APP_INITIALIZER, NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { HttpClientModule } from '@angular/common/http';
import { FormsModule,ReactiveFormsModule } from '@angular/forms';
import { AppComponent } from './app.component';
import { HeaderComponent } from './Admin_dashboard/header/header.component';
import { DashboardComponent } from './Admin_dashboard/dashboard/dashboard.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { SidenavComponent } from './Admin_dashboard/sidenav/sidenav.component';
import { MatSidenavModule } from '@angular/material/sidenav';
import { MatToolbarModule } from '@angular/material/toolbar';
import { MatMenuModule } from '@angular/material/menu';
import { MatIconModule } from '@angular/material/icon';
import { MatDividerModule } from '@angular/material/divider';
import { MatListModule } from '@angular/material/list';
import { TrainingsComponent } from './Admin_dashboard/Training/trainings/trainings.component';
import { MatTreeModule} from '@angular/material/tree';
import { MatTableModule } from '@angular/material/table';
import { MatSortModule } from '@angular/material/sort';
import { MatCardModule} from '@angular/material/card';
import { StudentsComponent } from './Admin_dashboard/students/students.component';
import { MatGridListModule} from '@angular/material/grid-list';
import { ProfileComponent } from './student-dashboard/profile/profile.component';
import { StrainingComponent } from './student-dashboard/straining/straining.component';
import { SsidenavComponent } from './student-dashboard/ssidenav/ssidenav.component';
import { SdashboardComponent } from './student-dashboard/sdashboard/sdashboard.component';
import { KeycloakAngularModule, KeycloakService } from 'keycloak-angular';
import { TrainersComponent } from './Admin_dashboard/Trainer/trainers/trainers.component';
import { MatPaginatorModule } from '@angular/material/paginator';
import { MatFormFieldModule } from '@angular/material/form-field';
import { LandingPageComponent } from './Landing-page/landing-page.component';
import { EditComponent } from './Admin_dashboard/Training/edit/edit.component';
import { EditTrainerComponent } from './Admin_dashboard/Trainer/edit-trainer/edit-trainer.component';

function kcFactory(kcService: KeycloakService) {
  return () =>
    kcService.init({
      config: {
        url: 'http://localhost:8080',
        realm: 'My-realm',
        clientId: 'My-client-id'
      },
      initOptions: {
        checkLoginIframe:false,
        onLoad: 'check-sso',
        silentCheckSsoRedirectUri:
          window.location.origin + '/assets/silent-check-sso.html'

      }
    });
}
@NgModule({
  declarations: [
    AppComponent,
    HeaderComponent,
    DashboardComponent,
    SidenavComponent,
    TrainingsComponent,
    StudentsComponent,
    ProfileComponent,
    StrainingComponent,
    SsidenavComponent,
    SdashboardComponent,
    TrainersComponent,
    LandingPageComponent,
    EditComponent,
    EditTrainerComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    HttpClientModule,
    ReactiveFormsModule,
    FormsModule,
    KeycloakAngularModule,
    // NgModule,
    // NgbModule,
    // * MATERIAL IMPORTS
    MatSidenavModule,
    MatToolbarModule,
    MatMenuModule,
    MatIconModule,
    MatDividerModule,
    MatListModule,
    MatTreeModule,
    MatSortModule,
    MatTableModule,
    MatCardModule,
    MatGridListModule,
    MatPaginatorModule,
    MatFormFieldModule,
  ],
  providers: [
   {
    provide: APP_INITIALIZER,
    useFactory: kcFactory,
    multi: true,
    deps: [KeycloakService]}
  ],
  bootstrap: [AppComponent],
})
export class AppModule {}
