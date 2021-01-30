using M2SYS.Domain.Entities;
using MediatR;

namespace M2SYS.Core.Query
{
    public class GetEmployeeByIdQuery: IRequest<Employee>
    {
        public long Id { get; }
        
        public GetEmployeeByIdQuery(long id)
        {
            Id = id;
        }
    }
}