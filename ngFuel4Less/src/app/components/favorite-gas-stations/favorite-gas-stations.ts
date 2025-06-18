import { ActivatedRoute, Router } from '@angular/router';
import { GasStationService } from './../../services/gas-station-service';
import { Component, EventEmitter, Input, input, Output } from '@angular/core';
import { GasStation } from '../../models/gas-station';
import { User } from '../../models/user';
import { UserService } from '../../services/user-service';
import { AuthService } from '../../services/auth-service';
import { HttpClient } from '@angular/common/http';
import { PriceReport } from '../../models/price-report';
import { PriceReportService } from '../../services/price-report-service';

@Component({
  selector: 'app-favorite-gas-stations',
  imports: [],
  templateUrl: './favorite-gas-stations.html',
  styleUrl: './favorite-gas-stations.css',
})
export class FavoriteGasStations {
  favoriteGasStations: GasStation[] = [];
  @Input() user: User | undefined;
  recentPriceReportsMap: Map<number, PriceReport[]> = new Map();
  @Output() favoriteRemoved = new EventEmitter<void>();

  constructor(
    private gasStationService: GasStationService,
    private userService: UserService,
    private priceReportService: PriceReportService,
    private auth: AuthService,
    private http: HttpClient,
    private router: Router,
    private activatedRoute: ActivatedRoute
  ) {}

  ngOnInit(): void {
    // this.activatedRoute.paramMap.subscribe({
    //   next: (params) => {
    //     let userIdStr = params.get('userId');
    //     if (userIdStr) {
    //       let userId = Number.parseInt(userIdStr);
    //       if (isNaN(userId)) {
    //         this.router.navigateByUrl('notFound');
    //       } else {
    //         // this.displayDetails(userId);
    //       }
    //     } else {
    //       this.getLoggedInUser();
    //     }
    //   },
    // });
  }

  loadRecentPrices(gasStationId: number): void {
    this.priceReportService.getRecentPriceReports(gasStationId).subscribe({
      next: (reports) => {
        this.recentPriceReportsMap.set(gasStationId, reports);
      },
      error: (err) => {
        console.error(err);
        console.error('GasStation.ts Component: Error loading Gas Station');
        this.router.navigateByUrl('GasStationNotFound');
      },
    });
  }

  getLoggedInUser() {
    this.auth.getLoggedInUser().subscribe({
      next: (user) => {
        this.user = user;
      },
    });
  }

  removeFromFavorites(gasStationId: number) {
      this.userService.removeFavoriteGasStation(gasStationId).subscribe({
      next: () => {
      this.favoriteRemoved.emit();
      this.getLoggedInUser();
      }
    })
  }

  goToGasStation(gasStationId: number) {
    this.router.navigateByUrl("gasStation/" + gasStationId);
  }
}
