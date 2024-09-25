using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using OnlineStore.Models;
using System.Diagnostics;
using System.Text;

namespace OnlineStore.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private DbShoppingStoreContext db;
        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
            db = new DbShoppingStoreContext();
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Categories()
        {
            var categories = db.Categories.ToList();
            return View(categories);
        }

		public IActionResult Brands()
		{
			var brands = db.Brands.ToList();
			return View(brands);
		}



		public IActionResult Products(int? id,int? brand)
        {
            // Displaying Brands and Categories List on Side
            ViewBag.Cats = db.Categories.ToList();
            ViewBag.Brands = db.Brands.ToList();

            //Filter Category
            var products = db.Products.Include(x => x.CategoryF).Include(x => x.BrandF).ToList();
            if (id != null)
            {
                return View(products.Where(x=>x.CategoryFid == id));
            }

            //Filter Brand
            if (brand != null)
            {
                return View(products.Where(x => x.BrandFid == brand));
            }

            return View(products);
        }


        public IActionResult AdminIndex()
        {
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        public IActionResult Contact()
        {
            return View();
        }

        public IActionResult Login()
        {
            return View();
        }

        public IActionResult LoginCheck(string txtEmail, string txtPass)
        {

            Customer customer = db.Customers.Where(x => x.Email == txtEmail && x.Password == txtPass).FirstOrDefault();
            if (customer == null)
            {
                TempData["Title"] = "Error";
                TempData["Message"] = "Email or password incorrect";
                TempData["Icon"] = "error";

                return Redirect("/Home/Login");
            }
            else
            {

                TempData["Title"] = "Login";
                TempData["Message"] = "Logged In successfully.";
                TempData["Icon"] = "success";

                return Redirect("/Home/Index");

            }


        }

        public IActionResult Register(string txtName, string txtEmail, string txtPass, string txtCPass)
        {

            if (txtPass != txtCPass)
            {
                TempData["Title"] = "Error";
                TempData["Message"] = "Passwords do not match.";
                TempData["Icon"] = "warning";

                return Redirect("/Home/Login");
            }

            Customer cust = db.Customers.Where(x => x.Email.Equals(txtEmail)).FirstOrDefault();
            if (cust != null)
            {
                TempData["Title"] = "Already Exists";
                TempData["Message"] = "This Email is already registered";
                TempData["Icon"] = "warning";

                return Redirect("/Home/Login");
            }

            Customer customer = new Customer()
            {
                FullName = txtName,
                Email = txtEmail,
                Password = txtPass,
            };

            db.Add(customer);
            db.SaveChanges();

            TempData["Title"] = "Account Registered";
            TempData["Message"] = "Account has been created successfully.";
            TempData["Icon"] = "success";

            return Redirect("/Home/Login");
        }






    }
}
