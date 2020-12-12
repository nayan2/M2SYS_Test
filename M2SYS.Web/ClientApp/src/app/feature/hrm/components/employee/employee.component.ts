import {Component, OnInit, ViewChild} from '@angular/core';
import {FormBuilder, FormGroupDirective, Validators} from "@angular/forms";
import {EmployeeService} from "../../services/employee/employee.service";
import {MatTableDataSource} from "@angular/material/table";
import {MatSort} from "@angular/material/sort";
import {MessageService} from "../../../../core/services/message/message.service";
import {Pagination} from "../../../../core/services/paging/paging";
import {EnumService} from "../../../../core/services/enum-service/enum.service";
import {MatDialog} from "@angular/material/dialog";
import {LeaveComponent} from "../leave/leave.component";

@Component({
  selector: 'app-employee',
  templateUrl: './employee.component.html',
  styleUrls: ['./employee.component.scss']
})
export class EmployeeComponent implements OnInit {

  columns: string[] = ['sl', 'firstName', 'middleName', 'lastName', 'dob', 'joiningDate', 'designation', 'department', 'action'];
  dataSource = new MatTableDataSource();
  pagination = new Pagination();
  today: Date = new Date();
  departments: any[] = [];
  designations: any[] = [];

  @ViewChild(MatSort, { static: true }) sort: MatSort;
  employeeForm = this.fb.group({
    id: [0],
    firstName: ['', [Validators.required]],
    middleName: [''],
    lastName: ['', [Validators.required]],
    dob: ['', [Validators.required]],
    joiningDate: ['', [Validators.required]],
    designation: ['', [Validators.required]],
    department: ['', [Validators.required]]
  });

  constructor(private fb: FormBuilder,
              private employeeService: EmployeeService,
              private messageService: MessageService,
              private enumService: EnumService,
              public dialog: MatDialog
  ) {}

  ngOnInit() {
    this.getAllAvailableEmployee();
    this.getAllAvailableDesignations();
    this.getAllAvailableDepartments();
  }

  load(data) {
    this.dataSource = new MatTableDataSource(data);
    this.dataSource.sort = this.sort;
  }

  getAllAvailableEmployee = (): void => {
    this.employeeService.gets(this.pagination).subscribe(res => {
      this.pagination.totalCount = res.totalCount;
      this.load(res.data);
    }, error => {
        this.messageService.show(error.error.message, "error");
    });
  }

  getAllAvailableDesignations = (): void => {
    this.enumService.getAllDesignationTypes().subscribe(
      ((res: any) => {
        this.designations = res;
      })
    )
  }

  getAllAvailableDepartments = (): void => {
    this.enumService.getAllDepartmentTypes().subscribe(
      ((res: any) => {
        this.departments = res;
      })
    )
  }

  save = (formDirective: FormGroupDirective): void => {
    const entity = this.employeeForm.value;

    if (entity['id'] > 0) {
      this.employeeService.edit(entity['id'], entity).subscribe(res => {
        this.resetFrom(formDirective);
        const index = this.dataSource.data.findIndex(x => x['id'] === entity['id']);
        this.dataSource.data[index] = res;
        this.load(this.dataSource.data);
        this.messageService.show(this.messageService.msgUpdate, 'success');
      }, (err => {
        this.messageService.show(err.error.message, 'warning');
      }));
    } else {
      this.employeeService.add(entity).subscribe(res => {
        this.resetFrom(formDirective);
        this.dataSource.data.push(res);
        this.load(this.dataSource.data);
        this.pagination.totalCount++;
        this.messageService.show(this.messageService.msgSave, 'success');
      }, (err => {
        this.messageService.show(err.error.message, 'warning');
      }));
    }
  }

  edit = (id: number): void => {
    this.employeeForm.patchValue(this.dataSource.data.find((x: any) => x.id === id));
  }

  manageLeave = (employee: any): void => {
    const dialogRef = this.dialog.open(LeaveComponent, {
      width: '100vh',
      data: { employeeId: employee.id, leaves: employee.leaves },
    });
    dialogRef.disableClose = true;
    dialogRef.afterClosed().subscribe(result => {
      // I am closed
    });
  }

  delete = (id: number): void => {
    this.messageService.confirm(this.messageService.msgConfirmDelete).then((result) => {
      if (result.value) {
        this.employeeService.delete(id).subscribe(_ => {
          const index = this.dataSource.data.findIndex(x => x['id'] === id);
          this.dataSource.data.splice(index, 1);
          this.load(this.dataSource.data);
          this.pagination.totalCount--;
          this.messageService.show(this.messageService.msgDelete, 'success');
        });
      }
    });
  }

  resetFrom = (formDirective: FormGroupDirective): void => {
    formDirective.resetForm();
    this.employeeForm.patchValue({id: 0});
  }

  applyFilter = (filterValue: string): void => {
    this.pagination.searchText = filterValue;
    this.getAllAvailableEmployee();
  }

  changePage = ($event): void => {
    this.pagination.pageSize = $event.pageSize;
    this.pagination.pageIndex = $event.pageIndex;
    this.getAllAvailableEmployee();
  }
}
