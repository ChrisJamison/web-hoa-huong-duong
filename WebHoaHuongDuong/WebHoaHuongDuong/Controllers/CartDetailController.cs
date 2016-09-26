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
    public class CartDetailController : Controller
    {
        private WebHoaHuongDuongDBEntities db = new WebHoaHuongDuongDBEntities();
        private readonly IProductServices _iProductServices;
        private readonly ICartDetailServices _iCartDetailServices;

        public CartDetailController(ICartDetailServices iCartDetailServices, IProductServices iProductServices)
        {
            this._iCartDetailServices = iCartDetailServices;
            this._iProductServices = iProductServices;
        }
        //
        // GET: /CartDetail/

        public ActionResult Index()
        {
            var cartdetails = db.CartDetails.Include(c => c.Cart).Include(c => c.Product);
            return View(cartdetails.ToList());
        }

        //public void AdToCard(ProductEntity product)
        //{
        //    var cartItem = _iCartDetailServices.GetAllCartDetail().Where(c => 
        //}
        //
        // GET: /CartDetail/Details/5

        public ActionResult Details(int id = 0)
        {
            CartDetail cartdetail = db.CartDetails.Find(id);
            if (cartdetail == null)
            {
                return HttpNotFound();
            }
            return View(cartdetail);
        }

        //
        // GET: /CartDetail/Create

        public ActionResult Create()
        {
            ViewBag.Cart_ID = new SelectList(db.Carts, "Cart_ID", "Cart_ID");
            ViewBag.Product_ID = new SelectList(db.Products, "Product_ID", "Name");
            return View();
        }

        //
        // POST: /CartDetail/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(CartDetail cartdetail)
        {
            if (ModelState.IsValid)
            {
                db.CartDetails.Add(cartdetail);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Cart_ID = new SelectList(db.Carts, "Cart_ID", "Cart_ID", cartdetail.Cart_ID);
            ViewBag.Product_ID = new SelectList(db.Products, "Product_ID", "Name", cartdetail.Product_ID);
            return View(cartdetail);
        }

        //
        // GET: /CartDetail/Edit/5

        public ActionResult Edit(int id = 0)
        {
            CartDetail cartdetail = db.CartDetails.Find(id);
            if (cartdetail == null)
            {
                return HttpNotFound();
            }
            ViewBag.Cart_ID = new SelectList(db.Carts, "Cart_ID", "Cart_ID", cartdetail.Cart_ID);
            ViewBag.Product_ID = new SelectList(db.Products, "Product_ID", "Name", cartdetail.Product_ID);
            return View(cartdetail);
        }

        //
        // POST: /CartDetail/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(CartDetail cartdetail)
        {
            if (ModelState.IsValid)
            {
                db.Entry(cartdetail).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Cart_ID = new SelectList(db.Carts, "Cart_ID", "Cart_ID", cartdetail.Cart_ID);
            ViewBag.Product_ID = new SelectList(db.Products, "Product_ID", "Name", cartdetail.Product_ID);
            return View(cartdetail);
        }

        //
        // GET: /CartDetail/Delete/5

        public ActionResult Delete(int id = 0)
        {
            CartDetail cartdetail = db.CartDetails.Find(id);
            if (cartdetail == null)
            {
                return HttpNotFound();
            }
            return View(cartdetail);
        }

        //
        // POST: /CartDetail/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            CartDetail cartdetail = db.CartDetails.Find(id);
            db.CartDetails.Remove(cartdetail);
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