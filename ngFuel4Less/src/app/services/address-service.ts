import { Injectable } from '@angular/core';
import { Observable, catchError, throwError } from 'rxjs';
import { Address } from '../models/address';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../environments/environment';
import { AuthService } from './auth-service';

@Injectable({
  providedIn: 'root'
})
export class AddressService {
private url = environment.baseUrl + 'api/addresses';

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

    create(address: Address): Observable<Address> {
      return this.http.post<Address>(this.url, address).pipe(
        catchError((err: any) => {
          console.log(err);
          return throwError(
            () => new Error('AddressService.index(): error creating address: ' + err)
          );
        })
      );
    }
}
