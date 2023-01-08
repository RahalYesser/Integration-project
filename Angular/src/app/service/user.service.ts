import { Injectable } from '@angular/core';
import { User } from './user';
import { catchError, map } from 'rxjs/operators';
import { Observable, throwError } from 'rxjs';
import {
  HttpClient,
  HttpHeaders,
  HttpErrorResponse,
} from '@angular/common/http';

@Injectable({
  providedIn: 'root',
})

export class UserService {

  // Node/Express API
  REST_API: string = 'http://localhost:8080/admin/realms/My-realm/users';

  // Http Header
  httpHeaders = new HttpHeaders().set('Content-Type', 'application/json');
  constructor(private httpClient: HttpClient) {}

  // Get all objects
  GetUsers() {
    return this.httpClient.get(`${this.REST_API}`);
  }

  // Get single object
  GetUser(id: any): Observable<any> {
    let API_URL = `${this.REST_API}/${id}`;
    return this.httpClient.get(API_URL, { headers: this.httpHeaders }).pipe(
      map((res: any) => {
        return res || {};
      })
    );
  }

}
