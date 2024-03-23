using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace EmployeeManagment.DTOS
{
    public class Ent_Employee
    {
        [Required]
        public int id { get; set; }
        [Required(ErrorMessage = "Name is required.")]


        public string Name { get; set; }
        [Required(ErrorMessage = "Email is required.")]
        [RegularExpression(@"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$", ErrorMessage = "Invalid Email Address")]
        public string Email { get; set; }

        [Required(ErrorMessage = "Phone number is required.")]
        [RegularExpression(@"^\d{10}$", ErrorMessage = "Phone number must be exactly 10 digits.")]

        public string Phone { get; set; }
        [StringLength(500, ErrorMessage = "Description cannot be more than 500 characters long.")]
        public string Description { get; set; }
        [Required(ErrorMessage = "Address is required.")]
        public string Address { get; set; }
        [Required(ErrorMessage = "Position is required.")]
        public string Position { get; set; }
        [Required(ErrorMessage = "Department is required.")]
        public string Department { get; set; }
    }
}