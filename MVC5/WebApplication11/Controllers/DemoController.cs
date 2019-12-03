using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplication11.Models;

namespace WebApplication11.Controllers
{
    public class DemoController : Controller
    {
        mvcEntities db = new mvcEntities();
        // GET: Demo
        public ActionResult Index()
        {
            List<tbl_employee> emplist = db.tbl_employee.ToList();

          
            List<employeeviewmodel> evmlist = emplist.Select(x => new employeeviewmodel
            {
                emp_id = x.emp_id,
                emp_name = x.emp_name,
                emp_hiredate = x.emp_hiredate,
                emp_img = x.emp_img,
                emp_dob = x.emp_dob,
                dep_id = Convert.ToInt32(x.emp_fk_id),
                dep_name = x.tbl_department.dep_name
            }).ToList();


            return View(evmlist);
        }

        [HttpGet]
        public ActionResult Edit()
        {
            return View();
        }


        [HttpGet]
        public ActionResult Delete()
        {
            return View();
        }
        [HttpGet]
        public ActionResult Details()
        {
            return View();
        }





    }
}