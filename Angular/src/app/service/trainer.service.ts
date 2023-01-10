import { Injectable } from '@angular/core';
import { Trainer } from './trainer';
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

export class TrainerService {

  // Node/Express API
  REST_API: string = 'http://localhost:8050';

  // Http Header
  httpHeaders = new HttpHeaders({'Content-Type':'application/json'});
  constructor(private httpClient: HttpClient) {}

  // Add
  AddTrainer(data: Trainer): Observable<any> {
    let API_URL = `${this.REST_API}/create`;
    return this.httpClient
      .post(API_URL, data,{ headers: this.httpHeaders })
      .pipe(catchError(this.handleError));
  }

  // Get all objects
  GetTrainers() {
    return this.httpClient.get(`${this.REST_API}/all`);
  }

  // Get single object
  GetTrainer(id: number): Observable<any> {
    let API_URL = `${this.REST_API}/read/${id}`;
    return this.httpClient.get(API_URL, { headers: this.httpHeaders }).pipe(
      map((res: any) => {
        return res || {};
      }),
      catchError(this.handleError)
    );
  }

  // Update
  updateTrainer(data: any,id:any): Observable<any> {
    let API_URL = `${this.REST_API}/update/${id}`;
    return this.httpClient
      .put(API_URL, data, { headers: this.httpHeaders })
      .pipe(catchError(this.handleError));
  }

  // Delete
  deleteTrainer(id: any): Observable<any> {
    let API_URL = `${this.REST_API}/delete/${id}`;
    return this.httpClient
      .delete(API_URL, { headers: this.httpHeaders })
      .pipe(catchError(this.handleError));
  }

  // Error
  handleError(error: HttpErrorResponse) {
    let errorMessage = '';
    if (error.error instanceof ErrorEvent) {
      // Handle client error
      errorMessage = error.error.message;
    } else {
      // Handle server error
      errorMessage = `Error Code: ${error.status}\nMessage: ${error.message}`;
    }
    console.log(errorMessage);
    return throwError(() => {
      errorMessage;
    });
  }
}
