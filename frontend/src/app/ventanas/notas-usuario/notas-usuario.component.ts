import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';

interface Nota {
  asignatura: string;
  notas: number[]; // Cambiamos el tipo de datos a number[]
  promedio: number; // Agregamos la propiedad promedio
}

@Component({
  selector: 'app-notas-usuario',
  templateUrl: './notas-usuario.component.html',
  styleUrls: ['./notas-usuario.component.scss']
})
export class NotasUsuarioComponent implements OnInit {
  notas: Nota[] = [];

  constructor(private http: HttpClient) { }

  ngOnInit() {
    this.http.get<any>('http://localhost:9000/notas').subscribe(
      (response: any) => {
        const notasByAsignatura = response.data.reduce((acc: { [asignatura: string]: number[] }, item: any) => {
          if (acc[item.asignatura]) {
            acc[item.asignatura].push(item.nota);
          } else {
            acc[item.asignatura] = [item.nota];
          }
          return acc;
        }, {});

        //Devuelve el promedio de notas 
        this.notas = Object.keys(notasByAsignatura).map(asignatura => {
          const notas = notasByAsignatura[asignatura];
          const promedio = notas.reduce((total:any, nota:any) => total + nota, 0) / notas.length;
          return {
            asignatura,
            notas,
            promedio
          };
        });
      },
      (error: any) => {
        console.error(error);
      }
    );
  }
}
