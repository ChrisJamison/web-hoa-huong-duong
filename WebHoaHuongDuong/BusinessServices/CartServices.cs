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
    public class CartServices : ICartServices
    {
        private readonly UnitOfWork _unitOfWork;

        public CartServices()
        {
            _unitOfWork = new UnitOfWork();
        }

        public BusinessEntities.CartEntity GetCartById(int cartId)
        {
            var cart = _unitOfWork.CartRepository.GetById(cartId);
            if (cart != null)
            {
                var cartModel = Mapper.Map<Cart, CartEntity>(cart);
                return cartModel;
            }
            return null;
        }

        public IEnumerable<BusinessEntities.CartEntity> GetAllCart()
        {
            var cart = _unitOfWork.CartRepository.GetAll();
            if (cart.Any())
            {
                var cartModel = Mapper.Map<IEnumerable<Cart>, IEnumerable<CartEntity>>(cart);
                return cartModel;
            }
            return null;
        }

        public int CreateCart(BusinessEntities.CartEntity cartEntity)
        {
            using (var scope = new TransactionScope())
            {
                var cart = Mapper.Map<CartEntity, Cart>(cartEntity);
                _unitOfWork.CartRepository.Insert(cart);
                _unitOfWork.Save();
                scope.Complete();
                return cart.Cart_ID;
            }
        }

        public bool UpdateCart(BusinessEntities.CartEntity cartEntity)
        {
            var success = false;
            if (cartEntity != null)
            {
                using (var scope = new TransactionScope())
                {
                    var cart = Mapper.Map<CartEntity, Cart>(cartEntity);
                    _unitOfWork.CartRepository.Update(cart);
                    _unitOfWork.Save();
                    scope.Complete();
                    success = true;
                }
            }

            return success;
        }

        public bool DeleteCart(int cartId)
        {
            var success = false;
            if (cartId > 0)
            {
                var cart = _unitOfWork.CartRepository.GetById(cartId);
                if (cart != null)
                {
                    using (var scope = new TransactionScope())
                    {
                        _unitOfWork.CartRepository.Delete(cart);
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
