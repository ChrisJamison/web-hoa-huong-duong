using DataModel.GenericRepository;
using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataModel.UnitOfWork
{
    /// <summary>
    /// UnitOfWork class reposibily for Data Transaction
    /// </summary>
    public class UnitOfWork : IDisposable
    {
        #region Private member variables...
        private WebHoaHuongDuongDBEntities _context;
        private GenericRepository<Product> _productRepository;
        private GenericRepository<Cart> _cartRepository;
        private GenericRepository<CartDetail> _cartDetailRepository;
        private GenericRepository<Category> _categoryRepository;
        private GenericRepository<Customer> _customerRepository;
        private GenericRepository<Bill> _billRepository;
        private GenericRepository<News> _newsRepository;
        #endregion

        #region Public constructor...
        public UnitOfWork()
        {
            _context = new WebHoaHuongDuongDBEntities();
        }
        #endregion

        #region public Repository Creation Properties...
        public GenericRepository<Product> ProductRepository
        {
            get
            {
                if (this._productRepository == null)
                    this._productRepository = new GenericRepository<Product>(_context);
                return _productRepository;
            }
        }

        public GenericRepository<Cart> CartRepository
        {
            get
            {
                if (this._cartRepository == null)
                    this._cartRepository = new GenericRepository<Cart>(_context);
                return _cartRepository;
            }
        }
        public GenericRepository<CartDetail> CartDetailRepository
        {
            get
            {
                if (this._cartDetailRepository == null)
                    this._cartDetailRepository = new GenericRepository<CartDetail>(_context);
                return _cartDetailRepository;
            }
        }

        public GenericRepository<Category> CategoryRepository
        {
            get
            {
                    this._categoryRepository = new GenericRepository<Category>(_context);
                return _categoryRepository;
            }
        }

        public GenericRepository<Customer> CustomerRepository
        {
            get
            {
                if (this._customerRepository == null)
                    this._customerRepository = new GenericRepository<Customer>(_context);
                return _customerRepository;
            }
        }

        public GenericRepository<Bill> BillRepository
        {
            get
            {
                if (this._billRepository == null)
                    this._billRepository = new GenericRepository<Bill>(_context);
                return _billRepository;
            }
        }

        public GenericRepository<News> NewsRepository
        {
            get
            {
                if (this._newsRepository == null)
                    this._newsRepository = new GenericRepository<News>(_context);
                return _newsRepository;
            }
        }
        #endregion

        #region Public member methods
        /// <summary>
        /// Save method.
        /// </summary>
        public void Save()
        {
            try
            {
                _context.SaveChanges();
            }
            catch (DbEntityValidationException e)
            {

                var outputLines = new List<string>();
                foreach (var eve in e.EntityValidationErrors)
                {
                    outputLines.Add(string.Format(
                        "{0}: Entity of type \"{1}\" in state \"{2}\" has the following validation errors:", DateTime.Now,
                        eve.Entry.Entity.GetType().Name, eve.Entry.State));
                    foreach (var ve in eve.ValidationErrors)
                    {
                        outputLines.Add(string.Format("- Property: \"{0}\", Error: \"{1}\"", ve.PropertyName, ve.ErrorMessage));
                    }
                }
                System.IO.File.AppendAllLines(@"C:\errors.txt", outputLines);

                throw e;
            }

        }
        #endregion

        #region Implementing IDiosposable...

        #region private dispose variable declaration...
        private bool disposed = false;
        #endregion

        /// <summary>
        /// Protected Virtual Dispose method
        /// </summary>
        /// <param name="disposing"></param>
        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposed)
            {
                if (disposing)
                {
                    Debug.WriteLine("UnitOfWork is being disposed");
                    _context.Dispose();
                }
            }
            this.disposed = true;
        }

        /// <summary>
        /// Dispose method
        /// </summary>
        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
        #endregion
    }
}
