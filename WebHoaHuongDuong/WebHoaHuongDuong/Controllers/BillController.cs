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
    public class BillController : Controller
    {
        private WebHoaHuongDuongDBEntities db = new WebHoaHuongDuongDBEntities();

        //
        // GET: /Bill/

        public ActionResult Index()
        {
            var bills = db.Bills.Include(b => b.Cart);
            return View(bills.ToList());
        }

        //
        // GET: /Bill/Details/5

        public ActionResult Details(int id = 0)
        {
            Bill bill = db.Bills.Find(id);
            if (bill == null)
            {
                return HttpNotFound();
            }
            return View(bill);
        }

        //
        // GET: /Bill/Create

        public ActionResult Create()
        {
            ViewBag.Cart_ID = new SelectList(db.Carts, "Cart_ID", "Cart_ID");
            return View();
        }

        //
        // POST: /Bill/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Bill bill)
        {
            if (ModelState.IsValid)
            {
                db.Bills.Add(bill);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Cart_ID = new SelectList(db.Carts, "Cart_ID", "Cart_ID", bill.Cart_ID);
            return View(bill);
        }

        //
        // GET: /Bill/Edit/5

        public ActionResult Edit(int id = 0)
        {
            Bill bill = db.Bills.Find(id);
            if (bill == null)
            {
                return HttpNotFound();
            }
            ViewBag.Cart_ID = new SelectList(db.Carts, "Cart_ID", "Cart_ID", bill.Cart_ID);
            return View(bill);
        }

        //
        // POST: /Bill/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Bill bill)
        {
            if (ModelState.IsValid)
            {
                db.Entry(bill).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Cart_ID = new SelectList(db.Carts, "Cart_ID", "Cart_ID", bill.Cart_ID);
            return View(bill);
        }

        //
        // GET: /Bill/Delete/5

        public ActionResult Delete(int id = 0)
        {
            Bill bill = db.Bills.Find(id);
            if (bill == null)
            {
                return HttpNotFound();
            }
            return View(bill);
        }

        //
        // POST: /Bill/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Bill bill = db.Bills.Find(id);
            db.Bills.Remove(bill);
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