using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessEntities
{
   public class NewsEntity
    {
        public int News_ID { get; set; }
        public string Title { get; set; }
        public Nullable<bool> Is_active { get; set; }
        public Nullable<System.DateTime> DateUpload { get; set; }
        public Nullable<System.DateTime> DateUpdate { get; set; }
        public Nullable<bool> Is_savedraft { get; set; }
        public Nullable<int> Views { get; set; }
    }
}
