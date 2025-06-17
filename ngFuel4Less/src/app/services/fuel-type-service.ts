import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, catchError, throwError } from 'rxjs';
import { environment } from '../../environments/environment';
import { Fueltype } from '../models/fueltype';
import { AuthService } from './auth-service';

@Injectable({
  providedIn: 'root'
})
export class FuelTypeService {
  private url = environment.baseUrl + 'api/fuelTypes';

  constructor(
    private http: HttpClient,
    private auth: AuthService,
  ) { }

   getHttpOptions() {
    let options = {
      headers: {
        Authorization: 'Basic ' + this.auth.getCredentials(),
        'X-Requested-With': 'XMLHttpRequest',
      },
    };
    return options;
  }

  index(): Observable<Fueltype[]> {
      return this.http.get<Fueltype[]>(this.url, this.getHttpOptions()).pipe(
        catchError((err: any) => {
          console.log(err);
          return throwError(
            () =>
              new Error(
                'FuelTypeService.index(): error retrieving Fuel Types: ' + err
              )
          );
        })
      );
    }
}
