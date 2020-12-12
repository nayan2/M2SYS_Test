using System.Collections.Generic;

namespace M2SYS.Utility.DTOs
{
    public class Page<T>
    {
        public List<T> Data { get; set; }
        public int TotalCount { get; set; }
    }
}