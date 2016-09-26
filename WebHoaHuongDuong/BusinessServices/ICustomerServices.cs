using BusinessEntities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessServices
{
    public interface ICustomerServices
    {
        CustomerEntity GetCustomerById(int customerId);
        IEnumerable<CustomerEntity> GetAllCustomer();
        int CreateCustomer(CustomerEntity customerEntity);
        bool UpdateCustomer(CustomerEntity customerEntity);
        bool DeleteCustomer(int customerId);
    }
}
