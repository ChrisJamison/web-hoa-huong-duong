using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessEntities
{
    public class CartEntity
    {
        public CartEntity()
        {
            this.Bills = new HashSet<BillEntity>();
            this.CartDetails = new HashSet<CartDetailEntity>();
        }

        public int Cart_ID { get; set; }
        public Nullable<int> Customer_ID { get; set; }
        public Nullable<System.DateTime> DateOfCreation { get; set; }

        public virtual ICollection<BillEntity> Bills { get; set; }
        public virtual CustomerEntity Customer { get; set; }
        public virtual ICollection<CartDetailEntity> CartDetails { get; set; }
    }
}
