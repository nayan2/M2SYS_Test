using M2SYS.Domain.EntityBase;
using M2SYS.Utility.Enum;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using M2SYS.Utility.Extension;

namespace M2SYS.Domain.Entities
{
    public class Employee : Auditable
    {
        public long Id { get; set; }
        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        public string LastName { get; set; }
        public DateTime DOB { get; set; }
        public DateTime JoiningDate { get; set; }
        public Designation Designation { get; set; }
        public Department Department { get; set; }
        public List<Leave> Leaves { get; set; }

        [NotMapped]
        public string EmployeeDesignation =>
            EnumExtension.GetDescription(typeof(Designation), this.Designation.ToString());
        [NotMapped] public string EmployeeDepartment =>
            EnumExtension.GetDescription(typeof(Department), this.Department.ToString());
    }
}
