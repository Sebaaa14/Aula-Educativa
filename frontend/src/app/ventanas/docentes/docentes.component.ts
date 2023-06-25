import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';


@Component({
  selector: 'app-docentes',
  templateUrl: './docentes.component.html',
  styleUrls: ['./docentes.component.scss']
})
export class DocentesComponent implements OnInit {

  profesores:any[]=[];

  constructor(private http: HttpClient) { }
  
  ngOnInit() {
    this.cargarDatos();
  }

  cargarDatos() {
  this.http.get('http://localhost:9000/docentes').subscribe(
    (resultados:any) => {
      this.profesores = resultados.data;
    },
    (error: any) => {
      console.error('Error al leer el archivo JSON:', error);
    }
  );
}
}
