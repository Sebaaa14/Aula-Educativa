import { Component } from '@angular/core';
import { FormBuilder, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-anadir-docente',
  templateUrl: './anadir-docente.component.html',
  styleUrls: ['./anadir-docente.component.scss']
})
export class AnadirDocenteComponent {



  registrateForm = this.fb.group({
    nombre: ['', Validators.compose([
      Validators.pattern("^[a-zA-ZÀ-ÿ]+ [a-zA-ZÀ-ÿ]{1,40}$"),
      Validators.required
    ])],
    correo: ['', Validators.compose([
      Validators.pattern("^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$"),
      Validators.required
    ])],
    horario: ['', Validators.required], 
    rol: ['', Validators.required]
  })



  constructor(private fb: FormBuilder, private router: Router, private http: HttpClient) { }



  validarCampo(campo: string): boolean {
    const campoForm = this.registrateForm.get(campo);
    if (campoForm !== null && campoForm.invalid && (campoForm.touched || campoForm.dirty)) {
      console.log(`El campo ${campo} es inválido`);
      return true;
    }
    return false;
  }


  registrate() {
    if (this.registrateForm.valid) {
      const nombre=this.registrateForm.value.nombre;
      const email=this.registrateForm.value.correo;
      const horario=this.registrateForm.value.horario;
      const rol=this.registrateForm.value.rol;

      const requestBody = {
        nombre: nombre,
        email:email,
        horario:horario,
        rol:rol
      }


    this.http.post('http://localhost:9000/registrarDocente', requestBody).subscribe((response: any) => {
      if (response) {
        alert("Docente registrado correctamente");
        this.registrateForm.reset();
      } 
    }, (error) => {
      console.error(error);
    });
    } else { alert("Complete todos los campos"); }
  }



}
