using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DataModel;
using BusinessServices;
using WebHoaHuongDuong.Models;

namespace WebHoaHuongDuong.Controllers
{
    public class ProductController : Controller
    {
        private readonly WebHoaHuongDuongDBEntities _db = new WebHoaHuongDuongDBEntities();
        private readonly IProductServices _iProductServices;
        private readonly ICategoryServices _iCategoryServices;

        public ProductController(IProductServices iProductServices, ICategoryServices iCategoryServices)
        {
            _iProductServices = iProductServices;
            _iCategoryServices = iCategoryServices;
        }

        [ChildActionOnly]
        public ActionResult _SanPhamMoi()
        {
            var model = _iProductServices.GetAllProduct().Where(c => c.Price != 0).OrderBy(c => c.DateUpdate).ThenBy(c => Guid.NewGuid()).Take(9);
                
            return PartialView("_ProductListBlock", model);
        }

        [ChildActionOnly]
        public ActionResult _SanPhamXemNhieu()
        {
            var model = _iProductServices.GetAllProduct().Where(c => c.Price != 0).OrderByDescending(c => c.Views).ThenBy(c => Guid.NewGuid()).Take(9);
            return PartialView("_ProductListBlock", model);
        }

        [ChildActionOnly]
        public ActionResult _SanPhamBanChay()
        {
            var model = _iProductServices.GetAllProduct().Where(c => c.Price != 0).OrderBy(c => Guid.NewGuid()).Take(9);
            return PartialView("_ProductListBlock", model);
        }

        [ChildActionOnly]
        public ActionResult _MyPham()
        {
            var categories = _iCategoryServices.GetAllCategory().Where(c => (c.Parent_ID == 1 || c.Parent_ID == 12));
            var products = _iProductServices.GetAllProduct();

            var model = products.Join(categories, product => product.Category_ID, category => category.Category_ID,
                (product, category) => product).Where(c => c.Price != 0).OrderBy(c => Guid.NewGuid()).Take(9);

            return PartialView("_ProductListBlock", model);
        }

        [ChildActionOnly]
        public ActionResult _SuaXachTayChoBeYeu()
        {
            var categories = _iCategoryServices.GetAllCategory().Where(c => c.Parent_ID == 2);
            var products = _iProductServices.GetAllProduct();

            var model = products.Join(categories, product => product.Category_ID, category => category.Category_ID,
                (product, category) => product).Where(c => c.Price != 0).OrderBy(c => Guid.NewGuid()).Take(9);

            return PartialView("_ProductListBlock", model);
        }

        [ChildActionOnly]
        public ActionResult _ThucPhamDinhDuong()
        {
            var categories = _iCategoryServices.GetAllCategory().Where(c => c.Parent_ID == 3);
            var products = _iProductServices.GetAllProduct();

            var model = products.Join(categories, product => product.Category_ID, category => category.Category_ID,
                (product, category) => product).Where(c => c.Price != 0).OrderBy(c => Guid.NewGuid()).Take(9);

            return PartialView("_ProductListBlock", model);
        }

        public ActionResult ViewIndex()
        {
            return View();
        }

        public ActionResult ProductDetail(int id = 1)
        {
            var product = _iProductServices.GetProductById(id);
            var sameProducts =
                _db.Products.Where(p => p.Category_ID == product.Category_ID && p.Price != 0 && p.Price != 1).OrderBy(c => Guid.NewGuid()).Take(6);
            var result = new ProductViewModel { Product = product };
            result.SameProducts = new List<Product>(sameProducts);
            return View(result);
        }

        public ActionResult SearchAJX()
        {
            var name = Request["term"];
            var data = _db.Products.Where(p => p.Name.Contains(name))
                .Select(p => p.Name).ToList();
            return Json(data, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Search(string keywords = "")
        {
            if (keywords != "")
            {
                var model = _db.Products.Where(p => p.Name.Contains(keywords));
                return View(model);
            }
            return View(_db.Products);
        }





    






      
   
    }

}