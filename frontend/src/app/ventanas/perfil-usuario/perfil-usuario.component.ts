import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-perfil-usuario',
  templateUrl: './perfil-usuario.component.html',
  styleUrls: ['./perfil-usuario.component.scss']
})

export class PerfilUsuarioComponent implements OnInit{

  perfiles: any[] = [];

  constructor(private http: HttpClient) { }

  ngOnInit(): void {
      this.miPerfil();
  }

  miPerfil(){
      this.http.get('http://localhost:9000/miPerfil').subscribe(
        (response: any) => {
          if (response.status === 'éxito') {
            this.perfiles = response.data;
          }
        },
        (error: any) => {
          console.error(error);
        }
      );
  }

}
