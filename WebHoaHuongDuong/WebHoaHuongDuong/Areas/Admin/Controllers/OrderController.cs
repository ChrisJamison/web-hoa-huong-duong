using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DataModel;
using PagedList;
using WebHoaHuongDuong.Filters;
using WebHoaHuongDuong.Helpers;

namespace WebHoaHuongDuong.Areas.Admin.Controllers
{
    [AuthorizeFilterHelper]
    public class OrderController : Controller
    {
        private readonly WebHoaHuongDuongDBEntities _db = new WebHoaHuongDuongDBEntities();
        //
        // GET: /Admin/Order/

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
            var result = _db.Bills.Where(x => x.isOrdered).OrderByDescending(x => x.DateOfCreation).ToList();

            if (!string.IsNullOrEmpty(searchString))
            {
                result = result.Where(s => CharacterHelper.MapUnicodeToAscii(s.Cart.Customer.FirstName.ToLower()).Contains(CharacterHelper.MapUnicodeToAscii(searchString.ToLower()))).ToList();
            }

            switch (sortOrder)
            {
                case "date_desc":
                    result = result.OrderByDescending(s => s.DateOfCreation).ToList();
                    break;
                case "Date":
                    result = result.OrderBy(s => s.DateOfCreation).ToList();
                    break;
                default:
                    result = result.OrderByDescending(s => s.DateOfCreation).ToList();
                    break;
            }
            const int pageSize = 20;
            var pageNumber = (page ?? 1);
            return View(result.ToPagedList(pageNumber, pageSize));
        }

        public ActionResult Details(int id)
        {
            var order = _db.Bills.Find(id);
            return View(order);
        }

        public ActionResult UpdateOrderStatus(int id, bool status)
        {
            var order = _db.Bills.Find(id);
            if (order == null) return RedirectToAction("Index");
            order.isPayed = status;
            _db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}
