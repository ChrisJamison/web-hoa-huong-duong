using DataModel;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebHoaHuongDuong.Models
{
    public class ShoppingCart
    {
        // Lấy giỏ hàng từ Session
        public static ShoppingCart Cart
        {
            get
            {
                var cart = HttpContext.Current.Session["Cart"] as ShoppingCart;
                // Nếu chưa có giỏ hàng trong session -> tạo mới và lưu vào session
                if (cart == null)
                {
                    cart = new ShoppingCart();
                    HttpContext.Current.Session["Cart"] = cart;
                }
                return cart;
            }
        }

        // Chứa các mặt hàng đã chọn
        public List<Product> Items = new List<Product>();

        public void Add(int id)
        {
            try // tìm thấy trong giỏ -> tăng số lượng lên 1
            {
                var item = Items.Single(i => i.Product_ID == id);
                item.NumberInStock++;
            }
            catch // chưa có trong giỏ -> truy vấn CSDL và bỏ vào giỏ
            {
                var db = new WebHoaHuongDuongDBEntities();
                var item = db.Products.Find(id);
                item.NumberInStock = 1;
                Items.Add(item);
            }
        }

        public void Remove(int id)
        {
            var item = Items.Single(i => i.Product_ID == id);
            Items.Remove(item);
        }

        public void Update(int id, int newQuantity)
        {
            var item = Items.Single(i => i.Product_ID == id);
            item.NumberInStock = newQuantity;
        }

        public void Clear()
        {
            Items.Clear();
        }

        public int Count
        {
            get
            {
                return Items.Count;
            }
        }

        public double Total
        {
            get
            {
                var sum = Items.Sum(p =>
                    p.Price * p.NumberInStock );
                if (sum != null)
                    return (double) sum;
                return 0;
            }
        }
    }
}