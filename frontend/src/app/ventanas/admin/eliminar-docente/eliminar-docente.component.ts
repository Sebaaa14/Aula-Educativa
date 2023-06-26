import { Component,OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-eliminar-docente',
  templateUrl: './eliminar-docente.component.html',
  styleUrls: ['./eliminar-docente.component.scss']
})
export class EliminarDocenteComponent implements OnInit {
  docentes: any[] = [];
  

  constructor(private http: HttpClient) { }

  ngOnInit(): void {
    this.obtenerDocentes();
  }


  obtenerDocentes() {
    this.http.get<any>('http://localhost:9000/docentes').subscribe(
      (response) => {
        this.docentes = response.data;
      },
      (error) => {
        console.error(error);
      }
    );
  }

  eliminarDocente(idDocente: string) {
    if (idDocente) {
      this.http.delete(`http://localhost:9000/eliminarDocente/${idDocente}`, { observe: 'response' }).subscribe(
        (response: any) => {
          alert("Docente eliminado correctamente");
        },
        (error) => {
          console.error(error);
          alert("Error al eliminar el Docente");
        }
      );
    } else {
      alert("Ingrese el nombre del docente");
    }
  }

}
