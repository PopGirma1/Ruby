//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebApplication11.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class tbl_employee
    {
        public int emp_id { get; set; }
        public string emp_name { get; set; }
        public System.DateTime emp_dob { get; set; }
        public System.DateTime emp_hiredate { get; set; }
        public Nullable<int> emp_fk_id { get; set; }
        public string emp_img { get; set; }
    
        public virtual tbl_department tbl_department { get; set; }
    }
}