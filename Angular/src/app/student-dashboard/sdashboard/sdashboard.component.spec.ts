import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SdashboardComponent } from './sdashboard.component';

describe('SdashboardComponent', () => {
  let component: SdashboardComponent;
  let fixture: ComponentFixture<SdashboardComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ SdashboardComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(SdashboardComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
