import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, catchError, throwError } from 'rxjs';
import { SavedAddress } from '../models/saved-address';
import { AuthService } from './auth-service';
import { environment } from '../../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class SavedAddressService {

private url = environment.baseUrl + 'api/savedAddresses';


 constructor(
  private http: HttpClient,
  private auth: AuthService) {}

  getHttpOptions() {
    let options = {
      headers: {
        Authorization: 'Basic ' + this.auth.getCredentials(),
        'X-Requested-With': 'XMLHttpRequest',
      },
    };
    return options;
  }

    create(savedAddress: SavedAddress): Observable<SavedAddress> {
      return this.http.post<SavedAddress>(this.url, savedAddress, this.getHttpOptions()).pipe(
        catchError((err: any) => {
          console.log(err);
          return throwError(
            () => new Error('SavedAddressService.index(): error creating SavedAddress: ' + err)
          );
        })
      );
    }
}
