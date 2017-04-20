using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BusinessEntities;
using DataModel;
using WebHoaHuongDuong.AppConstants;

namespace WebHoaHuongDuong.Controllers
{
    public class OrderController : Controller
    {
        private readonly WebHoaHuongDuongDBEntities _db = new WebHoaHuongDuongDBEntities();
        //
        // GET: /Order/

        public ActionResult Step(string step)
        {
            var checkout = new CheckoutEntity();
            checkout.step = step;
            return View(checkout);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Registration(CustomerEntity model)
        {
            if (ModelState.IsValidField("email"))
            {
                var customer = new Customer();
                customer.Email = model.Email;
                customer.IdentifyCardNumber = "test";
                _db.Customers.Add(customer);
                _db.SaveChanges();
                return RedirectToAction("Step", new { step = WellknownConstant.Information });
            }
            return RedirectToAction("Step", new { step = WellknownConstant.Registration});
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Information(CustomerEntity model)
        {
            if (ModelState.IsValid)
            {

            }
            return RedirectToAction("Step", new { step = WellknownConstant.Information });
        }
    }
}
