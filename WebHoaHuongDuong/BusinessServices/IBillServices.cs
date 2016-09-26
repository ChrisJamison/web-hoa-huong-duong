using BusinessEntities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessServices
{
   public interface IBillServices
    {
       BillEntity GetBillById(int billId);
       IEnumerable<BillEntity> GetAllBill();
       int CreateBill(BillEntity billEntity);
       bool UpdateBill(BillEntity billEntity);
       bool DeleteBill(int billId);
    }
}
