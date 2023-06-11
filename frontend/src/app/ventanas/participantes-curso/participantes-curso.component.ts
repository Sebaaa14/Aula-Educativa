import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';

interface Alumno {
  rut: string;
  nombre: string;
  apellidoP: string;
  apellidoM: string;
  colegio: string;
}

@Component({
  selector: 'app-participantes-curso',
  templateUrl: './participantes-curso.component.html',
  styleUrls: ['./participantes-curso.component.scss']
})
export class ParticipantesCursoComponent implements OnInit {
  alumnos: Alumno[] = [];
  constructor(private http: HttpClient) { }

  ngOnInit(): void {
    this.cargarAlumnos();
  }

  cargarAlumnos() {
    this.http.get<Alumno[]>('assets/json/participantes.json').subscribe(
      (data: Alumno[]) => {
        this.alumnos = data;
      },
      (error: any) => {
        console.error('Error al leer el archivo JSON:', error);
      }
    );
  }
}
