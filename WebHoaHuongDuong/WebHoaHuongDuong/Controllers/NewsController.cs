using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DataModel;

namespace WebHoaHuongDuong.Controllers
{
    [Authorize(Roles = "Administrator")]
    public class NewsController : Controller
    {
        private WebHoaHuongDuongDBEntities db = new WebHoaHuongDuongDBEntities();

        //
        // GET: /News/

        public ActionResult Index()
        {
            return View(db.News.ToList());
        }

        [AllowAnonymous]
        public ActionResult ViewIndex()
        {
            var model = db.News;
            return View(model);
        }

        [AllowAnonymous]
        public ActionResult ViewDetail(int id)
        {
            var model = db.News.Find(id);
            return View(model);
        }


        [AllowAnonymous]
        public ActionResult HotestNew()
        {
            var model = db.News.OrderBy(c => c.Views).Take(6);
            return PartialView("_TinNoiBat", model);
        }

        [AllowAnonymous]
        public ActionResult NewestNew()
        {
            var model = db.News.OrderBy(c => c.DateUpload).Take(6);
            return PartialView("_TinTucMoi", model);
        }

        [AllowAnonymous]
        public ActionResult RandomNew()
        {
            var model = db.News.OrderBy(c => Guid.NewGuid()).Take(6);
            return PartialView("_TinTucNgauNhien", model);
        }
        //
        // GET: /News/Details/5

        public ActionResult Details(int id = 0)
        {
            News news = db.News.Find(id);
            if (news == null)
            {
                return HttpNotFound();
            }
            return View(news);
        }

        //
        // GET: /News/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /News/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(News news)
        {
            if (ModelState.IsValid)
            {
                db.News.Add(news);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(news);
        }

        //
        // GET: /News/Edit/5

        public ActionResult Edit(int id = 0)
        {
            News news = db.News.Find(id);
            if (news == null)
            {
                return HttpNotFound();
            }
            return View(news);
        }

        //
        // POST: /News/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(News news)
        {
            if (ModelState.IsValid)
            {
                db.Entry(news).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(news);
        }

        //
        // GET: /News/Delete/5

        public ActionResult Delete(int id = 0)
        {
            News news = db.News.Find(id);
            if (news == null)
            {
                return HttpNotFound();
            }
            return View(news);
        }

        //
        // POST: /News/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            News news = db.News.Find(id);
            db.News.Remove(news);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}