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
            if (!IsPostBack)
            {
              
            }
        }

        [WebMethod]
        public static string  LoginUser(string user , string password, string session)
        {
            ResponseWM response = new ResponseWM();
            password = EngineTool.ConvertirBase64(user + password);
            EngineDb Metodo = new EngineDb();
            bool result = Metodo.LoginUser(user, password);
            if (result)
            {
                response.Description = "Autentificacion Exitosa";
                response.Result = true;
                System.Web.HttpContext.Current.Session["User"] = user;
            }
            else
            {
                response.Description = "Autentificacion Fallida";
                response.Result = false;
                System.Web.HttpContext.Current.Session["User"] = null;
            }
            return JsonConvert.SerializeObject(response);
        }

    }
}