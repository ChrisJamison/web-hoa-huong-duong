using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessEntities
{
    public class CustomerEntity
    {
        public CustomerEntity()
        {
            this.Carts = new HashSet<CartEntity>();
        }

        public int Customer_ID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Phone { get; set; }
        public string Address { get; set; }
        public Nullable<System.DateTime> LastDateAccess { get; set; }
        public string IdentifyCardNumber { get; set; }
        public string Email { get; set; }

        public virtual ICollection<CartEntity> Carts { get; set; }
    }
}
