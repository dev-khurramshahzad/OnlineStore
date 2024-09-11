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
    public class AdmCategoriesController : Controller
    {
        private readonly DbShoppingStoreContext _context;

        public AdmCategoriesController(DbShoppingStoreContext context)
        {
            _context = context;
        }

        // GET: AdmCategories
        public async Task<IActionResult> Index()
        {
            return View(await _context.Categories.ToListAsync());
        }

        // GET: AdmCategories/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var category = await _context.Categories
                .FirstOrDefaultAsync(m => m.CategoryId == id);
            if (category == null)
            {
                return NotFound();
            }

            return View(category);
        }

        // GET: AdmCategories/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: AdmCategories/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(Category category, IFormFile pic)
        {
            string FileName = Path.GetFileName(pic.FileName);
            string Ext = Path.GetExtension(pic.FileName);
            if (Ext.ToLower() == ".jpg" || Ext == ".png" || Ext == ".bmp" || Ext == ".jpeg" || Ext == ".tiff" || Ext == ".tif")
            {
                string FilePath = Path.Combine(Directory.GetCurrentDirectory(), @"wwwroot\DataFiles", FileName);
                using (var fs = new FileStream(FilePath, FileMode.Create))
                {
                    await pic.CopyToAsync(fs);
                    category.CategoryImage = FileName;
                }

            }
            else
            {
                TempData["Title"] = "Error";
                TempData["Message"] = "Please Select a valid image file (jpg,png,...)";
                TempData["Icon"] = "error";
                return View(category);
            }



            if (ModelState.IsValid)
            {
                _context.Add(category);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(category);
        }

        // GET: AdmCategories/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var category = await _context.Categories.FindAsync(id);
            if (category == null)
            {
                return NotFound();
            }
            return View(category);
        }

        // POST: AdmCategories/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        public async Task<IActionResult> Edit(int id, Category category, IFormFile pic)
        {
            if (id != category.CategoryId)
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
                        category.CategoryImage = FileName;
                    }

                }
                else
                {
                    TempData["Title"] = "Error";
                    TempData["Message"] = "Please Select a valid image file (jpg,png,...)";
                    TempData["Icon"] = "error";
                    return View(category);
                }
            }


            try
            {
                _context.Update(category);
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!CategoryExists(category.CategoryId))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }
            return RedirectToAction(nameof(Index));

            return View(category);
        }

        // GET: AdmCategories/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var category = await _context.Categories
                .FirstOrDefaultAsync(m => m.CategoryId == id);
            if (category == null)
            {
                return NotFound();
            }

            return View(category);
        }

        // POST: AdmCategories/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var category = await _context.Categories.FindAsync(id);
            if (category != null)
            {
                _context.Categories.Remove(category);
            }

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool CategoryExists(int id)
        {
            return _context.Categories.Any(e => e.CategoryId == id);
        }
    }
}
