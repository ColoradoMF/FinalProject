import { Injectable } from '@angular/core';
import { environment } from '../../environments/environment';
import { HttpClient } from '@angular/common/http';
import { AuthService } from './auth-service';
import { catchError, Observable, throwError } from 'rxjs';
import { GasStation } from '../models/gas-station';
import { PriceReport } from '../models/price-report';

@Injectable({
  providedIn: 'root'
})
export class PriceReportService {
  private url = environment.baseUrl + 'api/priceReports';

  constructor(private http: HttpClient, private auth: AuthService) { }

  getHttpOptions() {
    let options = {
      headers: {
        Authorization: 'Basic ' + this.auth.getCredentials(),
        'X-Requested-With': 'XMLHttpRequest',
      },
    };
    return options;
  }

  getRecentPriceReports(gasStationId: number): Observable<PriceReport>{
    return this.http.get<PriceReport>(this.url + "/" + gasStationId, this.getHttpOptions()).pipe(
      catchError((nobueno: any) => {
        console.error(nobueno);
        return throwError(
          () => new Error('PriceReportService.index(): error loading Price Reports: ' +
            nobueno
          )
        );
      })
    );
  }

  createPriceReport(priceReport: PriceReport): Observable<PriceReport>{
    return this.http.post<PriceReport>(this.url, priceReport).pipe(
      catchError((nobueno: any) => {
        console.error(nobueno);
        return throwError(
          () => new Error('PriceReportService.index(): error creating Price Report: ' +
            nobueno
          )
        );
      })
    );
  }
}
