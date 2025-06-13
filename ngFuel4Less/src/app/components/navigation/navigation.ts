import { Component } from '@angular/core';
import { RouterLink } from '@angular/router';
import { Logout } from "../logout/logout";
import { AuthService } from '../../services/auth-service';
import { FormsModule } from '@angular/forms';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { Login } from "../login/login";

@Component({
  selector: 'app-navigation',
  imports: [RouterLink, Logout, FormsModule, NgbModule, Login],
  templateUrl: './navigation.html',
  styleUrl: './navigation.css'
})
export class Navigation {

  isCollapsed: boolean = false;

  constructor(
   private auth: AuthService,
){}

  loggedIn(): boolean{
    return this.auth.checkLogin();
}

}
