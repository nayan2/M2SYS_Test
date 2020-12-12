using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace M2SYS.Utility.Enum
{
    public enum LeaveType: byte
    {
        [Description("Sick Leave")]
        Sick = 0,
        [Description("Annual Leave")]
        Annual = 1,
        [Description("Casual Leave")]
        Casual = 2,
        [Description("Paternity Leave")]
        PaternityLeave = 3,
        [Description("Maternity Leave")]
        MaternityLeave = 4
    }
}
