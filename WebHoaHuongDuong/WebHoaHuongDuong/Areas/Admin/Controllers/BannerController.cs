using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DataModel;

namespace WebHoaHuongDuong.Areas.Admin.Controllers
{
    public class BannerController : Controller
    {
        private WebHoaHuongDuongDBEntities db = new WebHoaHuongDuongDBEntities();

        //
        // GET: /Admin/Banner/

        public ActionResult Index()
        {
            return View(db.Banners.ToList());
        }

        //
        // GET: /Admin/Banner/Details/5

        public ActionResult Details(int id = 0)
        {
            Banner banner = db.Banners.Find(id);
            if (banner == null)
            {
                return HttpNotFound();
            }
            return View(banner);
        }

        //
        // GET: /Admin/Banner/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Admin/Banner/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Banner banner)
        {
            if (ModelState.IsValid)
            {
                db.Banners.Add(banner);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(banner);
        }

        //
        // GET: /Admin/Banner/Edit/5

        public ActionResult Edit(int id = 0)
        {
            Banner banner = db.Banners.Find(id);
            if (banner == null)
            {
                return HttpNotFound();
            }
            return View(banner);
        }

        //
        // POST: /Admin/Banner/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Banner banner)
        {
            if (ModelState.IsValid)
            {
                db.Entry(banner).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(banner);
        }

        //
        // GET: /Admin/Banner/Delete/5

        public ActionResult Delete(int id = 0)
        {
            Banner banner = db.Banners.Find(id);
            if (banner == null)
            {
                return HttpNotFound();
            }
            return View(banner);
        }

        //
        // POST: /Admin/Banner/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Banner banner = db.Banners.Find(id);
            db.Banners.Remove(banner);
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