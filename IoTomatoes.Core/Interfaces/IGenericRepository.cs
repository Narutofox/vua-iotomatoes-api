using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;

namespace IoTomatoes.Domain.Interfaces
{
    public interface IGenericRepository<T> where T : class
    {
        T Get(int id);
        List<T> GetAll();
        T FindBy(Expression<Func<T, bool>> expression);
        void Add(T entity);
        void Update(T entity);
        void Remove(T entity);

        void RemoveRange(IEnumerable<T> entity);
        void Detach(T entity);
        int Commit();

        bool ExistsBy(Expression<Func<T, bool>> expression);
        IQueryable<T> SelectBy(Expression<Func<T, bool>> expression);
    }
}
