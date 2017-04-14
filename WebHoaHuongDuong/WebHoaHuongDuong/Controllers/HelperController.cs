using BusinessServices;
using System;
using System.Linq;
using System.Web.Mvc;

namespace WebHoaHuongDuong.Controllers
{
    public class HelperController : Controller
    {
        private readonly ICategoryServices _iCategoryServices;
        private readonly IProductServices _iProductServices;
        public HelperController(ICategoryServices iCategoryServices, IProductServices iProductServices)
        {
            _iCategoryServices = iCategoryServices;
            _iProductServices = iProductServices;
        }

        [ChildActionOnly]
        public ActionResult _LeftMenu()
        {
            Menu menu = new Menu();
            menu.GetCategoryLevel1 = _iCategoryServices.GetAllCategory().Where(c => c.Parent_ID == 0);
            menu.GetCategoryLevel2 = _iCategoryServices.GetAllCategory().Where(c => c.Level == 2);
            menu.GetCategoryLevel3 = _iCategoryServices.GetAllCategory().Where(c => c.Level == 3);
            return PartialView("_LeftMenu",menu);
        }

        [ChildActionOnly]
        public ActionResult _TopMenu()
        {
            Menu menu = new Menu();
            menu.GetCategoryLevel1 = _iCategoryServices.GetAllCategory().Where(c => c.Parent_ID == 0);
            return PartialView("_TopMenu", menu);
        }

        [ChildActionOnly]
        public ActionResult _SanPhamMoi()
        {
            var model = _iProductServices.GetAllProduct().Where(c => c.Price != 0).OrderBy(c => c.DateUpdate).ThenBy(c => Guid.NewGuid()).Take(3);
            return PartialView("_SanPham", model);
        }

        [ChildActionOnly]
        public ActionResult _SanPhamNoiBat()
        {
            var model = _iProductServices.GetAllProduct().Where(c => c.Price != 0).OrderBy(c => c.Price).ThenBy(c => Guid.NewGuid()).Take(3);
            return PartialView("_SanPham", model);
        }

        [ChildActionOnly]
        public ActionResult _SanPhamNgauNhien()
        {
            var model = _iProductServices.GetAllProduct().Where(c => c.Price != 0).OrderBy(c => Guid.NewGuid()).Take(3);
            return PartialView("_SanPham", model);
        }

    }
}
