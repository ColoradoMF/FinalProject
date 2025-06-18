import { Component } from '@angular/core';
import { GasStation } from '../../models/gas-station';
import { GasStationService } from '../../services/gas-station-service';
import { ActivatedRoute, Router, RouterLink } from '@angular/router';
import { PriceReport } from '../../models/price-report';
import { PriceReportService } from '../../services/price-report-service';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-search-results',
  imports: [RouterLink, CommonModule],
  templateUrl: './search-results.html',
  styleUrl: './search-results.css'
})

export class SearchResults {
  gasStations: GasStation[] = [];
  gasStation: GasStation = new GasStation();
  recentPriceReportsMap: Map<number, PriceReport[]> = new Map();

constructor(
  private gasStationService: GasStationService,
  private activatedRoute: ActivatedRoute,
  private router: Router,
   private priceReportService: PriceReportService,
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

      // Fetch recent prices for each gas station
      gasStations.forEach(gs => {
        this.priceReportService.getRecentPriceReports(gs.id).subscribe({
          next: (reports) => {
            this.recentPriceReportsMap.set(gs.id, reports);
          },
          error: (err) => {
            console.error(`Error loading price reports for GasStation ID ${gs.id}`, err);
          }
        });
      });
    },
    error: (err) => {
      console.error(err);
      this.router.navigateByUrl("ZipNotFound");
    }
  });
}

loadRecentPrices(gasStationId: number): void {
  this.priceReportService.getRecentPriceReports(gasStationId).subscribe({
    next: (reports) => {
      this.recentPriceReportsMap.set(gasStationId, reports);
    },
    error: (err) => {
      console.error(err);
      console.error("GasStation.ts Component: Error loading Gas Station");
      this.router.navigateByUrl("GasStationNotFound");
    }
  });
}

}
