import { Component } from '@angular/core';
import { AuthService } from '../../services/auth-service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-logout',
  imports: [],
  templateUrl: './logout.html',
  styleUrl: './logout.css'
})
export class Logout {

constructor(
  private auth: AuthService,
  private router: Router,
){}

logout() {
  this.auth.logout();
  this.router.navigateByUrl('/home');
}

}
