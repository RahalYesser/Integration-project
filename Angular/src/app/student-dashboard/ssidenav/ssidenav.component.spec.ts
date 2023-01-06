import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SsidenavComponent } from './ssidenav.component';

describe('SsidenavComponent', () => {
  let component: SsidenavComponent;
  let fixture: ComponentFixture<SsidenavComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ SsidenavComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(SsidenavComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
