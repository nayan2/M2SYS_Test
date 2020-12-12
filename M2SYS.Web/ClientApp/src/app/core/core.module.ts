import { NgModule } from '@angular/core';

import { SharedModule } from '../shared/shared.module';
import { RouterModule } from '@angular/router';

import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';

import { NgxSpinnerModule } from 'ngx-spinner';
import { AngularFontAwesomeModule } from 'angular-font-awesome';
import { HttpConfigInterceptor } from './interceptor/HttpConfigInterceptor';

import { LoaderComponent } from './components/loader/loader.component';
import { HomePageComponent } from './components/home-page/home-page.component';
import { AppShellComponent } from './components/app-shell/app-shell.component';
import {NavMenuComponent} from "./components/nav-menu/nav-menu.component";

@NgModule({
  declarations: [
    LoaderComponent,
    HomePageComponent,
    AppShellComponent,
    NavMenuComponent
  ],
  imports: [
    HttpClientModule,
    NgxSpinnerModule,
    AngularFontAwesomeModule,
    RouterModule,
    SharedModule
  ],
  providers: [
    { provide: HTTP_INTERCEPTORS, useClass: HttpConfigInterceptor, multi: true }
  ],
  exports : [
    AppShellComponent,
    HomePageComponent
  ]
})
export class CoreModule { }
