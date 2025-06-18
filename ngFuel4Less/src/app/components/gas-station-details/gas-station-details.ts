import { PriceReportService } from './../../services/price-report-service';
import { GasStationService } from './../../services/gas-station-service';
import { GasStation } from './../../models/gas-station';
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { PriceReport } from '../../models/price-report';
import { Fueltype } from '../../models/fueltype';
import { FormsModule, NgForm } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { FuelTypeService } from '../../services/fuel-type-service';
import { DomSanitizer, SafeResourceUrl } from '@angular/platform-browser';
import { UserService } from '../../services/user-service';
import { User } from '../../models/user';
import { AuthService } from '../../services/auth-service';

@Component({
  selector: 'app-gas-station-details',
  imports: [FormsModule, CommonModule],
  templateUrl: './gas-station-details.html',
  styleUrl: './gas-station-details.css'
})
export class GasStationDetails implements OnInit{
  gasStation: GasStation = new GasStation();
  recentPriceReports: PriceReport[] = [];
  fuelTypes: Fueltype[] = [];
  newPriceReport: PriceReport = new PriceReport();
  user: User = new User();
  hoveringFavorite: boolean = false;

  constructor(
    private gasStationService: GasStationService,
    private userService: UserService,
    private router: Router,
    private activatedRoute: ActivatedRoute,
    private priceReportService: PriceReportService,
    private fuelTypeService: FuelTypeService,
    private sanitizer: DomSanitizer,
    private auth: AuthService,
  ){

  }
  ngOnInit(): void {
    this.activatedRoute.paramMap.subscribe({
      next: (params) => {
        let gasStationIdStr = params.get("gasStationId");
        if(gasStationIdStr){
          let gasStationId = parseInt(gasStationIdStr);
          if(isNaN(gasStationId)){
            this.router.navigateByUrl("notFound");
          }else {
            this.getLoggedInUser();
            this.displayDetails(gasStationId);
          }
        }
      }
    })
  }


  displayDetails(gasStationId: number): void{
    this.gasStationService.show(gasStationId).subscribe({
      next: (gasStation) => {
        this.gasStation = gasStation;
        this.loadRecentPrices();
        this.loadFuelTypes();
        },
        error: (err) => {
          console.error(err);
          console.error("GasStation.ts Component: Error loading Gas Station")
          this.router.navigateByUrl("GasStationNotFound")
        }
      })
    }

    loadRecentPrices() {
      this.priceReportService.getRecentPriceReports(this.gasStation.id).subscribe({
        next: (reports) => {
         this.recentPriceReports = reports;
        },
        error: (err) => {
          console.error(err);
          console.error("GasStation.ts Component: Error loading Gas Station")
          this.router.navigateByUrl("GasStationNotFound")
        }
      });
  }

    loadFuelTypes() {
      this.fuelTypeService.index().subscribe({
        next: (fuelTypes) => {
          fuelTypes.unshift(new Fueltype(0, "-- Choose Fuel Type --"))
         this.fuelTypes = fuelTypes;
        },
        error: (err) => {
          console.error(err);
          console.error("GasStation.ts Component: Error loading Fuel Types")
        }
      });
  }

  createPriceReport(formData: any): void{
    let priceReport: PriceReport = new PriceReport(formData.id);
    priceReport.fuelType = new Fueltype(formData.fuelTypeId);
    priceReport.gasStation = new GasStation(formData.gasStationId);
    priceReport.pricePerGallon = formData.pricePerGallon;
    console.log(priceReport);
    this.submitPriceReport(priceReport);
  }

  submitPriceReport(priceReport: PriceReport) {
      priceReport.gasStation = this.gasStation;

    this.priceReportService.createPriceReport(priceReport).subscribe({
      next: (createdReport) => {
        console.log(createdReport);
        this.loadRecentPrices();
      }
    })
  }

  addToFavorites(gasStationId: number) {
      this.userService.addFavoriteGasStation(gasStationId).subscribe({
      next: () => {
        this.displayDetails(gasStationId);
        this.getLoggedInUser();
      }
    })
  }

  removeFromFavorites(gasStationId: number) {
    this.userService.removeFavoriteGasStation(gasStationId).subscribe({
      next: () => {
        this.displayDetails(gasStationId);
        this.getLoggedInUser();
      }
    })
  }

  get mapUrl(): SafeResourceUrl {
  const address = `${this.gasStation.address.street}, ${this.gasStation.address.city}, ${this.gasStation.address.state} ${this.gasStation.address.zipCode}`;
  const url = `https://www.google.com/maps?q=${encodeURIComponent(address)}&output=embed`;
  return this.sanitizer.bypassSecurityTrustResourceUrl(url);
}

isUserFavorite(): boolean {

  return this.user.favoriteGasStations.some(
     (station) => {return station.id === this.gasStation.id}
  );
}

getLoggedInUser() {
   this.auth.getLoggedInUser().subscribe({
      next: (user) => {
       this.user = user;

      }
    });

  }

}
