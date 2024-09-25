using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using OnlineStore.Models;

namespace OnlineStore.Controllers
{
    public class AdmProductsController : Controller
    {
        private readonly DbShoppingStoreContext _context;

        public AdmProductsController(DbShoppingStoreContext context)
        {
            _context = context;
        }

        // GET: AdmProducts
        public async Task<IActionResult> Index()
        {
            var dbShoppingStoreContext = _context.Products.Include(p => p.BrandF).Include(p => p.CategoryF);
            return View(await dbShoppingStoreContext.ToListAsync());
        }

        // GET: AdmProducts/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var product = await _context.Products
                .Include(p => p.BrandF)
                .Include(p => p.CategoryF)
                .FirstOrDefaultAsync(m => m.ProductId == id);
            if (product == null)
            {
                return NotFound();
            }

            return View(product);
        }

        // GET: AdmProducts/Create
        public IActionResult Create()
        {
            ViewData["BrandFid"] = new SelectList(_context.Brands, "BrandId", "BrandName");
            ViewData["CategoryFid"] = new SelectList(_context.Categories, "CategoryId", "CategoryName");
            return View();
        }

        // POST: AdmProducts/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(Product product, IFormFile pic)
        {
            string FileName = Path.GetFileName(pic.FileName);
            string Ext = Path.GetExtension(pic.FileName);
            if (Ext.ToLower() == ".jpg" || Ext == ".png" || Ext == ".bmp" || Ext == ".jpeg" || Ext == ".tiff" || Ext == ".tif")
            {
                string FilePath = Path.Combine(Directory.GetCurrentDirectory(), @"wwwroot\DataFiles", FileName);
                using (var fs = new FileStream(FilePath, FileMode.Create))
                {
                    await pic.CopyToAsync(fs);
                    product.ProductImage = FileName;
                }

            }
            else
            {
                TempData["Title"] = "Error";
                TempData["Message"] = "Please Select a valid image file (jpg,png,...)";
                TempData["Icon"] = "error";
                return View(product);
            }



            if (ModelState.IsValid)
            {
                _context.Add(product);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["BrandFid"] = new SelectList(_context.Brands, "BrandId", "BrandName");
            ViewData["CategoryFid"] = new SelectList(_context.Categories, "CategoryId", "CategoryName");
            return View(product);
        }

        // GET: AdmProducts/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var product = await _context.Products.FindAsync(id);
            if (product == null)
            {
                return NotFound();
            }
            ViewData["BrandFid"] = new SelectList(_context.Brands, "BrandId", "BrandId", product.BrandFid);
            ViewData["CategoryFid"] = new SelectList(_context.Categories, "CategoryId", "CategoryId", product.CategoryFid);
            return View(product);
        }

        // POST: AdmProducts/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, Product product, IFormFile pic)
        {
            if (id != product.ProductId)
            {
                return NotFound();
            }

            if (pic != null)
            {
                string FileName = Path.GetFileName(pic.FileName);
                string Ext = Path.GetExtension(pic.FileName);
                if (Ext.ToLower() == ".jpg" || Ext == ".png" || Ext == ".bmp" || Ext == ".jpeg" || Ext == ".tiff" || Ext == ".tif")
                {
                    string FilePath = Path.Combine(Directory.GetCurrentDirectory(), @"wwwroot\DataFiles", FileName);
                    using (var fs = new FileStream(FilePath, FileMode.Create))
                    {
                        await pic.CopyToAsync(fs);
                        product.ProductImage = FileName;
                    }

                }
                else
                {
                    TempData["Title"] = "Error";
                    TempData["Message"] = "Please Select a valid image file (jpg,png,...)";
                    TempData["Icon"] = "error";
                    return View(product);
                }
            }


            try
            {
                _context.Update(product);
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ProductExists(product.ProductId))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }
            return RedirectToAction(nameof(Index));

           
        }

        // GET: AdmProducts/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var product = await _context.Products
                .Include(p => p.BrandF)
                .Include(p => p.CategoryF)
                .FirstOrDefaultAsync(m => m.ProductId == id);
            if (product == null)
            {
                return NotFound();
            }

            return View(product);
        }

        // POST: AdmProducts/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var product = await _context.Products.FindAsync(id);
            if (product != null)
            {
                _context.Products.Remove(product);
            }

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool ProductExists(int id)
        {
            return _context.Products.Any(e => e.ProductId == id);
        }
    }
}
