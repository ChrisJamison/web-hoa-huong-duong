using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessEntities;

namespace BusinessServices
{
    public interface IProductServices
    {
        ProductEntity GetProductById(int productId);
        List<ProductEntity> GetAllProduct();
        int CreateProduct(ProductEntity productEntity);
        bool UpdateProduct(ProductEntity productEntity);
        bool DeleteProduct(int productId);
    }
}
