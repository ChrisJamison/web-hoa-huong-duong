using System.Linq;
using System.Web.Mvc;
using BusinessEntities;
using BusinessServices;
using WebHoaHuongDuong.Filters;

namespace WebHoaHuongDuong.Areas.Admin.Controllers
{
    [AuthorizeFilterHelper]
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
