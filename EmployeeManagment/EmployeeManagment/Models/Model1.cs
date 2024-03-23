using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace EmployeeManagment.Models
{
    public partial class Model1 : DbContext
    {
        public Model1()
            : base("name=Model1")
        {
        }

        public virtual DbSet<Employee> Employees { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Employee>()
                .Property(e => e.Name)
                .IsUnicode(false);

            modelBuilder.Entity<Employee>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<Employee>()
                .Property(e => e.Phone)
                .IsUnicode(false);

            modelBuilder.Entity<Employee>()
                .Property(e => e.description)
                .IsUnicode(false);

            modelBuilder.Entity<Employee>()
                .Property(e => e.Address)
                .IsUnicode(false);

            modelBuilder.Entity<Employee>()
                .Property(e => e.Department)
                .IsUnicode(false);

            modelBuilder.Entity<Employee>()
                .Property(e => e.Position)
                .IsUnicode(false);
        }

        public System.Data.Entity.DbSet<EmployeeManagment.DTOS.Ent_Employee> Ent_Employee { get; set; }
    }
}
