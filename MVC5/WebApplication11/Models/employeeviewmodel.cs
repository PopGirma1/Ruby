using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace WebApplication11.Models
{
    public class employeeviewmodel
    {
        public int emp_id { get; set; }


        [Required(ErrorMessage="*")]

        public string emp_name { get; set; }
        [Required(ErrorMessage = "*")]
        public System.DateTime emp_dob { get; set; }
        public System.DateTime emp_hiredate { get; set; }
        public string emp_img { get; set; }


        public int dep_id { get; set; }
  [Required(ErrorMessage = "*")]

        public string dep_name { get; set; }



    }
}