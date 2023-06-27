import { Injectable } from '@angular/core';
import { CanActivateChild, ActivatedRouteSnapshot, RouterStateSnapshot, Router } from '@angular/router';
import { AuthService } from '../authorization/auth.service';


@Injectable({
  providedIn: 'root'
})
export class AdminGuard implements CanActivateChild {
  constructor(private authService: AuthService, private router: Router) {}
  

  canActivateChild(next: ActivatedRouteSnapshot, state: RouterStateSnapshot): boolean {
    console.log('Entering canActivateChild in AdminGuard');
    if (this.authService.isAuthenticated() && this.authService.isAdmin()) {
      console.log('Admin authentication and role check passed');
      return true;
    } else {
      console.log('Admin authentication and role check failed');
      this.router.navigate(['/home']);
      return false;
    }
  }
  
}
