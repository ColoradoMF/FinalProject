import { AuthService } from './../../services/auth-service';
import { User } from './../../models/user';
import { Component } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { Router } from '@angular/router';

@Component({
  selector: 'app-register',
  imports: [FormsModule],
  templateUrl: './register.html',
  styleUrl: './register.css'
})
export class Register {
  newUser: User = new User;

  constructor(
    private auth: AuthService,
    private router: Router
  ){

  }

  register(user: User): void{
    console.log('Registering user:');
    console.log(user);
    this.auth.register(user).subscribe({
      next: (registeredInUser) => {
        this.auth.login(user.username, user.password).subscribe({
          next: (loggedInUser) => {
            this.router.navigateByUrl('/home');
          },
          error: (problem) => {
            console.error('RegisterComponent.register(): Error logging in');
            console.error(problem);
          }
        });
      },
      error: (fail) => {
        console.error("RegisterCompnent.register(): Error registering account");
        console.error(fail);
      }
    });
  }
}
