using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessEntities
{
    public class BillEntity
    {
        public int Bill_ID { get; set; }
        public Nullable<int> Cart_ID { get; set; }
        public Nullable<System.DateTime> DateOfCreation { get; set; }
        public bool isPayed { get; set; }
        public bool isOrdered { get; set; }

        public virtual CartEntity Cart { get; set; }
    }
}
