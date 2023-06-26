import { Component } from '@angular/core';
import { AuthService } from 'src/app/services/authorization/auth.service';
import { Route } from '@angular/router';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css']
})

export class HeaderComponent {
  constructor(private authService: AuthService) {}

  sesionIniciada(): boolean {
    return this.authService.isAuthenticated();
  }

  cerrarSesion(): void {
    this.authService.logout();
  }
}
