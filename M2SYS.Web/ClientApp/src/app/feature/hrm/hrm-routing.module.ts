import { NgModule } from '@angular/core';
import { RouterModule, Route } from '@angular/router';

import { EmployeeComponent } from "./components/employee/employee.component";

const routes: Route[] = [
  {
    path:'manage-employee',
    component: EmployeeComponent
  }
];

@NgModule({
  imports: [
    RouterModule.forChild(routes)
  ],
  exports: [RouterModule]
})
export class RoutingModule { }

