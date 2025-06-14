import { GasStationService } from './../../services/gas-station-service';
import { GasStation } from './../../models/gas-station';
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-gas-station-details',
  imports: [],
  templateUrl: './gas-station-details.html',
  styleUrl: './gas-station-details.css'
})
export class GasStationDetails implements OnInit{
  gasStation: GasStation = new GasStation();

  constructor(
    private gasStationService: GasStationService,
    private router: Router,
    private activatedRoute: ActivatedRoute,
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
         //TODO call priceReportService to get recentPriceReports
      },
      error: (err) => {
        console.error(err);
        console.error("GasStation.ts Component: Error loading Gas Station")
        this.router.navigateByUrl("GasStationNotFound")
      }
    })
  }



}
