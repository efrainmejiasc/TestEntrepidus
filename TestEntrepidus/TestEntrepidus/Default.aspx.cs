using Newtonsoft.Json;
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
    public partial class Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        [WebMethod]
        public static string  LoginUser(string user , string password, string session)
        {
            ResponseWM response = new ResponseWM();
            password = EngineTool.ConvertirBase64(user + password);
            EngineDb Method = new EngineDb();
            bool result = Method.LoginUser(user, password);
            if (result)
            {
                System.Web.HttpContext.Current.Session["User"] = user;
                if (session == "si")
                {
                    EngineProject Function = new EngineProject();
                    Function.CreateGalleta();
                }
                response.Description = "Autentificacion Exitosa";
                response.Result = true;
            }
            else
            {
                response.Description = "Autentificacion Fallida";
                response.Result = false;
                System.Web.HttpContext.Current.Session["User"] = null;
            }
            return JsonConvert.SerializeObject(response);
        }

        [WebMethod]
        public static string RemoveLogin()
        {
            EngineProject Function = new EngineProject();
            Function.RemoveLogin();
            System.Web.HttpContext.Current.Session["User"] = null;
            ResponseWM response = new ResponseWM();
            response.Description = "Sesion cerrada";
            response.Result = true;
        
            return JsonConvert.SerializeObject(response);
        }

    }
}