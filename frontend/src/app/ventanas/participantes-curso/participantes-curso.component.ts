import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';


@Component({
  selector: 'app-participantes-curso',
  templateUrl: './participantes-curso.component.html',
  styleUrls: ['./participantes-curso.component.scss']
})


export class ParticipantesCursoComponent implements OnInit {

  alumnos: any[] = [];

  constructor(private http: HttpClient) { }

  ngOnInit() {
    this.obtenerAlumnos();
  }

  obtenerAlumnos() {
    this.http.get('http://localhost:9000/alumnos').subscribe(
      (response: any) => {
        if (response.status === 'éxito') {
          this.alumnos = response.data;
        }
      },
      (error: any) => {
        console.error(error);
      }
    );

  }
}
