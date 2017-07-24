using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json.Linq;

namespace CustomerService.Controllers
{
    [Route("api/[controller]")]
    public class CustomerController : Controller
    {
        [HttpGet]
        public IEnumerable<Customer> getAllCustomer()
        {
            using (CustomerDb db = new CustomerDb())
            {
                return db.Customers.ToList();
            }
        }

        [HttpGet("{id}")]
        public Customer getCustomer(int id)
        {
            using (CustomerDb db = new CustomerDb())
            {
                return db.Customers.First(c => c.Id == id);
            }
        }

        [HttpPost]
        public void createCustomer([FromBody]JObject value)
        {
            Customer posted = value.ToObject<Customer>();
            using (CustomerDb db = new CustomerDb())
            {
                db.Customers.Add(posted);
                db.SaveChanges();
            }
        }

        [HttpPut("{id}")]
        public void updateCustomer(int id, [FromBody]JObject value)
        {
            Customer posted = value.ToObject<Customer>();
            posted.Id = id;
            using (CustomerDb db = new CustomerDb())
            {
                db.Customers.Update(posted);
                db.SaveChanges();
            }
        }

        [HttpDelete("{id}")]
        public void deleteCustomer(int id)
        {
            using (CustomerDb db = new CustomerDb())
            {
                if (db.Customers.Where(c => c.Id == id).Count() > 0)
                    db.Customers.Remove(db.Customers.First(c => c.Id == id));
                db.SaveChanges();
            }
        }
    }
}
