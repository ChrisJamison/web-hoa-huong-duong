using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataModel;
using DataModel.UnitOfWork;
using AutoMapper;
using BusinessEntities;
using System.Transactions;

namespace BusinessServices
{
    public class ProductServices : IProductServices
    {
        private readonly UnitOfWork _unitOfWork;

        public ProductServices()
        {
            _unitOfWork = new UnitOfWork();
        }

        public BusinessEntities.ProductEntity GetProductById(int productId)
        {
            var product = _unitOfWork.ProductRepository.GetById(productId);
            if (product != null)
            {
                var productModel = Mapper.Map<Product, ProductEntity>(product);
                return productModel;
            }
            return null;
        }

        public List<BusinessEntities.ProductEntity> GetAllProduct()
        {
            var products = _unitOfWork.ProductRepository.GetAll().ToList();
            if (products.Any())
            {
                var productsModel = Mapper.Map<List<Product>, List<ProductEntity>>(products);
                return productsModel;
            }
            return null;
        }

        public int CreateProduct(BusinessEntities.ProductEntity productEntity)
        {
            using (var scope = new TransactionScope())
            {
                var product = Mapper.Map<ProductEntity, Product>(productEntity);
                _unitOfWork.ProductRepository.Insert(product);
                _unitOfWork.Save();
                scope.Complete();
                return product.Product_ID;
            }
        }

        public bool UpdateProduct(BusinessEntities.ProductEntity productEntity)
        {
            var success = false;
            if (productEntity != null)
            {
                using (var scope = new TransactionScope())
                {
                    var product = Mapper.Map<ProductEntity, Product>(productEntity);
                    _unitOfWork.ProductRepository.Update(product);
                    _unitOfWork.Save();
                    scope.Complete();
                    success = true;
                }
            }

            return success;
        }

        public bool DeleteProduct(int productId)
        {
            var success = false;
            if (productId > 0)
            {
                var product = _unitOfWork.ProductRepository.GetById(productId);
                if (product != null)
                {
                    using (var scope = new TransactionScope())
                    {
                        _unitOfWork.ProductRepository.Delete(product);
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
