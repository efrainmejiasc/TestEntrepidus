using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Linq;

namespace TestEntrepidus.Engine
{
    public class EngineDb
    {

        public bool LoginUser(string user, string password)
        {
            bool result = false;
            Administrator adm = new Administrator();
            using (ContextDataContext context = new ContextDataContext())
            {
                 adm = context.Administrator.Where(s => s.Username == user && s.Password == password).FirstOrDefault();
                 if (adm != null)
                    result = true;
            }
                return result;
        }

        public bool CreateAdministrator (Administrator adm)
        {
            bool resultado = false;
            using (ContextDataContext context = new ContextDataContext())
            {
                context.Administrator.InsertOnSubmit(adm);
                context.SubmitChanges();
                resultado = true;
            }

            return resultado;
        }

    }
}