using AutoMapper;
using BusinessEntities;
using DataModel;
using DataModel.UnitOfWork;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Transactions;

namespace BusinessServices
{
    public class CustomerServices : ICustomerServices
    {
        private readonly UnitOfWork _unitOfWork;

        public CustomerServices()
        {
            _unitOfWork = new UnitOfWork();
        }

        public BusinessEntities.CustomerEntity GetCustomerById(int customerId)
        {
            var customer = _unitOfWork.CustomerRepository.GetById(customerId);
            if (customer != null)
            {
                var customerModel = Mapper.Map<Customer, CustomerEntity>(customer);
                return customerModel;
            }
            return null;
        }

        public IEnumerable<BusinessEntities.CustomerEntity> GetAllCustomer()
        {
            var customer = _unitOfWork.CustomerRepository.GetAll();
            if (customer.Any())
            {
                var customerModel = Mapper.Map<IEnumerable<Customer>, IEnumerable<CustomerEntity>>(customer);
                return customerModel;
            }
            return null;
        }

        public int CreateCustomer(BusinessEntities.CustomerEntity customerEntity)
        {
            using (var scope = new TransactionScope())
            {
                var customer = Mapper.Map<CustomerEntity, Customer>(customerEntity);
                _unitOfWork.CustomerRepository.Insert(customer);
                _unitOfWork.Save();
                scope.Complete();
                return customer.Customer_ID;
            }
        }

        public bool UpdateCustomer(BusinessEntities.CustomerEntity customerEntity)
        {
            var success = false;
            if (customerEntity != null)
            {
                using (var scope = new TransactionScope())
                {
                    var customer = Mapper.Map<CustomerEntity, Customer>(customerEntity);
                    _unitOfWork.CustomerRepository.Update(customer);
                    _unitOfWork.Save();
                    scope.Complete();
                    success = true;
                }
            }

            return success;
        }

        public bool DeleteCustomer(int customerId)
        {
            var success = false;
            if (customerId > 0)
            {
                var customer = _unitOfWork.CustomerRepository.GetById(customerId);
                if (customer != null)
                {
                    using (var scope = new TransactionScope())
                    {
                        _unitOfWork.CustomerRepository.Delete(customer);
                        _unitOfWork.Save();
                        scope.Complete();
                        success = true;
                    }
                }
            }
            return success;
        }
    }
}
