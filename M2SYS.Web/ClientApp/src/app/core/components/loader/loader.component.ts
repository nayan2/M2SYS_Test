import { Component } from '@angular/core';
import { size, type } from './loader.constant'
@Component({
  selector: 'app-loader',
  templateUrl: './loader.component.html',
  styleUrls: ['./loader.component.scss']
})
export class LoaderComponent {

  bdColor="rgba(51,51,51,0.8)";
  color="#4dbad1";
  size=size.medium;
  type=type.ballClipRotate;

  constructor() { }

}
