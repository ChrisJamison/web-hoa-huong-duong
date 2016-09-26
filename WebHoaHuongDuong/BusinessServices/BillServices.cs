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
    public class BillServices : IBillServices
    {
        private readonly UnitOfWork _unitOfWork;

        public BillServices()
        {
            _unitOfWork = new UnitOfWork();
        }

        public BusinessEntities.BillEntity GetBillById(int billId)
        {
            var bill = _unitOfWork.BillRepository.GetById(billId);
            if (bill != null)
            {
                var billModel = Mapper.Map<Bill, BillEntity>(bill);
                return billModel;
            }
            return null;
        }

        public IEnumerable<BusinessEntities.BillEntity> GetAllBill()
        {
            var bill = _unitOfWork.BillRepository.GetAll();
            if (bill.Any())
            {
                var billModel = Mapper.Map<IEnumerable<Bill>, IEnumerable<BillEntity>>(bill);
                return billModel;
            }
            return null;
        }

        public int CreateBill(BusinessEntities.BillEntity billEntity)
        {
            using (var scope = new TransactionScope())
            {
                var bill = Mapper.Map<BillEntity, Bill>(billEntity);
                _unitOfWork.BillRepository.Insert(bill);
                _unitOfWork.Save();
                scope.Complete();
                return bill.Bill_ID;
            }
        }

        public bool UpdateBill(BusinessEntities.BillEntity billEntity)
        {
            var success = false;
            if (billEntity != null)
            {
                using (var scope = new TransactionScope())
                {
                    var bill = Mapper.Map<BillEntity, Bill>(billEntity);
                    _unitOfWork.BillRepository.Update(bill);
                    _unitOfWork.Save();
                    scope.Complete();
                    success = true;
                }
            }

            return success;
        }

        public bool DeleteBill(int billId)
        {
            var success = false;
            if (billId > 0)
            {
                var bill = _unitOfWork.BillRepository.GetById(billId);
                if (bill != null)
                {
                    using (var scope = new TransactionScope())
                    {
                        _unitOfWork.BillRepository.Delete(bill);
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
