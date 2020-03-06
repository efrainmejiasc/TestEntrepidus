using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using TestEntrepidus.Engine;
using TestEntrepidus.Models;

namespace TestEntrepidus
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        [WebMethod]
        public static string  LoginUser(string user, string password)
        {
            ResponseWM response = new ResponseWM();

            EngineDb Metodo = new EngineDb();
            if (!string.IsNullOrEmpty(""))
            {
                response.Description = "Autentificacion Exitosa";
                response.Result = true;
                System.Web.HttpContext.Current.Session["User"] = "";
                System.Web.HttpContext.Current.Session["Email"] = "";
                System.Web.HttpContext.Current.Session["AccessToken"] = "";
            }
            else
            {
                response.Description = "Autentificacion Fallida";
                response.Result = false;
                System.Web.HttpContext.Current.Session["User"] = null;
                System.Web.HttpContext.Current.Session["Email"] = null;
                System.Web.HttpContext.Current.Session["AccessToken"] = null;
            }
            return "";
        }
    }
}