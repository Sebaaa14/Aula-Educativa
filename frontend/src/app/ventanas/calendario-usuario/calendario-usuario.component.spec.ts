import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CalendarioUsuarioComponent } from './calendario-usuario.component';

describe('CalendarioUsuarioComponent', () => {
  let component: CalendarioUsuarioComponent;
  let fixture: ComponentFixture<CalendarioUsuarioComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [CalendarioUsuarioComponent]
    });
    fixture = TestBed.createComponent(CalendarioUsuarioComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
