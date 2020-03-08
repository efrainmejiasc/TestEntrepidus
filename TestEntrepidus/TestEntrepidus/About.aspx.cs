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
    public partial class About : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        [WebMethod]
        public static string CreateAdministrator (string name , string lastName , string user, string password)
        {
            ResponseWM response = new ResponseWM();
            response.Description = "Fallo crear administrador";
            response.Result = false;
            try
            {
                password = EngineTool.ConvertirBase64(user + password);
                EngineProject Funcion = new EngineProject();
                Administrator adm = Funcion.SetAdministrator(name, lastName, user, password);
                EngineDb Metodo = new EngineDb();
                bool result = Metodo.CreateAdministrator(adm);
                if (result)
                {
                    response.Description = "Administrador creado satisfactoriamente";
                    response.Result = true;
                }
            }
            catch { }
         
            return JsonConvert.SerializeObject(response);
        }

    }
}