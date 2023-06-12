import { Component, OnInit } from '@angular/core';
import { FormBuilder, Validators } from '@angular/forms';
import { Router } from '@angular/router';

@Component({
  selector: 'app-registrate',
  templateUrl: './registrate.component.html',
  styleUrls: ['./registrate.component.scss']
})

export class RegistrateComponent {
  registrateForm = this.fb.group({
    apoderado: ['', Validators.compose([
      Validators.pattern("^[a-zA-ZÀ-ÿ\s]{1,40}$"),
      Validators.required
    ])],
    nombre: ['', Validators.compose([
      Validators.pattern("^[a-zA-ZÀ-ÿ\s]{1,40}$"),
      Validators.required
    ])],
    rut: ['', Validators.compose([
      Validators.pattern("^[0-9]+[-]{1}[0-9kK]{1}$"),
      Validators.required
    ])],
    rutApoderado: ['', Validators.compose([
      Validators.pattern("^[0-9]+[-]{1}[0-9kK]{1}$"),
      Validators.required
    ])],
    contrasena: ['', Validators.compose([
      Validators.pattern("^.{6,10}$"),
      Validators.required
    ])],
    curso: ['', Validators.compose([
      Validators.pattern("^[1-8]+[º]{1}"),
      Validators.required
    ])],
    correo: ['', Validators.compose([
      Validators.pattern("^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$"),
      Validators.required
    ])],
    telefono: ['', Validators.compose([
      Validators.pattern("^\d{9}$"),
      Validators.required
    ])],
  })

  constructor(private fb: FormBuilder, private router: Router) {}

  validarCampo(campo: string): boolean {
    const campoForm = this.registrateForm.get(campo);
    return campoForm !== null && campoForm.invalid && (campoForm.touched || campoForm.dirty);
  }
  

  onSubmit() {
    if (this.registrateForm.valid) {
      // Realizar acciones cuando el formulario es válido
      this.router.navigate(['/mainpage']);
    } else {
      // Realizar acciones cuando el formulario es inválido
      this.registrateForm.markAllAsTouched();
    }
  }

  registrate() {
    if (this.registrateForm.valid) {
      // Redirige a la otra ventana
      this.router.navigate(['home']);
    }
  }
}
