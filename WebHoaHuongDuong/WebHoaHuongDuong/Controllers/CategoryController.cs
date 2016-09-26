using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DataModel;
using BusinessServices;
using BusinessEntities;

namespace WebHoaHuongDuong.Controllers
{
    [Authorize(Roles = "Administrator")]
    public class CategoryController : Controller
    {
        private readonly ICategoryServices _iCategoryServices;
        private readonly IProductServices _iProductServices;

        public CategoryController(ICategoryServices iCategoryServices, IProductServices iProductServices)
        {
            this._iCategoryServices = iCategoryServices;
            this._iProductServices = iProductServices;
        }
        //
        // GET: /Category/

        public ActionResult Index()
        {
            var category = _iCategoryServices.GetAllCategory();
            return View(category.ToList());
        }

        [AllowAnonymous]
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
        //
        // GET: /Category/Details/5

        [AllowAnonymous]
        public ActionResult SanPhamMoi()
        {
            var products = _iProductServices.GetAllProduct().OrderBy(c => c.DateUpdate).Where(c => c.Price != 0);
            return View(products);
        }

        [AllowAnonymous]
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

        [AllowAnonymous]
        public ActionResult MyPham()
        {
            var categories = _iCategoryServices.GetAllCategory().Where(c => (c.Parent_ID == 1 || c.Parent_ID == 12));
            var products = _iProductServices.GetAllProduct();

            var model = products.Join(categories, product => product.Category_ID, category => category.Category_ID,
                (product, category) => product).Where(c => c.Price != 0).OrderBy(c => Guid.NewGuid()).Take(6);

            return View(model);
        }

        [AllowAnonymous]
        public ActionResult SuaXachTayChoBeYeu()
        {
            var categories = _iCategoryServices.GetAllCategory().Where(c => c.Parent_ID == 2);
            var products = _iProductServices.GetAllProduct();

            var model = products.Join(categories, product => product.Category_ID, category => category.Category_ID,
                (product, category) => product).Where(c => c.Price != 0).OrderBy(c => Guid.NewGuid()).Take(6);
            return View(model);
        }

        public ActionResult Details(int id = 0)
        {
            CategoryEntity category = _iCategoryServices.GetCategoryById(id);
            if (category == null)
            {
                return HttpNotFound();
            }
            return View(category);
        }

        //
        // GET: /Product/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Product/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(CategoryEntity categoryEntity)
        {
            if (ModelState.IsValid)
            {
                _iCategoryServices.CreateCategory(categoryEntity);
                return RedirectToAction("Index");
            }
            return View(categoryEntity);
        }

        //
        // GET: /Product/Edit/5

        public ActionResult Edit(int id = 0)
        {
            CategoryEntity category = _iCategoryServices.GetCategoryById(id);
            if (category == null)
            {
                return HttpNotFound();
            }
            return View(category);
        }

        //
        // POST: /Product/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(CategoryEntity categoryEntity)
        {
            if (ModelState.IsValid)
            {
                _iCategoryServices.UpdateCategory(categoryEntity);
                return RedirectToAction("Index");
            }
            return View(categoryEntity);
        }

        //
        // GET: /Product/Delete/5

        public ActionResult Delete(int id = 0)
        {
            CategoryEntity category = _iCategoryServices.GetCategoryById(id);
            if (category == null)
            {
                return HttpNotFound();
            }
            return View(category);
        }

        //
        // POST: /Product/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            bool success = _iCategoryServices.DeleteCategory(id);

            if (!success)
            {
                ModelState.AddModelError("error", "delete fail");
                return View();
            }
            return RedirectToAction("Index");
        }

    }
}