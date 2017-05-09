using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Transactions;
using System.Web;
using System.Web.Mvc;
using BusinessEntities;
using DataModel;
using WebHoaHuongDuong.AppConstants;
using WebHoaHuongDuong.Helpers;
using WebHoaHuongDuong.Models;

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
            var billId = System.Web.HttpContext.Current.Session["BillId"];
            if (billId == null && step != WellknownConstant.Checkout)
            {
                return View(checkout);
            }

            if (billId != null) checkout.billId = Convert.ToInt32(billId);
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
                var customer = _db.Customers.FirstOrDefault(c => c.IdentifyCardNumber == (string)customerGuid);
                if (customer != null)
                {
                    using (var scope = new TransactionScope())
                    {
                        customer.FirstName = model.fullname;
                        customer.Phone = model.phone;
                        customer.Address = String.Format("{0}, {1}, {2}, {3}", model.address, model.ward, model.district,
                            model.province);
                        customer.LastDateAccess = DateTime.Now;
                        _db.Entry(customer).State = EntityState.Modified;

                        //Save Cart to database
                        var cart = new Cart();
                        cart.Customer_ID = customer.Customer_ID;
                        cart.DateOfCreation = DateTime.Now;
                        _db.Carts.Add(cart);
                        _db.SaveChanges();
                        //Save Cart Detail
                        var listCartDetail = new List<CartDetail>();
                        foreach (var item in ShoppingCart.Cart.Items)
                        {
                            var cartDetail = new CartDetail();
                            cartDetail.Product_ID = item.Product_ID;
                            cartDetail.Quantity = item.NumberInStock;
                            cartDetail.Cart_ID = cart.Cart_ID;
                            listCartDetail.Add(cartDetail);
                        }
                        foreach (var item in listCartDetail)
                        {
                            _db.CartDetails.Add(item);
                        }

                        //Create Bill
                        var bill = new Bill();
                        bill.Cart_ID = cart.Cart_ID;
                        bill.DateOfCreation = DateTime.Now;
                        bill.isPayed = false;
                        bill.isOrdered = false;
                        bill.BillTotal = decimal.Parse(ShoppingCart.Cart.Total.ToString());
                        _db.Bills.Add(bill);
                        _db.SaveChanges();
                        System.Web.HttpContext.Current.Session["BillId"] = bill.Bill_ID;
                        scope.Complete();
                        return RedirectToAction("Step", new { step = WellknownConstant.Checkout});
                    }
                }

            }
            return RedirectToAction("Step", new { step = WellknownConstant.Information });
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult SubmitOrder(int billId)
        {
            using (var scope = new TransactionScope())
            {
                var bill = _db.Bills.Find(billId);
                if (bill != null)
                {
                    bill.isOrdered = true;
                    _db.Entry(bill).State = EntityState.Modified;
                }
                _db.SaveChanges();
                string mailbody = System.IO.File.ReadAllText(System.Web.HttpContext.Current.Server.MapPath("~/Template/OrderTemplate.html"));
                mailbody = mailbody.Replace("[Fullname]", bill.Cart.Customer.FirstName);
                mailbody = mailbody.Replace("[PhoneNumber]", bill.Cart.Customer.Phone);
                mailbody = mailbody.Replace("[Email]", bill.Cart.Customer.Email);
                mailbody = mailbody.Replace("[Address]", bill.Cart.Customer.Address);
                mailbody = mailbody.Replace("[Amount]", bill.BillTotal.ToString());
                string linkDetail = System.Web.HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority) +
                                    "/Admin/Order/Details/" + billId;
                mailbody = mailbody.Replace("[Link]", linkDetail);

                ApplicationHelper.GoogleMail(ConfigurationManager.AppSettings["ToEmail"], WellknownConstant.EmailTitle, mailbody, ConfigurationManager.AppSettings["Email"], ConfigurationManager.AppSettings["Password"]);
                System.Web.HttpContext.Current.Session.Remove("UserGuid");
                System.Web.HttpContext.Current.Session.Remove("Cart");
                System.Web.HttpContext.Current.Session.Remove("BillId");
                scope.Complete();
                return RedirectToAction("OrderSuccess");
            }          
        }

        public ActionResult OrderSuccess()
        {
            return View("Success");
        }
    }
}
