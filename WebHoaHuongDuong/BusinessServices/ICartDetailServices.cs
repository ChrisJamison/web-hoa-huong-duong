using BusinessEntities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessServices
{
    public interface ICartDetailServices
    {
        CartDetailEntity GetCartDetailById(int cartDetailId);
        IEnumerable<CartDetailEntity> GetAllCartDetail();
        int CreateCartDetail(CartDetailEntity cartDetailEntity);
        bool UpdateCartDetail(CartDetailEntity cartDetailEntity);
        bool DeleteCartDetail(int cartDetailId);
    }
}
