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
    public class CategoryServices : ICategoryServices
    {
         private readonly UnitOfWork _unitOfWork;

         public CategoryServices()
        {
            _unitOfWork = new UnitOfWork();
        }

        public BusinessEntities.CategoryEntity GetCategoryById(int categoryId)
        {
            var category = _unitOfWork.CategoryRepository.GetById(categoryId);
            if (category != null)
            {
                var categoryModel = Mapper.Map<Category, CategoryEntity>(category);
                return categoryModel;
            }
            return null;
        }

        public IEnumerable<BusinessEntities.CategoryEntity> GetAllCategory()
        {
            var category = _unitOfWork.CategoryRepository.GetAll(); ;
            if (category.Any())
            {
                var categoryModel = Mapper.Map<IEnumerable<Category>, IEnumerable<CategoryEntity>>(category);
                return categoryModel;
            }
            return null;
        }

        public int CreateCategory(BusinessEntities.CategoryEntity categoryEntity)
        {
            using (var scope = new TransactionScope())
            {
                var category = Mapper.Map<CategoryEntity, Category>(categoryEntity);
                _unitOfWork.CategoryRepository.Insert(category);
                _unitOfWork.Save();
                scope.Complete();
                return category.Category_ID;
            }
        }

        public bool UpdateCategory(BusinessEntities.CategoryEntity categoryEntity)
        {
            var success = false;
            if (categoryEntity != null)
            {
                using (var scope = new TransactionScope())
                {
                    var category = Mapper.Map<CategoryEntity, Category>(categoryEntity);
                    _unitOfWork.CategoryRepository.Update(category);
                    _unitOfWork.Save();
                    scope.Complete();
                    success = true;
                }
            }
            return success;
        }

        public bool DeleteCategory(int categoryId)
        {
            var success = false;
            if (categoryId > 0)
            {
                var category = _unitOfWork.CategoryRepository.GetById(categoryId);
                if (category != null)
                {
                    using (var scope = new TransactionScope())
                    {
                        _unitOfWork.CategoryRepository.Delete(category);
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
