using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessEntities
{
    public class CartDetailEntity
    {
        public int Cart_Detail_ID { get; set; }
        public Nullable<int> Product_ID { get; set; }
        public Nullable<int> Quantity { get; set; }
        public Nullable<int> Cart_ID { get; set; }

        public virtual CartEntity Cart { get; set; }
        public virtual ProductEntity Product { get; set; }
    }
}
