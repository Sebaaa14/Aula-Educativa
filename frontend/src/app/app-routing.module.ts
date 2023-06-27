import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
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
import { AdminComponent } from './ventanas/admin/admin.component';
import { AdminGuard } from './services/adminguard/admin.guard';
import { AuthGuard } from './services/authorizationGuard/auth.guard';

import { AnadirAlumnoComponent } from './ventanas/admin/anadir-alumno/anadir-alumno.component';
import { EliminarAlumnoComponent } from './ventanas/admin/eliminar-alumno/eliminar-alumno.component';
import { AnadirDocenteComponent } from './ventanas/admin/anadir-docente/anadir-docente.component';
import { EliminarDocenteComponent } from './ventanas/admin/eliminar-docente/eliminar-docente.component';

const routes: Routes = [
  //{path:'',component:},
  { path: '', component: InicioNoRegistradoComponent },
  { path: 'registrate', component: RegistrateComponent },
  { path: 'calendario', component: CalendarioUsuarioComponent, canActivate: [AuthGuard] },
  { path: 'docentes', component: DocentesComponent, canActivate: [AuthGuard] },
  { path: 'horario', component: HorarioUsuarioComponent, canActivate: [AuthGuard] },
  { path: 'home', component: InicioRegistradoComponent, canActivate: [AuthGuard] },
  { path: 'notas', component: NotasUsuarioComponent, canActivate: [AuthGuard] },
  { path: 'olvidaste-contrasena', component: OlvidasteContrasenaComponent },
  { path: 'participantes', component: ParticipantesCursoComponent, canActivate: [AuthGuard] },
  { path: 'perfil', component: PerfilUsuarioComponent, canActivate: [AuthGuard] },
  { path: 'iniciar-sesion', component: IniciarSesionComponent },
  { path: 'admin', component: AdminComponent, canActivate: [AuthGuard], data: { roles: ['admin'] } },
  { path: 'anadir-alumno', component: AnadirAlumnoComponent, canActivate: [AuthGuard], data: { roles: ['admin'] } },
  { path: 'eliminar-alumno', component: EliminarAlumnoComponent, canActivate: [AuthGuard], data: { roles: ['admin'] } },
  { path: 'anadir-docente', component: AnadirDocenteComponent, canActivate: [AuthGuard], data: { roles: ['admin'] } },
  { path: 'eliminar-docente', component: EliminarDocenteComponent, canActivate: [AuthGuard], data: { roles: ['admin'] } }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
