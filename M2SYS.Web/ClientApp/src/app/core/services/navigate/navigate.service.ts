import { Injectable } from '@angular/core';
import { ActivatedRoute, Router } from "@angular/router";

@Injectable({
  providedIn: 'root'
})
export class NavigateService {

  constructor(private router: Router,
              private activatedRoute: ActivatedRoute
  ) { }

  toHome = (): void => {
    this.router.navigate(['/home']);
  }

  toHRMEmployee = (): void => {
    this.router.navigate(['/hrm/manage-employee']);
  }
}
