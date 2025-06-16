import { PriceReportService } from './../../services/price-report-service';
import { GasStationService } from './../../services/gas-station-service';
import { GasStation } from './../../models/gas-station';
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { PriceReport } from '../../models/price-report';
import { Fueltype } from '../../models/fueltype';
import { FormsModule, NgForm } from '@angular/forms';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-gas-station-details',
  imports: [FormsModule, CommonModule],
  templateUrl: './gas-station-details.html',
  styleUrl: './gas-station-details.css'
})
export class GasStationDetails implements OnInit{
  gasStation: GasStation = new GasStation();
  recentPriceReports: PriceReport[] = [];

  constructor(
    private gasStationService: GasStationService,
    private router: Router,
    private activatedRoute: ActivatedRoute,
    private priceReportService: PriceReportService,
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

  // createPriceReport(priceReport: PriceReport, fuelType: Fueltype): void{
  // createPriceReport(priceReport: PriceReport): void{
  createPriceReport(formData: any): void{
    let priceReport: PriceReport = new PriceReport(formData.id);
    priceReport.fuelType = new Fueltype(formData.fuelTypeId);
    priceReport.gasStation = new GasStation(formData.gasStationId);
    priceReport.pricePerGallon = formData.pricePerGallon;
    console.log(priceReport);
    this.priceReportService.createPriceReport(priceReport).subscribe({
      next: (createdReport) => {
        console.log(createdReport);
        this.loadRecentPrices();
      }
    })
  }


}
