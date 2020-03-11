using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TestEntrepidus.Engine
{
    public class EngineProject
    {
        public Administrator SetAdministrator(string name, string lastName, string user, string password)
        {
            Administrator adm = new Administrator()
            {
                FirstName = name,
                Lastname = lastName,
                Username = user,
                Password = password,
                CreateDate = DateTime.UtcNow
            };
            return adm;
        }


        public void  CreateGalleta()
        {
            if (HttpContext.Current.Request.Cookies["Entrepidus"] == null)
            {
                HttpCookie MyId = new HttpCookie("Entrepidus");
                MyId.Value = EngineTool.ConvertirBase64(System.Web.HttpContext.Current.Session["User"].ToString());
                MyId.Expires = DateTime.UtcNow.Date.AddDays(1);
                HttpContext.Current.Response.Cookies.Add(MyId);
            }
            else
            {
                HttpCookie cookie = HttpContext.Current.Request.Cookies["Entrepidus"];
                DateTime expireDate = cookie.Expires;
                if (DateTime.UtcNow.Date > expireDate)
                {
                    HttpCookie MyId = new HttpCookie("Entrepidus");
                    MyId.Expires = DateTime.UtcNow.AddDays(1);
                    MyId.Value = EngineTool.ConvertirBase64(System.Web.HttpContext.Current.Session["User"].ToString());
                    HttpContext.Current.Response.Cookies.Add(MyId);
                   // HttpContext.Current.Response.SetCookie(MyId);
                    //HttpContext.Current.Response.Flush();
                }
            }
        }

        public void GetGalleta()
        {
            if (HttpContext.Current.Request.Cookies["Entrepidus"] != null )
            {
                HttpCookie MyId = HttpContext.Current.Request.Cookies["Entrepidus"];
                DateTime expireDate = MyId.Expires;
                if (DateTime.UtcNow.Date > expireDate)
                {
                    System.Web.HttpContext.Current.Session["User"] = null;
                }
                else
                {
                    System.Web.HttpContext.Current.Session["User"] = EngineTool.DecodeBase64(MyId.Value);
                }
            }
        }

        public void RemoveLogin()
        {
            if (HttpContext.Current.Request.Cookies["Entrepidus"] != null)
            {
                HttpCookie MyId = HttpContext.Current.Request.Cookies["Entrepidus"];
                MyId.Expires = DateTime.UtcNow.Date.AddDays(-3);
                MyId.Value = EngineTool.ConvertirBase64(System.Web.HttpContext.Current.Session["User"].ToString());
                HttpContext.Current.Response.Cookies.Add(MyId);
                //HttpContext.Current.Response.SetCookie(MyId);
                //HttpContext.Current.Response.Flush();
                
            }
        }

    }
}