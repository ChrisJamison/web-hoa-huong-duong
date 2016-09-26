using BusinessEntities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessServices
{
    public interface ICategoryServices
    {
        CategoryEntity GetCategoryById(int categoryId);
        IEnumerable<CategoryEntity> GetAllCategory();
        int CreateCategory(CategoryEntity categoryEntity);
        bool UpdateCategory(CategoryEntity categoryEntity);
        bool DeleteCategory(int categoryId);
    }
}
