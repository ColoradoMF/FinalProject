import { Component } from '@angular/core';
import { AuthService } from '../../services/auth-service';
import { Router } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { GasStation } from '../../models/gas-station';
import { HttpClient } from '@angular/common/http';
import { GasStationService } from '../../services/gas-station-service';

@Component({
  selector: 'app-new-gas-station',
  imports: [FormsModule],
  templateUrl: './new-gas-station.html',
  styleUrl: './new-gas-station.css'
})
export class NewGasStation {
  gasStation: GasStation = new GasStation();



  constructor(
    private auth: AuthService,
    private router: Router,
    private gasStationService: GasStationService,
  ){

  }


  submitForm(gasStation: GasStation) {
    console.log('Submitting:', this.gasStation);
    this.gasStationService.create(gasStation).subscribe({
      next: (response) => {
        console.log('Success:', response);
        this.gasStation = new GasStation();
      },
      error: (err) => {
        console.error('Error submitting:', err);
      }
    });
  }
}
