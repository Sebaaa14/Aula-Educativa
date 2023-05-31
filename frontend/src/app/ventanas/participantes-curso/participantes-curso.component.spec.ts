import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ParticipantesCursoComponent } from './participantes-curso.component';

describe('ParticipantesCursoComponent', () => {
  let component: ParticipantesCursoComponent;
  let fixture: ComponentFixture<ParticipantesCursoComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [ParticipantesCursoComponent]
    });
    fixture = TestBed.createComponent(ParticipantesCursoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
