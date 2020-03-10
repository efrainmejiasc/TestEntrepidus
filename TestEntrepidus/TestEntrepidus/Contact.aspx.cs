using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TestEntrepidus.Engine;

namespace TestEntrepidus
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (System.Web.HttpContext.Current.Session["User"] == null)
            {
                Response.Redirect("Default.aspx");
            }
        }

        protected void createEmployee_Click(object sender, EventArgs e)
        {
            string Result = "Fallo registrar empleado";
            try
            {
                string nation = nacionalidad.Value;
                string valueHour = rate.Value.Replace('.', ',');
                bool result = EngineTool.EmailEsValido(email.Text);
                if (!result)
                {
                    Result = "Email no valido";
                }
                else 
                {
                    Employee model = new Employee()
                    {
                        IdentificationNumber = nation + identificationNumber.Text,
                        FirstName = firstName.Text,
                        LastName = lastName.Text,
                        Email = email.Text,
                        Phone = phone.Text,
                        Direccion = direccion.Text,
                        ContractDate = Convert.ToDateTime(contractDate.Value),
                        BirthDate = Convert.ToDateTime(birthDate.Value),
                        FreeLance = freeLance.Checked,
                        Rate = float.Parse(valueHour)
                    };

                    EngineDb Metodo = new EngineDb();
                    result = Metodo.CreateEmployee(model);
                    if (result)
                        Result = "Empleado registrado satisfactoriamente";
                }
            }
            catch { }
               

            ScriptManager.RegisterStartupScript(this, this.GetType(), "Result", "Result('" + Result + "');", true);
        }

    }
}