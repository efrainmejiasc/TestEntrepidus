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


        private void CreateGalleta()
        {
            if (HttpContext.Current.Request.Cookies["GalletaTestEntrepidus"] == null)
            {
                HttpCookie MiGalletaId = new HttpCookie("GalletaTestEntrepidus");
                MiGalletaId.Value = EngineTool.ConvertirBase64(System.Web.HttpContext.Current.Session["User"].ToString());
                MiGalletaId.Expires = DateTime.UtcNow.AddDays(3);
                HttpContext.Current.Response.Cookies.Add(MiGalletaId);
            }
            else
            {
                HttpCookie MiGalleta = HttpContext.Current.Request.Cookies["GalletaTestEntrepidus"];
                DateTime expire = Convert.ToDateTime(MiGalleta.Expires);
                if (DateTime.UtcNow > expire)
                {
                    HttpCookie MiGalletaId = new HttpCookie("GalletaTestEntrepidus");
                    MiGalletaId.Value = EngineTool.ConvertirBase64(System.Web.HttpContext.Current.Session["User"].ToString());
                    MiGalletaId.Expires = DateTime.UtcNow.AddDays(3);
                    HttpContext.Current.Response.SetCookie(MiGalletaId);
                    HttpContext.Current.Response.Flush();
                }
            }
        }

        public void GetGalleta()
        {
            if (HttpContext.Current.Request.Cookies["GalletaTestEntrepidus"] != null)
            {
                HttpCookie MiGalletaId = HttpContext.Current.Request.Cookies["GalletaTestEntrepidus"];
                HttpCookie MiGalletaExpire = HttpContext.Current.Request.Cookies["GalletaTestEntrepidus"];
                string fechaExpiracion = MiGalletaExpire.Value;
                System.Web.HttpContext.Current.Session["User"] = EngineTool.DecodeBase64(MiGalletaId.Value);
            }
            else
            {
                System.Web.HttpContext.Current.Session["User"] = null;
            }
        }

    }
}