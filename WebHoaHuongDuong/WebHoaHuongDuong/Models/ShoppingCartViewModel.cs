using DataModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebHoaHuongDuong.Models
{
    public class ShoppingCartViewModel
    {
        public List<CartDetail> CartItems { get; set; }
        public decimal CartTotal { get; set; }
    }
}