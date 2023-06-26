import { Injectable } from '@angular/core';
import { CanActivate, ActivatedRouteSnapshot, RouterStateSnapshot, Router } from '@angular/router';
import { AuthService } from '../authorization/auth.service';

@Injectable({
  providedIn: 'root'
})
export class AuthGuard implements CanActivate {
  constructor(private authService: AuthService, private router: Router) {}

  canActivate(next: ActivatedRouteSnapshot, state: RouterStateSnapshot): boolean {
    if (this.authService.isAuthenticated()) {
      return true;
    } else {
      const token = this.authService.getToken();
      console.log(token);
      if (token) {
        return true;
      } else {
        this.router.navigate(['/iniciar-sesion']); // Redireccionar al usuario a la página de inicio de sesión
        return false;
      }
    }
  }
}
