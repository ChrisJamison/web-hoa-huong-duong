using BusinessEntities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessServices
{
    public class Menu
    {
        public IEnumerable<CategoryEntity> GetCategoryLevel1 { get; set; }
        public IEnumerable<CategoryEntity> GetCategoryLevel2 { get; set; }
        public IEnumerable<CategoryEntity> GetCategoryLevel3 { get; set; }
    }
}
