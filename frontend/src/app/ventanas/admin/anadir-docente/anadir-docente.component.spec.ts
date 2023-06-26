import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AnadirDocenteComponent } from './anadir-docente.component';

describe('AnadirDocenteComponent', () => {
  let component: AnadirDocenteComponent;
  let fixture: ComponentFixture<AnadirDocenteComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [AnadirDocenteComponent]
    });
    fixture = TestBed.createComponent(AnadirDocenteComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
