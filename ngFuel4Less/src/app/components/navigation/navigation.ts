import { Component } from '@angular/core';
import { Router, RouterLink } from '@angular/router';
import { Logout } from "../logout/logout";
import { AuthService } from '../../services/auth-service';
import { FormsModule } from '@angular/forms';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { Login } from "../login/login";
import { GasStationService } from '../../services/gas-station-service';
import { Observable } from 'rxjs';
import { GasStation } from '../../models/gas-station';

@Component({
  selector: 'app-navigation',
  imports: [RouterLink, Logout, FormsModule, NgbModule, Login],
  templateUrl: './navigation.html',
  styleUrl: './navigation.css'
})
export class Navigation {

  isCollapsed: boolean = false;
  searchTerm: string = "";
  searchResults: GasStation[] = [];

  constructor(
   private auth: AuthService,
   private gasStationService: GasStationService,
   private router: Router,
){}

  loadSearchResults(): Observable<GasStation[]> {
    return this.gasStationService.index();
  }

  loggedIn(): boolean{
    return this.auth.checkLogin();
}

navigateToSearch(): void {
  if (this.searchTerm?.trim()) {
    this.router.navigate(['/search', this.searchTerm.trim()]);
  }
}

}
