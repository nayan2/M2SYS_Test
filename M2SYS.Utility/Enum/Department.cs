using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace M2SYS.Utility.Enum
{
    public enum Department: byte
    {
        [Description("Hr")]
        Hr = 0,
        [Description("Sales")]
        Sales = 1,
        [Description("Marketing")]
        Marketing = 2,
        [Description("Production")]
        Production = 3
    }
}
