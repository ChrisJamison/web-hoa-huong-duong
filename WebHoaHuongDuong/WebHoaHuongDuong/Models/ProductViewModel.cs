using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BusinessEntities;
using DataModel;

namespace WebHoaHuongDuong.Models
{
    public class ProductViewModel
    {
        public ProductEntity Product { get; set; }
        public List<Product> SameProducts { get; set; }
    }
}