using System;
using Microsoft.EntityFrameworkCore;

namespace CustomerService
{
    public class CustomerDb : DbContext
    {
        public DbSet<Customer> Customers { get; set; }  
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlite("Filename=" + Environment.GetEnvironmentVariable("DB_LOCATION"));
        }
    }
}
