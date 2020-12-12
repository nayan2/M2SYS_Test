using M2SYS.Domain.EntityBase;
using M2SYS.Utility.Enum;
using System;
using System.ComponentModel.DataAnnotations.Schema;
using M2SYS.Utility.Extension;

namespace M2SYS.Domain.Entities
{
    public class Leave : Auditable
    {
        public long Id { get; set; }
        public long EmployeeId { get; set; }
        public LeaveType LeaveType { get; set; }
        public string Description { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public Employee Employee { get; set; }

        [NotMapped]
        public string EmployeeLeaveType => EnumExtension.GetDescription(typeof(LeaveType), this.LeaveType.ToString());
    }
}
