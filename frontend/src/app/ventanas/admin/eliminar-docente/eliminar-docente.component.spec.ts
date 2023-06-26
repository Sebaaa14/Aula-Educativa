import { ComponentFixture, TestBed } from '@angular/core/testing';

import { EliminarDocenteComponent } from './eliminar-docente.component';

describe('EliminarDocenteComponent', () => {
  let component: EliminarDocenteComponent;
  let fixture: ComponentFixture<EliminarDocenteComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [EliminarDocenteComponent]
    });
    fixture = TestBed.createComponent(EliminarDocenteComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
