using BusinessEntities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessServices
{
    public interface ICartServices
    {
        CartEntity GetCartById(int cartId);
        IEnumerable<CartEntity> GetAllCart();
        int CreateCart(CartEntity cartEntity);
        bool UpdateCart(CartEntity cartEntity);
        bool DeleteCart(int cartId);
    }
}
