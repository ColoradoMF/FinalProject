import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { AuthService } from './services/auth-service';
import { Home } from "./components/home/home";
import { Navigation } from "./components/navigation/navigation";

@Component({
  selector: 'app-root',
  imports: [RouterOutlet, Navigation],
  templateUrl: './app.html',
  styleUrl: './app.css'
})
export class App {
  protected title = 'ngFuel4Less';

  constructor(
  private auth: AuthService
) {}

ngOnInit() {

}

tempTestDeleteMeLater() {
  this.auth.login('test','test').subscribe({ // change username to match DB
    next: (data) => {
      console.log('Logged in:');
      console.log(data);
    },
    error: (fail) => {
      console.error('Error authenticating:')
      console.error(fail);
    }
  });
}







}
