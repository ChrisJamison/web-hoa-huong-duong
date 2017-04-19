using System.Linq;
using System.Web.Mvc;
using BusinessEntities;
using BusinessServices;
using PagedList;
using WebHoaHuongDuong.Filters;
using WebHoaHuongDuong.Helpers;

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

        public ActionResult Index(string sortOrder, string currentFilter, string searchString, int? page)
        {
            ViewBag.CurrentSort = sortOrder;
            ViewBag.NameSortParm = sortOrder == "name" ? "name_desc" : "name";
            ViewBag.DateSortParm = sortOrder == "Date" ? "date_desc" : "Date";
            if (searchString != null)
            {
                page = 1;
            }
            else
            {
                searchString = currentFilter;
            }

            ViewBag.CurrentFilter = searchString;
            var result = _iCategoryServices.GetAllCategory().OrderBy(x => x.Level).ToList();//.Select(x => new { Name = x.Name, ParentName = x}).ToList();
            foreach (var item in result)
            {
                var parent = result.SingleOrDefault(x => item.Parent_ID == x.Category_ID);
                item.ParentName = parent != null ? parent.Name : "Không có danh mục cha";
            }
            if (!string.IsNullOrEmpty(searchString))
            {
                result = result.Where(s => CharacterHelper.MapUnicodeToAscii(s.Name.ToLower()).Contains(CharacterHelper.MapUnicodeToAscii(searchString.ToLower()))).ToList();
            }

            switch (sortOrder)
            {
                case "date_desc":
                    result = result.OrderByDescending(s => s.Date_create).ToList();
                    break;
                case "Date":
                    result = result.OrderBy(s => s.Date_create).ToList();
                    break;
                default:
                    result = result.OrderByDescending(s => s.Date_create).ToList();
                    break;
            }
            const int pageSize = 20;
            var pageNumber = (page ?? 1);
            return View(result.ToPagedList(pageNumber, pageSize));
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
            ViewBag.CategoryDropdown = _iCategoryServices.GetAllCategory().Where(x => x.Level <= 2);
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
                categoryEntity.Parent_ID = categoryEntity.Parent_ID ?? 0;
                switch (categoryEntity.Parent_ID)
                {
                    case 0:
                        categoryEntity.Level = 1;
                        break;
                    default:
                        var parentLevel = _iCategoryServices.GetCategoryById(categoryEntity.Parent_ID.Value).Level;
                        categoryEntity.Level = ++parentLevel;
                        break;
                }

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
            var categoryDropdown = _iCategoryServices.GetAllCategory().Where(x => x.Level <= 2);
            ViewBag.CategoryDropdown = categoryDropdown;
            var categoryList = categoryDropdown.SingleOrDefault(x => category.Parent_ID == x.Category_ID);
            if (categoryList != null)
                category.ParentName = categoryList.Name;
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
                categoryEntity.Parent_ID = categoryEntity.Parent_ID ?? 0;
                switch (categoryEntity.Parent_ID)
                {
                    case 0:
                        categoryEntity.Level = 1;
                        break;
                    default:
                        var parentLevel = _iCategoryServices.GetCategoryById(categoryEntity.Parent_ID.Value).Level;
                        categoryEntity.Level = ++parentLevel;
                        break;
                }
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
