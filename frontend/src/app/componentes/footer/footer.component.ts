import { Component } from '@angular/core';
import { AuthService } from 'src/app/services/authorization/auth.service';
import { Router } from '@angular/router';
@Component({
  selector: 'app-footer',
  templateUrl: './footer.component.html',
  styleUrls: ['./footer.component.scss']
})
export class FooterComponent {
  constructor(private authService: AuthService, private router: Router) {}
  sesionIniciada(): boolean {
    return this.authService.isAuthenticated();
  }
}
