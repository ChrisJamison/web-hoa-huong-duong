using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.Services;
using AutoMapper;
using DataModel;
using BusinessEntities;
using Newtonsoft.Json.Serialization;
using WebMatrix.WebData;

namespace WebHoaHuongDuong
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801

    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            WebSecurity.InitializeDatabaseConnection("DefaultConnection", "UserProfile", "UserId", "UserName", autoCreateTables: true);
          /*  WebApiConfig.Register(GlobalConfiguration.Configuration);*/
            GlobalConfiguration.Configure(WebApiConfig.Register);
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
            AuthConfig.RegisterAuth();
            CreateMaps();
        }

        protected void CreateMaps()
        {
            Mapper.CreateMap<Product, ProductEntity>();
            Mapper.CreateMap<ProductEntity, Product>();

            Mapper.CreateMap<Category, CategoryEntity>();
            Mapper.CreateMap<CategoryEntity, Category>();

        }
    }
}