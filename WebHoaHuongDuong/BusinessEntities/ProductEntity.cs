using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace BusinessEntities
{
    public class ProductEntity
    {

        public int Product_ID { get; set; }
        public string Name { get; set; }
        public int Category_ID { get; set; }
        [AllowHtml]
        public string Description { get; set; }
        public string URL { get; set; }
        public string Image { get; set; }
        public Nullable<System.DateTime> DateUpload { get; set; }
        public Nullable<int> Price { get; set; }
        public Nullable<int> NumberInStock { get; set; }
        public Nullable<int> Views { get; set; }
        public Nullable<System.DateTime> DateUpdate { get; set; }
        public Nullable<decimal> Price_promotion { get; set; }
        public Nullable<bool> Is_active { get; set; }
        public Nullable<bool> Is_savedraft { get; set; }

        public virtual CategoryEntity Category { get; set; }
    }
}
