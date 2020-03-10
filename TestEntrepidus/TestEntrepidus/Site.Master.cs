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
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                EngineProject Funcion = new EngineProject();
                Funcion.GetGalleta();
            }
            if (System.Web.HttpContext.Current.Session["User"] != null)
            {
                userName.InnerText = System.Web.HttpContext.Current.Session["User"].ToString();
                logSession.InnerText = "Cerrar Session";
            }
        }

    }
}