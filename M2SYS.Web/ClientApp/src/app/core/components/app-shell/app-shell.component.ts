import { Component, OnInit } from '@angular/core';
import { NavigateService } from "../../services/navigate/navigate.service";

@Component({
  selector: 'app-shell',
  templateUrl: './app-shell.component.html',
  styleUrls: ['./app-shell.component.scss']
})
export class AppShellComponent implements OnInit {

  constructor(private navigateService: NavigateService) {}

  ngOnInit() {
    setTimeout(() => {
      // As No authentication needed
      // Navigate to home
      this.navigateService.toHRMEmployee();
    }, 100)
  }
}
