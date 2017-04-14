using System;
using System.Configuration;
using System.Transactions;
using System.Web.Mvc;
using DataModel;
using WebHoaHuongDuong.AppConstants;
using WebHoaHuongDuong.Helpers;

namespace WebHoaHuongDuong.Controllers
{
    public class ContactController : Controller
    {
        private readonly WebHoaHuongDuongDBEntities _db = new WebHoaHuongDuongDBEntities();
        public ActionResult Index()
        {
            var model = new Contact();
            return View(model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult SubmitContact(Contact model)
        {
            if (ModelState.IsValid)
            {
                model.CreatedDate = DateTime.Now;
                using (var scope = new TransactionScope())
                {
                    string mailbody = System.IO.File.ReadAllText(System.Web.HttpContext.Current.Server.MapPath("~/Template/MailTemplate.html"));
                    mailbody = mailbody.Replace("[Fullname]", model.Fullname);
                    mailbody = mailbody.Replace("[PhoneNumber]", model.PhoneNumber);
                    mailbody = mailbody.Replace("[Email]", model.Email);
                    mailbody = mailbody.Replace("[Address]", model.Address);
                    mailbody = mailbody.Replace("[Content]", model.Content);

                    ApplicationHelper.GoogleMail(ConfigurationManager.AppSettings["ToEmail"], WellknownConstant.EmailTitle, mailbody, ConfigurationManager.AppSettings["Email"], ConfigurationManager.AppSettings["Password"]);
                    _db.Contacts.Add(model);
                    _db.SaveChanges();
                    scope.Complete();
                }
            }

            return RedirectToAction("Index", model);
        }
    }
}
