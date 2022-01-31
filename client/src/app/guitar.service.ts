import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Guitar } from './resources/guitar';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';

const httpOptions = {
  headers: new HttpHeaders({ 'Content-Type': 'application/json' }),
};

interface ResponseArray {
  data: Guitar[];
}
interface ResponseEntity {
  data: Guitar;
}

@Injectable({
  providedIn: 'root',
})
export class GuitarService {
  private guitarsApiUrl: string = 'http://localhost:4000/api/guitars';

  constructor(private http: HttpClient) {}

  getGuitars(): Observable<Guitar[]> {
    return this.http
      .get<ResponseArray>(this.guitarsApiUrl)
      .pipe(map(({ data }: ResponseArray) => data));
  }

  getGuitar(id: number): Observable<Guitar> {
    const url = `${this.guitarsApiUrl}/${id}`;
    return this.http
      .get<ResponseEntity>(url)
      .pipe(map(({ data }: ResponseEntity) => data));
  }

  updateGuitar(guitar: Guitar): Observable<any> {
    const url = `${this.guitarsApiUrl}/${guitar.id}`;
    return this.http
      .put(url, guitar, httpOptions)
      .pipe(map(({ data }: any) => data));
  }

  createGuitar(guitar: Guitar): Observable<Guitar> {
    return this.http
      .post<ResponseEntity>(this.guitarsApiUrl, guitar, httpOptions)
      .pipe(map(({ data }: ResponseEntity) => data));
  }

  deleteGuitar(guitar: Guitar | number): Observable<Guitar> {
    const id = typeof guitar === 'number' ? guitar : guitar.id;
    const url = `${this.guitarsApiUrl}/${id}`;
    return this.http
      .delete<ResponseEntity>(url, httpOptions)
      .pipe(map(({ data }: ResponseEntity) => data));
  }
}
