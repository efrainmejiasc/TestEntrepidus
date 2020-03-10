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

        public bool CreateEmployee(Employee emp)
        {
            bool resultado = false;
            using (ContextDataContext context = new ContextDataContext())
            {
                context.Employee.InsertOnSubmit(emp);
                context.SubmitChanges();
                resultado = true;
            }

            return resultado;
        }


        public List<Employee> GetEmployees()
        {
            List<Employee> emp = new List<Employee>();
            using (ContextDataContext context = new ContextDataContext())
            {
                emp = context.Employee.ToList();
            }
            return emp;
        }

        public bool DeleteEmployee(string id)
        {
            bool result = false;
            Employee emp = new Employee ();
            using (ContextDataContext context = new ContextDataContext())
            {
                emp = context.Employee.Where(x => x.IdentificationNumber == id).FirstOrDefault();
                context.Employee.DeleteOnSubmit(emp);
                context.SubmitChanges();
                result = true;
            }
            return result ;
        }

        public bool EditEmployee (string id, string name,string lastName,string email)
        {
            bool result = false;
            Employee emp = new Employee();
            using (ContextDataContext context = new ContextDataContext())
            {
                emp = context.Employee.Where(x => x.IdentificationNumber == id).FirstOrDefault();
                emp.FirstName = name;
                emp.LastName = lastName;
                emp.Email = email;
                context.SubmitChanges();
                result = true;
            }
            return result;
        }

    }
}