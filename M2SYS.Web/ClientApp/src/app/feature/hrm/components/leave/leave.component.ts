import {Component, Inject, OnInit, ViewChild} from '@angular/core';
import {MAT_DIALOG_DATA, MatDialogRef} from "@angular/material/dialog";
import {FormBuilder, FormGroupDirective, Validators} from "@angular/forms";
import {MatSort} from "@angular/material/sort";
import {MatPaginator} from "@angular/material/paginator";
import {MatTableDataSource} from "@angular/material/table";
import {MessageService} from "../../../../core/services/message/message.service";
import {EnumService} from "../../../../core/services/enum-service/enum.service";
import {LeaveService} from "../../services/leave/leave.service";
import {Pagination} from "../../../../core/services/paging/paging";

@Component({
  selector: 'app-leave',
  templateUrl: './leave.component.html',
  styleUrls: ['./leave.component.scss']
})
export class LeaveComponent implements OnInit {

  columns: string[] = ['sl', 'type', 'description', 'startDate', 'endDate', 'action'];
  dataSource = new MatTableDataSource();
  pagination = new Pagination();
  today: Date = new Date();
  leaveTypes: any[] = [];

  @ViewChild(MatSort, { static: true }) sort: MatSort;
  @ViewChild(MatPaginator, {static: true}) paginator: MatPaginator;

  leaveForm = this.fb.group({
    id: [0],
    employeeId: [0],
    leaveType: [0, [Validators.required]],
    description: ['', [Validators.required]],
    startDate: ['', [Validators.required]],
    endDate: ['', [Validators.required]]
  });

  constructor(public dialogRef: MatDialogRef<LeaveComponent>,
              private fb: FormBuilder,
              private messageService: MessageService,
              private enumService: EnumService,
              private leaveService: LeaveService,
              @Inject(MAT_DIALOG_DATA) public data: any)
  { }

  ngOnInit() {
    this.fillEmployeeLeaves();
    this.getAllAvailableLeaveTypes();
  }

  fillEmployeeLeaves = (): void => {
    if(this.data.leaves) {
      this.load(this.data.leaves);
    }
    this.leaveForm.patchValue({employeeId: this.data.employeeId});
  }

  load(data) {
    this.dataSource = new MatTableDataSource(data);
    this.dataSource.sort = this.sort;
    this.dataSource.paginator = this.paginator;
  }

  getAllAvailableLeaveTypes = (): void => {
    this.enumService.getAllLeaveTypes().subscribe(
      ((res: any) => {
        this.leaveTypes = res;
      })
    )
  }

  save = (formDirective: FormGroupDirective): void => {
    const entity = this.leaveForm.value;

    if (entity['id'] > 0) {
      this.leaveService.edit(entity['id'], entity).subscribe(res => {
        this.resetFrom(formDirective);
        const index = this.dataSource.data.findIndex(x => x['id'] === entity['id']);
        this.dataSource.data[index] = res;
        this.load(this.dataSource.data);
        this.messageService.show(this.messageService.msgUpdate, 'success');
      }, (err => {
        this.messageService.show(err.error.message, 'warning');
      }));
    } else {
      this.leaveService.add(entity).subscribe(res => {
        this.resetFrom(formDirective);
        this.dataSource.data.push(res);
        this.load(this.dataSource.data);
        this.messageService.show(this.messageService.msgSave, 'success');
      }, (err => {
        this.messageService.show(err.error.message, 'warning');
      }));
    }
  }

  edit = (id: number): void => {
    this.leaveForm.patchValue(this.dataSource.data.find((x: any) => x.id === id));
  }

  delete = (id: number): void => {
    this.messageService.confirm(this.messageService.msgConfirmDelete).then((result) => {
      if (result.value) {
        this.leaveService.delete(id).subscribe(_ => {
          const index = this.dataSource.data.findIndex(x => x['id'] === id);
          this.dataSource.data.splice(index, 1);
          this.load(this.dataSource.data);
          this.messageService.show(this.messageService.msgDelete, 'success');
        });
      }
    });
  }

  changePage = ($event): void => {
    this.pagination.pageSize = $event.pageSize;
    this.pagination.pageIndex = $event.pageIndex;
  }

  resetFrom = (formDirective: FormGroupDirective): void => {
    formDirective.resetForm();
    this.leaveForm.patchValue({employeeId: this.data.employeeId});
  }

  closePopUp(isForcedClosed: boolean): void {
    if (isForcedClosed) {
      this.dialogRef.close('no');
    } else {
      this.dialogRef.close();
    }

  }
}
