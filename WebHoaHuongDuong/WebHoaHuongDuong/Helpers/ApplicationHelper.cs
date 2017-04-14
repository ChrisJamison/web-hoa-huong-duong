using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;

namespace WebHoaHuongDuong.Helpers
{
    public static class ApplicationHelper
    {
        public static void GoogleMail(string mailto, string title, string body, string myEmail, string myPassword)
        {
            string smtpAddress = "smtp.gmail.com";
            int portNumber = 25;
            bool enableSSL = true;

            using (MailMessage mail = new MailMessage())
            {
                mail.From = new MailAddress(myEmail);
                mail.To.Add(mailto);
                mail.Subject = title;
                mail.Body = body;
                mail.IsBodyHtml = true;

                using (SmtpClient smtp = new SmtpClient(smtpAddress, portNumber))
                {
                    smtp.Credentials = new NetworkCredential(myEmail, myPassword);
                    smtp.EnableSsl = enableSSL;
                    smtp.Send(mail);
                }
            }
        }
    }
}