import { Injectable } from '@angular/core';
import { User } from '../models/user';
import { Observable, catchError, throwError } from 'rxjs';
import { environment } from '../../environments/environment';
import { AuthService } from './auth-service';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class UserService {
  private url = environment.baseUrl + 'api/users';
  private profileUrl = environment.baseUrl + 'api/profile';

  constructor(
    private auth: AuthService,
    private http: HttpClient,
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
  updateUser(user: User): Observable<User> {
    return this.http.put<User>(this.profileUrl, user, this.getHttpOptions()).pipe(
      catchError((err: any) => {
        console.log(err);
        return throwError(
          () => new Error(
              'UserService.updateUser(): error updating User: ' + err
            )
          )
      })
    )
  }

index(): Observable<User[]> {
    return this.http.get<User[]>(this.url, this.getHttpOptions()).pipe(
      catchError((err: any) => {
        console.log(err);
        return throwError(
          () =>
            new Error(
              'UserService.index(): error retrieving User: ' + err
            )
        );
      })
    );
  }

  show(userId: number): Observable<User> {
    return this.http
      .get<User>(this.url + "/" + userId, this.getHttpOptions()).pipe(
        catchError((err: any) => {
          console.log(err);
          return throwError(
            () =>
              new Error(
                'UserService.index(): error retrieving User Profile: ' +
                  err
              )
          );
        })
      );
   }
}
