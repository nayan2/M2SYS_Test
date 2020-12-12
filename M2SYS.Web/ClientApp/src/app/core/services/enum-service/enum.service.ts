import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class EnumService {

  routePrefix = '/api/enum';
  constructor(private http: HttpClient) { }

  getAllDepartmentTypes = (): Observable<any> => {
    return this.http.get(this.routePrefix + '/getAllDepartmentTypes');
  }

  getAllDesignationTypes = (): Observable<any> => {
    return this.http.get(this.routePrefix + '/getAllDesignationTypes');
  }

  getAllLeaveTypes = (): Observable<any> => {
    return this.http.get(this.routePrefix + '/getAllLeaveTypes');
  }
}
