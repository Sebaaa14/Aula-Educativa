import { Component } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';

@Component({
  selector: 'app-olvidaste-contrasena',
  templateUrl: './olvidaste-contrasena.component.html',
  styleUrls: ['./olvidaste-contrasena.component.scss']
})
export class OlvidasteContrasenaComponent {
  resetForm: FormGroup;
  mostrarMensajeCompletado: boolean = false;
  mostrarMensajeError: boolean = false;
  mensajeError: string = '';

  constructor(private fb: FormBuilder, private http: HttpClient, private router:Router) {
    this.resetForm = this.fb.group({
      rut: ['', Validators.compose([
        Validators.pattern("^[0-9]+[-]{1}[0-9kK]{1}$"),
        Validators.required
      ])],
      contraseña: ['', Validators.compose([
        Validators.pattern("^.{3,10}$"),
        Validators.required
      ])],
      confirmarContraseña: ['', Validators.compose([
        Validators.pattern("^.{3,10}$"),
        Validators.required
      ])]
    });
  }

  mostrarContrasenaNoCoinciden: boolean = false;

  recuperarContrasena() {
    if (this.resetForm.valid) {
      const rutAlumno = this.resetForm.value.rut;
      const contrasena = this.resetForm.value.contraseña;
      const recontrasena = this.resetForm.value.confirmarContraseña;

      const requestBody = {
        rut_alumno: rutAlumno,
        contrasena: contrasena,
        recontrasena: recontrasena
      };

      if (contrasena !== recontrasena) {
        this.mostrarContrasenaNoCoinciden = true;
        return; // Detener el proceso de recuperación de contraseña si las contraseñas no coinciden
      }

      this.http.post('http://localhost:9000/recuperarContrasena', requestBody)
        .subscribe((response: any) => {
          if (response.mensaje) {
            // Contraseña actualizada exitosamente
            alert("Contraseña actualizada correctamente");
            this.mostrarMensajeCompletado = true;
            this.mostrarMensajeError = false;
            this.router.navigate(['home']);
          } else {
            // Error en el proceso de recuperación de contraseña
            this.mostrarMensajeCompletado = false;
            this.mostrarMensajeError = true;
            this.mensajeError = response.resultado;
          }
        }, (error) => {
          console.error(error);
        });
    }
  }
}
