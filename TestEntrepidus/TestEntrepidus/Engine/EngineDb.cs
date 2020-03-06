using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Linq;

namespace TestEntrepidus.Engine
{
    public class EngineDb
    {
        string cnxDb = System.Configuration.ConfigurationManager.ConnectionStrings["CNX_DB"].ToString();

        public bool LoginUser(string user, string password)
        {
            bool result = false;
            Administrator adm = new Administrator();
            using (ContextDataContext context = new ContextDataContext(cnxDb))
            {
                 adm = context.Administrator.Where(s => s.Username == user && s.Password == password).FirstOrDefault();
                 if (adm != null)
                    result = true;
            }
                return result;
        }

    }
}