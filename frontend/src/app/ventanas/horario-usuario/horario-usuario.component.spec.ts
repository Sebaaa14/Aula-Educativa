import { ComponentFixture, TestBed } from '@angular/core/testing';

import { HorarioUsuarioComponent } from './horario-usuario.component';

describe('HorarioUsuarioComponent', () => {
  let component: HorarioUsuarioComponent;
  let fixture: ComponentFixture<HorarioUsuarioComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [HorarioUsuarioComponent]
    });
    fixture = TestBed.createComponent(HorarioUsuarioComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
