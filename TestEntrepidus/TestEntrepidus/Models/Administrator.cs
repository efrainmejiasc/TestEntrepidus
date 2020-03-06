using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TestEntrepidus.Models
{
    public class Administrator
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName {get;set;}
        public string Username { get; set; }
        public string Password { get; set; }
        public DateTime CreateDate { get; set; }
    }
}