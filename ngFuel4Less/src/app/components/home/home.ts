import { Component } from '@angular/core';
import { Register } from "../register/register";
import { AuthService } from '../../services/auth-service';
import { NewGasStation } from "../new-gas-station/new-gas-station";

@Component({
  selector: 'app-home',
  imports: [Register, NewGasStation],
  templateUrl: './home.html',
  styleUrl: './home.css'
})
export class Home {

constructor(
  private auth: AuthService,
){

}
loggedIn(): boolean{
    return this.auth.checkLogin();
}

}
