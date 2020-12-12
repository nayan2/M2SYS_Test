using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace M2SYS.Domain.EntityBase
{
    public abstract class Auditable
    {
        protected Auditable()
        {
            CreatedDateUtc = DateTime.UtcNow;
        }

        [Required]
        public virtual long CreatedBy { get; set; }

        [Required]
        public DateTime CreatedDateUtc { get; set; }

        public long UpdatedBy { get; set; }

        public DateTime? UpdatedDateUtc { get; set; }
    }
}
