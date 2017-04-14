using System;
using System.Linq;
using System.Web.Mvc;
using BusinessServices;

namespace WebHoaHuongDuong.Controllers
{
    public class CategoryController : Controller
    {
        private readonly ICategoryServices _iCategoryServices;
        private readonly IProductServices _iProductServices;

        public CategoryController(ICategoryServices iCategoryServices, IProductServices iProductServices)
        {
            _iCategoryServices = iCategoryServices;
            _iProductServices = iProductServices;
        }

        public ActionResult ViewIndex(int? id)
        {
            if (id == null)
            {
                var model = _iProductServices.GetAllProduct().Where(c => c.Price != 0).OrderBy(c => Guid.NewGuid()).Take(20);
                return View(model);
            }
            var products = _iProductServices.GetAllProduct().Where(c => c.Category_ID == id && c.Price != 0).OrderBy(c => Guid.NewGuid());
            return View(products);
        }

        public ActionResult SanPhamMoi()
        {
            var products = _iProductServices.GetAllProduct().OrderBy(c => c.DateUpdate).Where(c => c.Price != 0);
            return View(products);
        }

        public ActionResult SanPhamXemNhieu()
        {
            var products = _iProductServices.GetAllProduct().OrderBy(c => c.Views).Where(c => c.Price != 0);
            return View(products);
        }

        public ActionResult SanPhamBanChay()
        {
            var products = _iProductServices.GetAllProduct().OrderBy(c => c.Price).Where(c => c.Price != 0);
            return View(products.ToList());
        }

        public ActionResult MyPham()
        {
            var categories = _iCategoryServices.GetAllCategory().Where(c => (c.Parent_ID == 1 || c.Parent_ID == 12));
            var products = _iProductServices.GetAllProduct();

            var model = products.Join(categories, product => product.Category_ID, category => category.Category_ID,
                (product, category) => product).Where(c => c.Price != 0).OrderBy(c => Guid.NewGuid()).Take(6);

            return View(model);
        }

        public ActionResult SuaXachTayChoBeYeu()
        {
            var categories = _iCategoryServices.GetAllCategory().Where(c => c.Parent_ID == 2);
            var products = _iProductServices.GetAllProduct();

            var model = products.Join(categories, product => product.Category_ID, category => category.Category_ID,
                (product, category) => product).Where(c => c.Price != 0).OrderBy(c => Guid.NewGuid()).Take(6);
            return View(model);
        }
    }
}