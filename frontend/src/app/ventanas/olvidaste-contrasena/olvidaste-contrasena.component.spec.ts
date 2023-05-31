import { ComponentFixture, TestBed } from '@angular/core/testing';

import { OlvidasteContrasenaComponent } from './olvidaste-contrasena.component';

describe('OlvidasteContrasenaComponent', () => {
  let component: OlvidasteContrasenaComponent;
  let fixture: ComponentFixture<OlvidasteContrasenaComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [OlvidasteContrasenaComponent]
    });
    fixture = TestBed.createComponent(OlvidasteContrasenaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
