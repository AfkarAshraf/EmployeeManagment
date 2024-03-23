using EmployeeManagment.DTOS;
using EmployeeManagment.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace EmployeeManagment.Controllers
{
    public class EmployeeController : Controller
    {
        Model1 db = new Model1();
        public ActionResult Index()
        {
            return View(db.Employees.ToList());
        }


        [HttpGet]
        // GET: /Employee/Create
        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]

        public ActionResult Create(Ent_Employee userDTO)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    Employee employee = new Employee();
                    employee.Name = userDTO.Name;
                    employee.Email = userDTO.Email;
                    employee.Phone = userDTO.Phone;
                    employee.description = userDTO.Description;
                    employee.Address = userDTO.Address;
                    employee.Department = userDTO.Department;
                    employee.Position = userDTO.Position;


                    SqlParameter Name = new SqlParameter("@name", employee.Name);
                    SqlParameter Email = new SqlParameter("@email", employee.Email);
                    SqlParameter Phone = new SqlParameter("@phone", employee.Phone);
                    SqlParameter description = new SqlParameter("@description", employee.description);
                    SqlParameter Address = new SqlParameter("@Address", employee.Address);
                    SqlParameter Department = new SqlParameter("@Department", employee.Department);
                    SqlParameter Position = new SqlParameter("@Position", employee.Position);

                    db.Database.ExecuteSqlCommand("Insert_Employee @name,@email,@phone,@description,@Address,@Department,@Position", Name, Email, Phone, description, Address, Department, Position);
                    return RedirectToAction("index");

                }
                else
                {
                    ViewBag.ShowAlert = true;
                    ViewBag.AlertMessage = "Please correct the errors and try again.";
                    return View(userDTO);
                }



            }
            catch (Exception ex)
            {
                return View("Error");
            }



        }




        // GET: /Employee/Details/1
        public ActionResult Details(int id)
        {

            Employee Existing_Employee = db.Employees.FirstOrDefault(Emp => Emp.Id == id);

            return View(Existing_Employee);
        }


        // GET: /Employee/Edit/1

        public ActionResult Edit(int id)
        {
            Ent_Employee editabledetails = new Ent_Employee();
            Employee Existing_Employee = db.Employees.FirstOrDefault(Emp => Emp.Id == id);

            if (Existing_Employee != null)
            {

                editabledetails.id = Existing_Employee.Id;
                editabledetails.Name = Existing_Employee.Name;
                editabledetails.Phone = Existing_Employee.Phone;
                editabledetails.Email = Existing_Employee.Email;
                editabledetails.Phone = Existing_Employee.Phone;
                editabledetails.Address = Existing_Employee.Address;
                editabledetails.Description = Existing_Employee.description;
                editabledetails.Department = Existing_Employee.Department;
                editabledetails.Position = Existing_Employee.Position;

                return View(editabledetails);
            }

            else
            {

                return View("NotFound");


            }



        }



        [HttpPost]
        // POST: /Employee/Edit/1
        public ActionResult Edit(int id, Ent_Employee UserUpdateDTO)
        {




            Employee employee = new Employee();
            employee.Id = id;
            employee.Name = UserUpdateDTO.Name;
            employee.Email = UserUpdateDTO.Email;
            employee.Phone = UserUpdateDTO.Phone;
            employee.description = UserUpdateDTO.Description;
            employee.Address = UserUpdateDTO.Address;
            employee.Department = UserUpdateDTO.Department;
            employee.Position = UserUpdateDTO.Position;

            SqlParameter Id = new SqlParameter("@id", employee.Id);
            SqlParameter Name = new SqlParameter("@name", employee.Name);
            SqlParameter Email = new SqlParameter("@email", employee.Email);
            SqlParameter Phone = new SqlParameter("@phone", employee.Phone);
            SqlParameter description = new SqlParameter("@description", employee.description);
            SqlParameter Address = new SqlParameter("@Address", employee.Address);
            SqlParameter Department = new SqlParameter("@Department", employee.Department);
            SqlParameter Position = new SqlParameter("@Position", employee.Position);

            if (db.Database.ExecuteSqlCommand("Update_Employee_Details @id,@name,@email,@phone,@description,@Address,@Department,@Position", Id, Name, Email, Phone, description, Address, Department, Position) > 0)
                return RedirectToAction("index");
            else
                return View("Error");



        }

        // GET: /Home/Delete/id

        public ActionResult Delete(int id)
        {



            Employee Employee_To_Remove = db.Employees.FirstOrDefault(Emp => Emp.Id == id);

            if (Employee_To_Remove != null)
            {



                return View(Employee_To_Remove);
            }

            else
            {

                return View("NotFound");


            }








        }

        // POST: /Home/Delete/id
        [HttpPost]

        public ActionResult Delete(int id, Employee empdetails)
        {

            try
            {

                Employee Employee_To_Delete = db.Employees.Find(id);

                if (Employee_To_Delete != null)
                {

                    SqlParameter Id = new SqlParameter("@id", id);
                    if (db.Database.ExecuteSqlCommand("Delete_Employee @id", Id) > 0)
                        return RedirectToAction("index");
                    else
                        return View("Error");


                }


                return RedirectToAction("index");
            }
            catch
            {

                return View("Error");
            }










        }
        /* we can use stored procedure to delete an employee or we can use this approach : 

        [HttpPost]
        public ActionResult Delete(int id,Employee empdetails)
        {
            try
            {

                Employee Employee_To_Delete = db.Employees.Find(id);
                this.db.Employees.Remove(Employee_To_Delete);
                this.db.SaveChanges();

                return RedirectToAction("index");
            }
            catch
            {

                return View("Error");
            }
        }

        */


    }


}
