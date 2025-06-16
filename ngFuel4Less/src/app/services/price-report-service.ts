import { ReportVote } from './../models/report-vote';
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
  private url2 = environment.baseUrl + 'api/gasStations';

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

  getRecentPriceReports(gasStationId: number): Observable<PriceReport[]>{
    return this.http.get<PriceReport[]>(this.url2 + "/" + gasStationId + "/mostRecentReports", this.getHttpOptions()).pipe(
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
    delete priceReport.createDate;
    delete priceReport.lastUpdate;
    delete priceReport.reportVotes;
    console.log(priceReport);
    return this.http.post<PriceReport>(this.url2 + "/" + priceReport.gasStation.id + "/priceReports", priceReport, this.getHttpOptions()).pipe(
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
