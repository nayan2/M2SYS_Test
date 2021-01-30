using M2SYS.Domain.Entities;
using M2SYS.Utility.DTOs;
using MediatR;

namespace M2SYS.Core.Query
{
    public class GetPagedEmployeeQuery: IRequest<Page<Employee>>
    {
        public int PageIndex { get; }
        public int PageSize { get; }
        public string SearchTerm { get; }

        public GetPagedEmployeeQuery(int pageIndex, int pageSize, string searchTerm)
        {
            PageIndex = pageIndex;
            PageSize = pageSize;
            SearchTerm = searchTerm;
        }
    }
}