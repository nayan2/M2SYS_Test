import {Injectable} from '@angular/core';
import {HttpClient} from "@angular/common/http";
import {Observable} from "rxjs";
import {buildPaginationUrl, Pagination} from "../../../../core/services/paging/paging";

@Injectable({
  providedIn: 'root'
})
export class EmployeeService {

  routePrefix = 'api/employee';
  constructor(private http: HttpClient) { }

  getById = (id: number): Observable<any> => {
    return this.http.get(this.routePrefix + '/get/'+ id);
  }

  gets = (pagination: Pagination): Observable<any> => {
    return this.http.get(buildPaginationUrl(this.routePrefix,'/gets', pagination));
  }

  add = (data): Observable<any> => {
    return this.http.post(this.routePrefix + '/add', data);
  }

  edit = (id: number, data): Observable<any> => {
    return this.http.put(this.routePrefix + '/edit/'+ id, data);
  }

  delete = (id: number): Observable<any> => {
    return this.http.delete(this.routePrefix + '/delete/' + id);
  }
}
