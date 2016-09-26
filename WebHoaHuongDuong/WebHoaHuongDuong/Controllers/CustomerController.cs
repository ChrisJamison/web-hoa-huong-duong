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
    public class CustomerController : Controller
    {
        private WebHoaHuongDuongDBEntities db = new WebHoaHuongDuongDBEntities();
        private readonly ICustomerServices _iCustomerServices;

        //
        // GET: /Customer/
        public CustomerController(ICustomerServices iCustomerServices)
        {
            this._iCustomerServices = iCustomerServices;
        }

        public ActionResult Index()
        {
            var customers = _iCustomerServices.GetAllCustomer();
            return View(customers.ToList());
        }

        //
        // GET: /Customer/Details/5

        public ActionResult Details(int id = 0)
        {
            CustomerEntity customer = _iCustomerServices.GetCustomerById(id);
            if (customer == null)
            {
                return HttpNotFound();
            }
            return View(customer);
        }

        //
        // GET: /Customer/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Customer/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(CustomerEntity customerEntity)
        {

            if (ModelState.IsValid)
            {
                _iCustomerServices.CreateCustomer(customerEntity);
                return RedirectToAction("Index");
            }

            return View(customerEntity);
        }

        //
        // GET: /Customer/Edit/5

        public ActionResult Edit(int id = 0)
        {
            CustomerEntity customer = _iCustomerServices.GetCustomerById(id);
            if (customer == null)
            {
                return HttpNotFound();
            }
            return View(customer);
        }

        //
        // POST: /Customer/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(CustomerEntity customerEntity)
        {
            if (ModelState.IsValid)
            {
                _iCustomerServices.UpdateCustomer(customerEntity);
                return RedirectToAction("Index");
            }
            return View(customerEntity);
        }

        //
        // GET: /Customer/Delete/5

        public ActionResult Delete(int id = 0)
        {
            Customer customer = db.Customers.Find(id);
            if (customer == null)
            {
                return HttpNotFound();
            }
            return View(customer);
        }

        //
        // POST: /Customer/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Customer customer = db.Customers.Find(id);
            db.Customers.Remove(customer);
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