import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { CalendarioUsuarioComponent } from './ventanas/calendario-usuario/calendario-usuario.component';
import { DocentesComponent } from './ventanas/docentes/docentes.component';
import { HorarioUsuarioComponent } from './ventanas/horario-usuario/horario-usuario.component';
import { IniciarSesionComponent } from './ventanas/iniciar-sesion/iniciar-sesion.component';
import { InicioNoRegistradoComponent } from './ventanas/inicio-no-registrado/inicio-no-registrado.component';
import { InicioRegistradoComponent } from './ventanas/inicio-registrado/inicio-registrado.component';
import { NotasUsuarioComponent } from './ventanas/notas-usuario/notas-usuario.component';
import { OlvidasteContrasenaComponent } from './ventanas/olvidaste-contrasena/olvidaste-contrasena.component';
import { ParticipantesCursoComponent } from './ventanas/participantes-curso/participantes-curso.component';
import { PerfilUsuarioComponent } from './ventanas/perfil-usuario/perfil-usuario.component';
import { RegistrateComponent } from './ventanas/registrate/registrate.component';
import { FooterComponent } from './componentes/footer/footer.component';
import { HeaderComponent } from './componentes/header/header.component';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { HttpClientModule,HttpClient } from '@angular/common/http';
import { ReactiveFormsModule } from '@angular/forms';

@NgModule({
  declarations: [
    AppComponent,
    CalendarioUsuarioComponent,
    DocentesComponent,
    HorarioUsuarioComponent,
    IniciarSesionComponent,
    InicioNoRegistradoComponent,
    InicioRegistradoComponent,
    NotasUsuarioComponent,
    OlvidasteContrasenaComponent,
    ParticipantesCursoComponent,
    PerfilUsuarioComponent,
    RegistrateComponent,
    FooterComponent,
    HeaderComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    NgbModule,
    ReactiveFormsModule,
    HttpClientModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
