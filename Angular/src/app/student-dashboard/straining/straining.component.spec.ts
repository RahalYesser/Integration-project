import { ComponentFixture, TestBed } from '@angular/core/testing';

import { StrainingComponent } from './straining.component';

describe('StrainingComponent', () => {
  let component: StrainingComponent;
  let fixture: ComponentFixture<StrainingComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ StrainingComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(StrainingComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
