  import { Component } from '@angular/core';

  @Component({
    selector: 'app-admin',
    templateUrl: './admin.component.html',
    styleUrls: ['./admin.component.scss']
  })
  export class AdminComponent {


    // registrateForm = this.fb.group({
    //   apoderado: ['', Validators.compose([
    //     Validators.pattern("^[a-zA-ZÀ-ÿ]+ [a-zA-ZÀ-ÿ]{1,40}$"),
    //     Validators.required
    //   ])],
    //   nombre: ['', Validators.compose([
    //     Validators.pattern("^[a-zA-ZÀ-ÿ]+ [a-zA-ZÀ-ÿ]{1,40}$"),
    //     Validators.required
    //   ])],
    //   colegio: ['', Validators.compose([
    //     Validators.pattern("^[a-zA-ZÀ-ÿ]+( [a-zA-ZÀ-ÿ]{1,40})?$"),
    //     Validators.required
    //   ])],
    //   rut: ['', Validators.compose([
    //     Validators.pattern("^[0-9]+[-]{1}[0-9kK]{1}$"),
    //     Validators.required
    //   ])],
    //   rutApoderado: ['', Validators.compose([
    //     Validators.pattern("^[0-9]+[-]{1}[0-9kK]{1}$"),
    //     Validators.required
    //   ])],
    //   contrasena: ['', Validators.compose([
    //     Validators.pattern("^.{6,10}$"),
    //     Validators.required
    //   ])],
    //   curso: ['', Validators.compose([
    //     Validators.pattern("^[1-8]+[º]{1}"),
    //     Validators.required
    //   ])],
    //   correo: ['', Validators.compose([
    //     Validators.pattern("^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$"),
    //     Validators.required
    //   ])],
    //   telefono: ['', Validators.compose([
    //     Validators.pattern("^[0-9]{8,9}$"),
    //     Validators.required
    //   ])]
    // })

    // constructor(private fb: FormBuilder, private router: Router, private http: HttpClient) { }

    // validarCampo(campo: string): boolean {
    //   const campoForm = this.registrateForm.get(campo);
    //   if (campoForm !== null && campoForm.invalid && (campoForm.touched || campoForm.dirty)) {
    //     console.log(`El campo ${campo} es inválido`);
    //     return true;
    //   }
    //   return false;
    // }

    // registrate() {
    //   if (this.registrateForm.valid) {
    //     const nombre=this.registrateForm.value.nombre;
    //     const rut=this.registrateForm.value.rut;
    //     const curso=this.registrateForm.value.curso;
    //     const colegio=this.registrateForm.value.colegio;
    //     const contrasena=this.registrateForm.value.contrasena;
    //     const apoderado=this.registrateForm.value.apoderado;
    //     const rutApoderado=this.registrateForm.value.rutApoderado;
    //     const email=this.registrateForm.value.correo;
    //     const telefono=this.registrateForm.value.telefono;

    //     const requestBody = {
    //       nombre: nombre,
    //       rut_alumno:rut,
    //       curso:curso,
    //       colegio:colegio,
    //       contrasena:contrasena,
    //       apoderado:apoderado,
    //       rut_apoderado:rutApoderado,
    //       email:email,
    //       telefono:telefono
    //     }


    //   this.http.post('http://localhost:9000/registrarAlumno', requestBody).subscribe((response: any) => {
    //     if (response) {
    //       alert("Alumno registrado correctamente");
    //       this.registrateForm.reset();
    //     } 
    //   }, (error) => {
    //     console.error(error);
    //   });
    //   } else { alert("Complete todos los campos"); }
    // }
    // //Cierra el registrate


    // eliminarAlumno(rutAlumno: string) {
    //   if (rutAlumno) {
    //     this.http.delete(`http://localhost:9000/eliminarAlumno/${rutAlumno}`, { observe: 'response' }).subscribe(
    //       (response: any) => {
    //         alert("Alumno eliminado correctamente");
    //       },
    //       (error) => {
    //         console.error(error);
    //         alert("Error al eliminar el alumno");
    //       }
    //     );
    //   } else {
    //     alert("Ingrese el Rut del alumno");
    //   }
    // }
    
    
    
    




}

