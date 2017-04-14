using System;
using System.Linq;
using System.Web.Mvc;
using DataModel;

namespace WebHoaHuongDuong.Controllers
{
    public class NewsController : Controller
    {
        private WebHoaHuongDuongDBEntities db = new WebHoaHuongDuongDBEntities();

        public ActionResult ViewIndex()
        {
            var model = db.News;
            return View(model);
        }

        public ActionResult ViewDetail(int id)
        {
            var model = db.News.Find(id);
            return View(model);
        }

        public ActionResult HotestNew()
        {
            var model = db.News.OrderBy(c => c.Views).Take(6);
            return PartialView("_TinNoiBat", model);
        }

        public ActionResult NewestNew()
        {
            var model = db.News.OrderBy(c => c.DateUpload).Take(6);
            return PartialView("_TinTucMoi", model);
        }

        public ActionResult RandomNew()
        {
            var model = db.News.OrderBy(c => Guid.NewGuid()).Take(6);
            return PartialView("_TinTucNgauNhien", model);
        }
        
    }
}