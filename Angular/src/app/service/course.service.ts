import { Injectable } from '@angular/core';
import { Course } from './course';
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

export class CourseService {

  // Node/Express API
  REST_API: string = 'http://localhost:8000/api/course';

  // Http Header
  httpHeaders = new HttpHeaders().set('Content-Type', 'application/json');
  constructor(private httpClient: HttpClient) {}

  // Add
  AddCourse(data: Course): Observable<any> {
    let API_URL = `${this.REST_API}/add-course`;
    return this.httpClient
      .post(API_URL, data)
      .pipe(catchError(this.handleError));
  }

  // Get all objects
  GetCourses() {
    return this.httpClient.get(`${this.REST_API}`);
  }

  // Get single object
  GetCourse(id: any): Observable<any> {
    let API_URL = `${this.REST_API}/read-course/${id}`;
    return this.httpClient.get(API_URL, { headers: this.httpHeaders }).pipe(
      map((res: any) => {
        return res || {};
      }),
      catchError(this.handleError)
    );
  }

  // Update
  updateCourse(id: any, data: any): Observable<any> {
    let API_URL = `${this.REST_API}/update-course/${id}`;
    return this.httpClient
      .put(API_URL, data, { headers: this.httpHeaders })
      .pipe(catchError(this.handleError));
  }

  // Delete
  deleteCourse(id: any): Observable<any> {
    let API_URL = `${this.REST_API}/delete-course/${id}`;
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
