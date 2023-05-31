import { ComponentFixture, TestBed } from '@angular/core/testing';

import { InicioRegistradoComponent } from './inicio-registrado.component';

describe('InicioRegistradoComponent', () => {
  let component: InicioRegistradoComponent;
  let fixture: ComponentFixture<InicioRegistradoComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [InicioRegistradoComponent]
    });
    fixture = TestBed.createComponent(InicioRegistradoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
