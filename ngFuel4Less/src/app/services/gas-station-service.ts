import { Injectable } from '@angular/core';
import { environment } from '../../environments/environment';
import { HttpClient } from '@angular/common/http';
import { AuthService } from './auth-service';
import { GasStation } from '../models/gas-station';
import { Observable, catchError, throwError } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class GasStationService {
  private url = environment.baseUrl + 'api/gasStations';

  constructor(private http: HttpClient, private auth: AuthService) {}

  getHttpOptions() {
    let options = {
      headers: {
        Authorization: 'Basic ' + this.auth.getCredentials(),
        'X-Requested-With': 'XMLHttpRequest',
      },
    };
    return options;
  }

  index(): Observable<GasStation[]> {
    return this.http.get<GasStation[]>(this.url, this.getHttpOptions()).pipe(
      catchError((err: any) => {
        console.log(err);
        return throwError(
          () =>
            new Error(
              'GasStationService.index(): error retrieving Gas Stations: ' + err
            )
        );
      })
    );
  }

  show(gasStationId: number): Observable<GasStation> {
    return this.http
      .get<GasStation>(this.url + "/" + gasStationId, this.getHttpOptions()).pipe(
        catchError((err: any) => {
          console.log(err);
          return throwError(
            () =>
              new Error(
                'GasStationService.index(): error retrieving Gas Stations: ' +
                  err
              )
          );
        })
      );
   }

  searchByZip(zip: string): Observable<GasStation[]> {
    return this.http.get<GasStation[]>(this.url + "/search/" + zip).pipe(
      catchError((err: any) => {
        console.log(err);
        return throwError(
          () =>
            new Error(
              'GasStationService.index(): error retrieving Gas Stations: ' + err
            )
        );
      })
    );
  }

  create(gasStation: GasStation): Observable<GasStation> {
    return this.http.post<GasStation>(this.url, gasStation).pipe(
      catchError((err: any) => {
        console.log(err);
        return throwError(
          () => new Error('GasStationService.index(): error creating gasStation: ' + err)
        );
      })
    );
  }


}
