import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';

interface Profesor {
  titulo: string;
  nombre: string;
  correo: string;
  horario: string;
}

@Component({
  selector: 'app-docentes',
  templateUrl: './docentes.component.html',
  styleUrls: ['./docentes.component.scss']
})
export class DocentesComponent implements OnInit {
  profesores: Profesor[] = [];

  constructor(private http: HttpClient) { }

  ngOnInit() {
    this.cargarDatos();
  }

  cargarDatos() {
    this.http.get<Profesor[]>('app/json/docentes.json').subscribe(
      (data) => {
        this.profesores = data;
      },
      (error) => {
        console.error('Error al cargar los datos de los profesores:', error);
      }
    );
  }
}
