using System;
using System.Collections.Generic;
using System.Data;
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
                customer.IdentifyCardNumber = Guid.NewGuid().ToString();
                _db.Customers.Add(customer);
                _db.SaveChanges();

                System.Web.HttpContext.Current.Session["UserGuid"] = customer.IdentifyCardNumber;
                return RedirectToAction("Step", new { step = WellknownConstant.Information });
            }
            return RedirectToAction("Step", new { step = WellknownConstant.Registration });
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Information(CustomerEntity model)
        {
            ModelState.Remove("email");
            ModelState.Remove("IdentifyCardNumber");
            if (ModelState.IsValid)
            {
                var customerGuid = System.Web.HttpContext.Current.Session["UserGuid"];
                var customer = _db.Customers.FirstOrDefault(c => c.IdentifyCardNumber == (string) customerGuid);
                if (customer != null)
                {
                    customer.FirstName = model.fullname;
                    customer.Phone = model.phone;
                    customer.Address = String.Format("{0}, {1}, {2}, {3}", model.address, model.ward, model.district,
                        model.province);
                    customer.LastDateAccess = DateTime.Now;
                    _db.Entry(customer).State = EntityState.Modified;
                    _db.SaveChanges();
                    return RedirectToAction("Step", new { step = WellknownConstant.Checkout });
                }

            }
            return RedirectToAction("Step", new { step = WellknownConstant.Information });
        }
    }
}
