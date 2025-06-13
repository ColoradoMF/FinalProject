import { Component } from '@angular/core';
import { User } from '../../models/user';
import { FormsModule } from '@angular/forms';
import { AuthService } from '../../services/auth-service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-login',
  imports: [FormsModule],
  templateUrl: './login.html',
  styleUrl: './login.css'
})
export class Login {

  loginUser: User = new User();

  constructor(
    private auth: AuthService,
    private router: Router,
  ){}

  login(user: User) {
    this.auth.login(user.username, user.password).subscribe({
      next: (loggedInUser) => {
        this.router.navigateByUrl('/profile');
      },
      error: (error) => {
        console.error('Error logging in');
        console.error(error);
      }
    });
    console.log(user);
  }

}
