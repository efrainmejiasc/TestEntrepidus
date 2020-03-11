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
    public partial class EmployeeList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (System.Web.HttpContext.Current.Session["User"] == null)
            {
                Response.Redirect("Default.aspx");
            }
        }


        [WebMethod]
        public static string EmployeeListReady()
        {
            EngineDb Metodo = new EngineDb();
            List<Employee> model = Metodo.GetEmployees();
            return JsonConvert.SerializeObject(model);
        }

        [WebMethod]
        public static string EditEmployee(string id, string name, string lastName, string email )
        {
            ResponseWM response = new ResponseWM();
            EngineDb Metodo = new EngineDb();
            bool result = Metodo.EditEmployee(id ,name, lastName, email);
            if (result)
                response.Result = true;
            else
                response.Result = false;

            return JsonConvert.SerializeObject(response);
        }

        [WebMethod]
        public static string DeleteEmployee (string id)
        {
            ResponseWM response = new ResponseWM();
            EngineDb Metodo = new EngineDb();
            bool result = Metodo.DeleteEmployee(id);
            if (result)
                response.Result = true;
            else
                response.Result = false;

            return JsonConvert.SerializeObject(response);
        }


        [WebMethod]
        public static string ExtendSearchText (string textSearch)
        {
            EngineDb Metodo = new EngineDb();
            List<Employee> model = Metodo.ExtendSearchText(textSearch);
            return JsonConvert.SerializeObject(model);
        }


        [WebMethod]
        public static string ExtendSearchDate(string dateInit)
        {
            ResponseWM response = new ResponseWM();
            EngineDb Metodo = new EngineDb();
            List<Employee> model = Metodo.ExtendSearchDate(Convert.ToDateTime(dateInit));
            return JsonConvert.SerializeObject(model);
        }


        [WebMethod]
        public static string ExtendSearchDate2(string dateInit, string dateEnd)
        {
            ResponseWM response = new ResponseWM();
            EngineDb Metodo = new EngineDb();
            List<Employee> model = Metodo.ExtendSearchDate(Convert.ToDateTime(dateInit), Convert.ToDateTime(dateEnd));

            return JsonConvert.SerializeObject(model);
        }

    }
}