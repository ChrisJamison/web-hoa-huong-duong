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
        public int? Cart_ID { get; set; }
        public DateTime? DateOfCreation { get; set; }
        public bool isPayed { get; set; }
        public bool isOrdered { get; set; }
        public decimal? BillTotal { get; set; }
        public int? Product_ID { get; set; }
    }
}
