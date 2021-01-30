using M2SYS.Domain.Entities;
using MediatR;

namespace M2SYS.Core.Command
{
    public class AddEmployeeCommand: Employee, IRequest<Employee>
    {
        
    }
}