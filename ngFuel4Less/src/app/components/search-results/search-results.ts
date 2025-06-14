import { Component } from '@angular/core';
import { GasStation } from '../../models/gas-station';
import { GasStationService } from '../../services/gas-station-service';
import { ActivatedRoute, Router, RouterLink } from '@angular/router';

@Component({
  selector: 'app-search-results',
  imports: [RouterLink],
  templateUrl: './search-results.html',
  styleUrl: './search-results.css'
})

export class SearchResults {
  gasStations: GasStation[] = [];
  gasStation: GasStation = new GasStation();

constructor(
  private gasStationService: GasStationService,
  private activatedRoute: ActivatedRoute,
  private router: Router,
){}

ngOnInit(): void {
    this.activatedRoute.paramMap.subscribe(
      {
        next: (params) => {
          let zipCodeStr = params.get("zipCode");
          if(zipCodeStr) {
            let zipCode = parseInt(zipCodeStr);
            if(isNaN(zipCode)){
              this.router.navigateByUrl('invalidZipCode');
            } else {
                console.log("Navigate With Id: " + zipCode);
                this.searchGasStationsByZipCode(zipCodeStr);
            }
          }
        }
    });
  }

    searchGasStationsByZipCode(zipCode: string): void {
    this.gasStationService.searchByZip(zipCode).subscribe({
      next: (gasStations) => {
        this.gasStations = gasStations;
      },
      error: (err) => {
          console.error(err);
          console.error("GasStation.ts Component: Error loading Gas Stations");
          this.router.navigateByUrl("ZipNotFound")
      }
    });
  }



}
