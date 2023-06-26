import { Component } from '@angular/core';
import { FormBuilder, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { HttpClient } from '@angular/common/http';
import { AuthService } from 'src/app/services/authorization/auth.service';

@Component({
  selector: 'app-iniciar-sesion',
  templateUrl: './iniciar-sesion.component.html',
  styleUrls: ['./iniciar-sesion.component.scss']
})
export class IniciarSesionComponent {
  userForm = this.fb.group({
    usuario: ['', Validators.compose([
      Validators.pattern("^[0-9]+[-]{1}[0-9kK]{1}$"),
      Validators.required
    ])],
    contrasena: ['', Validators.compose([
      Validators.pattern("^.{3,10}$"),
      Validators.required
    ])],
  });

  constructor(private fb: FormBuilder, private router: Router, private http: HttpClient, private AuthService:AuthService) {}

  iniciarSesion() {
    if (this.userForm.valid) {
      const rut_alumno = this.userForm.value.usuario;
      const contrasena = this.userForm.value.contrasena;
      console.log(rut_alumno,contrasena);
      const requestBody = { rut_alumno, contrasena };

      this.http.post('http://localhost:9000/iniciarSesion', requestBody).subscribe(
        (response: any) => {
          // La autenticación fue exitosa
           this.AuthService.setToken(response.token);
          // Redirige a la otra ventana
          this.router.navigate(['home']);
          alert(response.message);
        },
        (error: any) => {
          // Ocurrió un error durante la autenticación
          alert(error.error);
        }
      );
    }
  }
}
