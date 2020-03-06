using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TestEntrepidus.Models
{
    public class Employee
    {

        public int Id { get; set; }
        public string IdentificationNumber{ get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Direccion { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public DateTime ContractDate { get; set; }
        public DateTime BirthDate { get; set; }
        public bool FreeLance { get; set; }
        public float Rate { get; set; }

    }
}