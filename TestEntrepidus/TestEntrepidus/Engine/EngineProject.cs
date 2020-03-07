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
    }
}