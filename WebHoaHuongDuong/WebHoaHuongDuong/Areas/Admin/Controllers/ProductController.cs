using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using BusinessEntities;
using BusinessServices;
using DataModel;
using Microsoft.Office.Interop.Excel;
using PagedList;
using WebHoaHuongDuong.Filters;
using WebHoaHuongDuong.Helpers;

namespace WebHoaHuongDuong.Areas.Admin.Controllers
{
    [AuthorizeFilterHelper]
    public class ProductController : Controller
    {
        private WebHoaHuongDuongDBEntities db = new WebHoaHuongDuongDBEntities();
        private readonly IProductServices _iProductServices;
        private readonly ICategoryServices _iCategoryServices;

        public ProductController(IProductServices iProductServices, ICategoryServices iCategoryServices)
        {
            _iProductServices = iProductServices;
            _iCategoryServices = iCategoryServices;
        }

        // GET: /Product/
        public ActionResult Index(string sortOrder, string currentFilter, string searchString, int? page)
        {
            ViewBag.CurrentSort = sortOrder;
            ViewBag.NameSortParm = sortOrder == "name" ? "name_desc" : "name";
            ViewBag.DateSortParm = sortOrder == "Date" ? "date_desc" : "Date";
            if (searchString != null)
            {
                page = 1;
            }
            else
            {
                searchString = currentFilter;
            }

            ViewBag.CurrentFilter = searchString;
            var result = _iProductServices.GetAllProduct();

            if (!string.IsNullOrEmpty(searchString))
            {
                result = result.Where(s => CharacterHelper.MapUnicodeToAscii(s.Name.ToLower()).Contains(CharacterHelper.MapUnicodeToAscii(searchString.ToLower()))).ToList();
            }

            switch (sortOrder)
            {
                case "date_desc":
                    result = result.OrderByDescending(s => s.DateUpdate).ToList();
                    break;
                case "Date":
                    result = result.OrderBy(s => s.DateUpdate).ToList();
                    break;
                default:
                    result = result.OrderByDescending(s => s.DateUpdate).ToList();
                    break;
            }
            const int pageSize = 10;
            var pageNumber = (page ?? 1);
            return View(result.ToPagedList(pageNumber, pageSize));
        }

        // GET: /Product/Details/5
        public ActionResult Details(int id = 0)
        {
            ProductEntity product = _iProductServices.GetProductById(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        // GET: /Product/Create
        public ActionResult Create()
        {
            var category = _iCategoryServices.GetAllCategory();
            ViewBag.Category_ID = new SelectList(category, "Category_ID", "Name");
            return View();
        }

        // POST: /Product/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(ProductEntity productEntity)
        {
            if (ModelState.IsValid)
            {
                productEntity.Image = "Images/sanpham/sanphammoi/" + productEntity.Image;
                productEntity.DateUpload = DateTime.Now;
                productEntity.DateUpdate = DateTime.Now;
                _iProductServices.CreateProduct(productEntity);
                return RedirectToAction("Index");
            }
            var category = _iCategoryServices.GetAllCategory();
            ViewBag.Category_ID = new SelectList(category, "Category_ID", "Name", productEntity.Category_ID);
            return View(productEntity);
        }

        // GET: /Product/Edit/5
        public ActionResult Edit(int id = 0)
        {
            ProductEntity product = _iProductServices.GetProductById(id);
            var category = _iCategoryServices.GetAllCategory();
            if (product == null)
            {
                return HttpNotFound();
            }
            ViewBag.Category_ID = new SelectList(category, "Category_ID", "Name", product.Category_ID);
            return View(product);
        }

        // POST: /Product/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(ProductEntity productEntity)
        {
            var category = _iCategoryServices.GetAllCategory();
            if (ModelState.IsValid)
            {
                _iProductServices.UpdateProduct(productEntity);
                return RedirectToAction("Index");
            }
            ViewBag.Category_ID = new SelectList(category, "Category_ID", "Name", productEntity.Category_ID);
            return View(productEntity);
        }


        // GET: /Product/Delete/5
        public ActionResult Delete(int id = 0)
        {
            ProductEntity product = _iProductServices.GetProductById(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

   
        // POST: /Product/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            bool success = _iProductServices.DeleteProduct(id);

            if (!success)
            {
                ModelState.AddModelError("error", "delete fail");
                return View();
            }
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }

        public ActionResult Import()
        {
            return View();
        }   
        // POST: reward/upload
        [HttpPost]
        public string Upload(HttpPostedFileBase uploadedFile)
        {

            if (uploadedFile != null && uploadedFile.ContentLength > 0)
            {
                try
                {
                    var fileName = (new Util()).NewGuid() + Path.GetExtension(uploadedFile.FileName);
                    var path = Path.Combine(Server.MapPath("~/Images/sanpham/sanphammoi"), fileName);
                    uploadedFile.SaveAs(path);
                    return fileName;
                }
                catch (Exception ex)
                {
                    //var log = new MHLog();
                    //log.ErrorLog(ex.Message, "Product.Upload");
                    return string.Empty;

                }
            }
            else
            {
                return string.Empty;
            }
        }

        // Read Excel Data from file
        public List<Product> ReadProductFromFile(string filePath)
        {
            // Create an member object that can use the member funtions.
            var excelApp = new Application { Visible = true };

            // Open workbook
            var workbook = excelApp.Workbooks.Open(filePath, Type.Missing, Type.Missing, Type.Missing, Type.Missing,
            Type.Missing, Type.Missing, Type.Missing, Type.Missing,
            Type.Missing, Type.Missing, Type.Missing, Type.Missing,
            Type.Missing, Type.Missing);

            // Select first sheet
            var worksheet = (Worksheet)workbook.Worksheets[3];

            // Find the used range
            var excelRange = worksheet.UsedRange;
            // Get an object array of all cells
            object[,] valueArray = excelRange.get_Value(XlRangeValueDataType.xlRangeValueDefault);
            var productList = new List<Product>();

            for (var row = 2; row <= worksheet.UsedRange.Rows.Count; row++)
            {
                try
                {
                    var product = new Product
                    {
                        Name = valueArray[row, 2].ToString(),
                        Category_ID = Convert.ToInt32(valueArray[row, 3]),
                        Description = valueArray[row, 4].ToString(),
                        URL = valueArray[row, 5].ToString(),
                        Image = valueArray[row, 6].ToString(),
                        DateUpdate = DateTime.Now,
                        DateUpload = DateTime.Now,
                        Price = Convert.ToInt32(valueArray[row, 8]),
                        NumberInStock = Convert.ToInt32(valueArray[row, 9]),
                    };
                    productList.Add(product);
                }
                catch (Exception e)
                {
                    Debug.Print(e.ToString());
                }
            }
            return productList;
        }

        // Clean Up stuffs after reading excel data
        public void CleanUpExcelAccess(Workbook workbook, Application excelApp)
        {
            // Clean up Stuffs
            workbook.Close(false, Type.Missing, Type.Missing);
            Marshal.ReleaseComObject(workbook);

            excelApp.Quit();
            Marshal.FinalReleaseComObject(excelApp);
        }          

    }
}