using System.Collections.Generic;
using M2SYS.Service.Interface;
using M2SYS.Utility.Enum;
using M2SYS.Utility.Extension;

namespace M2SYS.Service
{
    public class EnumService : IEnumService
    {
        public List<KeyValuePair<int, string>> GetDepartments()
        {
            return EnumExtension.GetKeyValues(typeof(Department));
        }

        public List<KeyValuePair<int, string>> GetDesignations()
        {
            return EnumExtension.GetKeyValues(typeof(Designation));
        }

        public List<KeyValuePair<int, string>> GetLeaveTypes()
        {
            return EnumExtension.GetKeyValues(typeof(LeaveType));
        }
    }
}