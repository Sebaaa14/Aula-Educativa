import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-horario-usuario',
  templateUrl: './horario-usuario.component.html',
  styleUrls: ['./horario-usuario.component.scss']
})
export class HorarioUsuarioComponent implements OnInit {
  horarioData: any[] = [];
  bloqueHorario: any[] = [];
  constructor(private http: HttpClient) { }

  ngOnInit(): void {
    this.getHorario();
    this.getBloqueHorario();
  }

  getHorario() {
    this.http.get('http://localhost:9000/horario').subscribe(
      (response: any) => {
        this.horarioData = response.data;
      },
      (error: any) => {
        console.error(error);
      }
    );
  }

  getBloqueHorario() {
    this.http.get('http://localhost:9000/bloqueHorario').subscribe(
      (response: any) => {
        this.bloqueHorario = response.data;
      },
      (error: any) => {
        console.error(error);
      }
    );
  }
  
  obtenerHoraPorBloque(bloque: number): string {
    if (this.bloqueHorario && this.bloqueHorario[bloque - 1]) {
      const bloqueHorario = this.bloqueHorario[bloque - 1];
      return `${bloqueHorario.hora_inicio} - ${bloqueHorario.hora_fin}`;
    } else {
      return "";
    }
  }

  getClasePorDia(bloque: number, dia: string): any {
    return this.horarioData.find(item => item.id_bloque === bloque && item.dia === dia);
  }
}

