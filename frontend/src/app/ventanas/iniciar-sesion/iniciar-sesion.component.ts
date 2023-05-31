import { Component } from '@angular/core';
import { FormBuilder, Validators } from '@angular/forms';

@Component({
  selector: 'app-iniciar-sesion',
  templateUrl: './iniciar-sesion.component.html',
  styleUrls: ['./iniciar-sesion.component.scss']
})


export class IniciarSesionComponent {
  userForm = this.fb.group({
    usuario: ['',Validators.compose([
      Validators.pattern("^[0-9]{8,9}$"),
      Validators.required
    ])],
    contrasena: ['',Validators.compose([
      Validators.pattern("^.{6,10}$"),
      Validators.required
    ])],
  });
  constructor(private fb: FormBuilder){}
}

