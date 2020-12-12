import { NgModule } from '@angular/core';

import { RoutingModule } from './hrm-routing.module';
import { SharedModule } from 'src/app/shared/shared.module';

import { LeaveComponent } from './components/leave/leave.component';
import { EmployeeComponent } from './components/employee/employee.component'

@NgModule({
  declarations: [
    EmployeeComponent,
    LeaveComponent
  ],
  imports: [
    SharedModule,
    RoutingModule
  ],
  entryComponents: [
    LeaveComponent
  ]
})
export class HrmModule { }
