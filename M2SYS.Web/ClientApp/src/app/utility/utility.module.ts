import { NgModule } from '@angular/core';
import { LocalTimePipe } from './pipe/local-time/local-time.pipe';

@NgModule({
  declarations: [
    LocalTimePipe
  ],
  exports: [
    LocalTimePipe
  ]
})
export class UtilityModule { }
