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
    public class CartDetailServices : ICartDetailServices
    {
        private readonly UnitOfWork _unitOfWork;

        public CartDetailServices()
        {
            _unitOfWork = new UnitOfWork();
        }

        public BusinessEntities.CartDetailEntity GetCartDetailById(int cartDetailId)
        {
            var cartDetail = _unitOfWork.CartDetailRepository.GetById(cartDetailId);
            if (cartDetail != null)
            {
                var cartDetailModel = Mapper.Map<CartDetail, CartDetailEntity>(cartDetail);
                return cartDetailModel;
            }
            return null;
        }

        public IEnumerable<BusinessEntities.CartDetailEntity> GetAllCartDetail()
        {
            var cartDetail = _unitOfWork.CartDetailRepository.GetAll();
            if (cartDetail.Any())
            {
                var cartDetailModel = Mapper.Map<IEnumerable<CartDetail>, IEnumerable<CartDetailEntity>>(cartDetail);
                return cartDetailModel;
            }
            return null;
        }

        public int CreateCartDetail(BusinessEntities.CartDetailEntity cartDetailEntity)
        {
            using (var scope = new TransactionScope())
            {
                var cartDetail = Mapper.Map<CartDetailEntity, CartDetail>(cartDetailEntity);
                _unitOfWork.CartDetailRepository.Insert(cartDetail);
                _unitOfWork.Save();
                scope.Complete();
                return cartDetail.Cart_Detail_ID;
            }
        }

        public bool UpdateCartDetail(BusinessEntities.CartDetailEntity cartDetailEntity)
        {
            var success = false;
            if (cartDetailEntity != null)
            {
                using (var scope = new TransactionScope())
                {
                    var cartDetail = Mapper.Map<CartDetailEntity, CartDetail>(cartDetailEntity);
                    _unitOfWork.CartDetailRepository.Update(cartDetail);
                    _unitOfWork.Save();
                    scope.Complete();
                    success = true;
                }
            }

            return success;
        }

        public bool DeleteCartDetail(int cartDetailId)
        {
            var success = false;
            if (cartDetailId > 0)
            {
                var cartDetail = _unitOfWork.CartDetailRepository.GetById(cartDetailId);
                if (cartDetail != null)
                {
                    using (var scope = new TransactionScope())
                    {
                        _unitOfWork.CartDetailRepository.Delete(cartDetail);
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
