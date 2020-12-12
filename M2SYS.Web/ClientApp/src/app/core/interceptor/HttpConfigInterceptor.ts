import {
  HttpInterceptor,
  HttpRequest,
  HttpResponse,
  HttpHandler,
  HttpEvent,
  HttpErrorResponse
} from '@angular/common/http';

import { Observable, throwError } from 'rxjs';
import { map, catchError, finalize } from 'rxjs/operators';
import {Inject, Injectable} from '@angular/core';
import { NgxSpinnerService } from 'ngx-spinner';

@Injectable()
export class HttpConfigInterceptor implements HttpInterceptor {

  loaderActive = false;
  endPointUrl: string;

  constructor(private spinner: NgxSpinnerService, @Inject('BASE_URL') baseUrl: string) {
    this.endPointUrl = baseUrl;
  }

  intercept(request: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {
    if (!this.loaderActive) {
      this.spinner.show();
      this.loaderActive = true;
    }

    return next.handle(request).pipe(
      map((event: HttpEvent<any>) => {
        if (event instanceof HttpResponse) {
          this.loaderActive = true;
        }
        return event;
      }),
      catchError((error: HttpErrorResponse) => {
        return throwError(error);
      }),
      finalize(() => {
        setTimeout(() => {
          this.spinner.hide();
        });
        this.loaderActive = false;
      })
    );
  }
}
