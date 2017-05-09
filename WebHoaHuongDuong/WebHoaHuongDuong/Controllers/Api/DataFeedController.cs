using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Web.Hosting;
using System.Web.Http;
using System.Web.Routing;
using DataModel;
using WebHoaHuongDuong.WssDataFeed;

namespace WebHoaHuongDuong.Controllers.Api
{
    public class DataFeedController : ApiController
    {
        private readonly WebHoaHuongDuongDBEntities _db = new WebHoaHuongDuongDBEntities();

        [Route("api/DataFeed/ExportDataFeed")]
        [HttpGet]
        public HttpResponseMessage ExportDataFeed()
        {
            var products = XmlSerialize.Serialize(GetProducts());
            return new HttpResponseMessage()
            {
                Content = new StringContent(products, Encoding.UTF8, "application/xml")
            };
            //return Request.CreateResponse(HttpStatusCode.OK, products);
        }

        public WssDataFeed.Product MapProduct(DataModel.Product productEntity)
        {
            WssDataFeed.Product product = new WssDataFeed.Product();
            product.AvailabilityInstock = "1";
            product.Brand = string.Empty;
            product.ProductName = productEntity.Name ?? string.Empty;
            product.Description = productEntity.Description != null ? Functions.StripHTML(productEntity.Description).Trim() : String.Empty;
            product.Currency = "VNĐ";
            product.Price = String.Format("{0:N0}",productEntity.Price);//Functions.FormatPriceVN(product.Price);
            product.Discount = "0";
            product.DiscountedPrice = String.Format("{0:N0}", productEntity.Price);
            product.ParentOfCat1 = String.Empty;
            product.Category1 = productEntity.Category.Name;
            product.PictureUrl = productEntity.Image != null ? /*System.Web.HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority) + */"http://sunflowershop.vn/" + productEntity.Image : string.Empty;
            product.PictureUrl2 = string.Empty;
            product.Promotion = string.Empty;
            product.URL = "http://sunflowershop.vn/Product/ProductDetail/" + productEntity.Product_ID;
            product.VatStatus = "1";
            return product;
        }

        public List<WssDataFeed.Product> GetProducts()
        {
            List<WssDataFeed.Product> products = new List<WssDataFeed.Product>();
            var data =
                _db.Products.Where(
                    x =>
                        (x.Price != 0 && x.Price != 1 && x.Image != String.Empty && x.Description != String.Empty &&
                         x.Name != String.Empty));
            foreach (var item in data)
            {
                products.Add(MapProduct(item));
            }
            return products;
        }
    }
}
