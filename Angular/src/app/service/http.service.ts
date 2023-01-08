import { Injectable } from "@angular/core";
import { HttpClient } from "@angular/common/http";

@Injectable({
  providedIn: "root"
})
export class HttpService {

    // Node/Express API
    REST_API: string = 'http://localhost:3000';

  test = "How r u?";
  constructor(private http: HttpClient) {}

  httpGet(url: string) {
    return this.http.get(url);
  }

  httpPost(url: string, {}: any) {
    return this.http.post(url, { name: "Subrat" });
  }

  sendEmail(data: any) {
    return this.http.post(`${this.REST_API}/sendmail`, data);
  }
}
