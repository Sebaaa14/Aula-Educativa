import { Component } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-eliminar-alumno',
  templateUrl: './eliminar-alumno.component.html',
  styleUrls: ['./eliminar-alumno.component.scss']
})
export class EliminarAlumnoComponent {

  constructor(private http: HttpClient) { }

  eliminarAlumno(rutAlumno: string) {
    if (rutAlumno) {
      this.http.delete(`http://localhost:9000/eliminarAlumno/${rutAlumno}`, { observe: 'response' }).subscribe(
        (response: any) => {
          alert("Alumno eliminado correctamente");
        },
        (error) => {
          console.error(error);
          alert("Error al eliminar el alumno");
        }
      );
    } else {
      alert("Ingrese el Rut del alumno");
    }
  }
}
