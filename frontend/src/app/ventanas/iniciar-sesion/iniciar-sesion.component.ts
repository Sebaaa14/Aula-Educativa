import { Component } from '@angular/core';
import { FormBuilder, Validators } from '@angular/forms';
import { Router } from '@angular/router';

@Component({
  selector: 'app-iniciar-sesion',
  templateUrl: './iniciar-sesion.component.html',
  styleUrls: ['./iniciar-sesion.component.scss']
})


export class IniciarSesionComponent {
  userForm = this.fb.group({
    usuario: ['', Validators.compose([
      Validators.pattern("^[0-9]{8,9}$"),
      Validators.required
    ])],
    contrasena: ['', Validators.compose([
      Validators.pattern("^.{6,10}$"),
      Validators.required
    ])],
  });

  constructor(private fb: FormBuilder, private router: Router) {}

  iniciarSesion() {
    if (this.userForm.valid) {
      // Redirige a la otra ventana
      this.router.navigate(['home']);
    }
  }
}



