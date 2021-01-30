using System.Collections.Generic;

namespace M2SYS.Service.Interface
{
    public interface IEnumService
    {
        List<KeyValuePair<int, string>> GetDepartments();
        List<KeyValuePair<int, string>> GetDesignations();
        List<KeyValuePair<int, string>> GetLeaveTypes();
    }
}