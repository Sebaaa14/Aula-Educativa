import { Injectable } from '@angular/core';
import { CookieService } from 'ngx-cookie-service';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private authTokenKey = 'authToken';

  constructor(private cookieService: CookieService) {}

  setToken(token: string): void {
    this.cookieService.set(this.authTokenKey, token);
  }

  getToken(): string | undefined {
    return this.cookieService.get(this.authTokenKey);
  }

  removeToken(): void {
    this.cookieService.delete(this.authTokenKey);
  }
  
  isAuthenticated(): boolean {
    return !!this.getToken();
  }

  logout(): void {
    this.removeToken();
  }
}
