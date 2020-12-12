using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace M2SYS.Utility.Enum
{
    public enum Designation: byte
    {
        [Description("Intern")]
        Intern = 0,
        [Description("Junior Software Engineer")]
        JuniorSoftwareEngineer = 1,
        [Description("Software Engineer")]
        SoftwareEngineer = 2,
        [Description("Senior Software Engineer")]
        SeniorSoftwareEngineer = 3
    }
}
