using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using M2SYS.Infrastructure.Context;
using M2SYS.Repo.Interface;
using M2SYS.Utility.DTOs;
using M2SYS.Utility.Extension;
using Microsoft.EntityFrameworkCore;

namespace M2SYS.Repo
{
    public class BaseRepo<T>: IBaseRepo<T> where T: class
    {
        protected readonly HRMContext DbContext;
        protected BaseRepo(HRMContext dbContext)
        {
            this.DbContext = dbContext;
        }

        public virtual async Task<T> GetByIdAsync(long id)
        {
            return await DbContext.Set<T>().FindAsync(id);
        }

        public virtual async Task<Page<T>> GetPageAsync(
            int pageIndex,
            int pageSize,
            Func<IQueryable<T>, IOrderedQueryable<T>> orderBy,
            params Expression<Func<T, object>>[] includes)
        {
            return await orderBy(includes.Aggregate(DbContext.Set<T>().AsQueryable(),
                (current, include) => current.Include(include)))
                .PagingAsync(pageIndex, pageSize);
        }

        public virtual async Task<Page<T>> GetPageAsync(
            int pageIndex,
            int pageSize,
            Expression<Func<T, bool>> predicate,
            Func<IQueryable<T>, IOrderedQueryable<T>> orderBy,
            params Expression<Func<T, object>>[] includes)
        {
            return await orderBy(includes.Aggregate(DbContext.Set<T>().AsQueryable(),
                (current, include) => current.Include(include), c => c.Where(predicate)))
                .PagingAsync(pageIndex, pageSize);
        }

        public virtual async Task<Page<TResult>> GetPageAsync<TResult>(
           int pageIndex,
           int pageSize,
           Expression<Func<T, bool>> predicate,
           Func<IQueryable<T>, IOrderedQueryable<T>> orderBy,
           Expression<Func<T, TResult>> selector,
           params Expression<Func<T, object>>[] includes)
        {
            return await orderBy(includes.Aggregate(DbContext.Set<T>().AsQueryable(),
                (current, include) => current.Include(include), c => c.Where(predicate)))
                .PagingAsync(selector, pageIndex, pageSize);
        }

        public virtual async Task<List<T>> GetsAsync(
            params Expression<Func<T, object>>[] includes)
        {
            return await includes
                .Aggregate(
                   DbContext.Set<T>().AsQueryable(),
                    (current, include) => current.Include(include)
                ).ToListAsync();
        }

        public virtual async Task<List<T>> GetsAsync(
            Expression<Func<T, bool>> predicate,
            params Expression<Func<T, object>>[] includes)
        {
            return await includes
               .Aggregate(
                   DbContext.Set<T>().AsQueryable(),
                   (current, include) => current.Include(include),
                  c => c.Where(predicate)
               ).ToListAsync().ConfigureAwait(false);
        }

        public virtual async Task<List<T>> GetsAsync(
            Expression<Func<T, bool>> predicate,
            Func<IQueryable<T>, IOrderedQueryable<T>> orderBy,
            params Expression<Func<T, object>>[] includes)
        {
            return await orderBy(includes
               .Aggregate(
                   DbContext.Set<T>().AsQueryable(),
                   (current, include) => current.Include(include),
                  c => c.Where(predicate))
               ).ToListAsync();
        }

        public virtual async Task<List<TResult>> GetsAsync<TResult>(
          Expression<Func<T, bool>> predicate,
          Func<IQueryable<T>, IOrderedQueryable<T>> orderBy,
          Expression<Func<T, TResult>> selector,
          params Expression<Func<T, object>>[] includes)
        {
            return await orderBy(includes
               .Aggregate(
                   DbContext.Set<T>().AsQueryable(),
                   (current, include) => current.Include(include),
                  c => c.Where(predicate))
               ).Select(selector).ToListAsync();
        }

        public virtual async Task<bool> AnyAsync(
            Expression<Func<T, bool>> predicate,
            params Expression<Func<T, object>>[] includes)
        {
            return await includes.Aggregate(
                DbContext.Set<T>().AsQueryable(),
                (current, include) => current.Include(include),
                c => c.AnyAsync(predicate)).ConfigureAwait(false);
        }


        public virtual async Task<T> FirstOrDefaultAsync(
            Expression<Func<T, bool>> predicate,
            params Expression<Func<T, object>>[] includes)
        {
            return await includes
               .Aggregate(
               DbContext.Set<T>().AsQueryable(),
               (current, include) => current.Include(include),
               c => c.FirstOrDefaultAsync(predicate)).ConfigureAwait(false);
        }

        public virtual async Task<T> FirstOrDefaultAsync(
            Expression<Func<T, bool>> predicate,
            Func<IQueryable<T>, IOrderedQueryable<T>> orderBy)
        {
            return await orderBy(DbContext.Set<T>()).FirstOrDefaultAsync(predicate).ConfigureAwait(false);
        }

        public virtual async Task<T> AddAsync(T entity)
        {
            if (entity != null)
            {
                Type type = entity.GetType();
                type.GetProperty("CreatedBy")?.SetValue(entity, 0);
                type.GetProperty("CreatedDateUtc")?.SetValue(entity, DateTime.UtcNow);
            }
            DbContext.Set<T>().Add(entity);
            await DbContext.SaveChangesAsync();
            return entity;
        }

        public virtual async Task<List<T>> AddAsync(List<T> entityList)
        {
            foreach (var entity in entityList)
            {
                if (entity != null)
                {
                    Type type = entity.GetType();
                    type.GetProperty("CreatedBy")?.SetValue(entity, 0);
                    type.GetProperty("CreatedDateUtc")?.SetValue(entity, DateTime.UtcNow);
                }
            }

            DbContext.Set<T>().AddRange(entityList);
            await DbContext.SaveChangesAsync();
            return entityList;
        }

        public virtual async Task<T> EditAsync(T entity)
        {
            if (entity != null)
            {
                Type type = entity.GetType();
                type.GetProperty("UpdatedBy")?.SetValue(entity, 0);
                type.GetProperty("UpdatedDateUtc")?.SetValue(entity, DateTime.UtcNow);
            }

            DbContext.Entry(entity).State = EntityState.Modified;
            await DbContext.SaveChangesAsync();
            return entity;
        }

        public virtual async Task<List<T>> EditAsync(List<T> entityList)
        {
            foreach (T item in entityList)
            {
                DbContext.Entry(item).State = EntityState.Modified;
            }
            //DbContext.Entry(entityList).State = EntityState.Modified;
            await DbContext.SaveChangesAsync();
            return entityList;
        }
        public virtual async Task<T> AddOrUpdateAsync(T entity)
        {
            DbContext.Set<T>().Update(entity);
            await DbContext.SaveChangesAsync();
            return entity;
        }

        public virtual async Task<List<T>> AddOrUpdateAsync(List<T> entityList)
        {
            T[] arrayList = entityList.ToArray();
            DbContext.Set<T>().UpdateRange(arrayList);
            await DbContext.SaveChangesAsync();
            return arrayList.ToList();
        }

        public virtual async Task<T> EditAsync(long id, T entity)
        {
            var obj = await this.GetByIdAsync(id);

            if (obj == null)
                throw new NullReferenceException("Entity doesn't found.");

            if (entity != null)
            {
                Type type = entity.GetType();
                type.GetProperty("UpdatedBy")?.SetValue(entity, 0);
                type.GetProperty("UpdatedDateUtc")?.SetValue(entity, DateTime.UtcNow);
            }
            DbContext.Entry(entity).State = EntityState.Modified;
            await DbContext.SaveChangesAsync();
            return entity;
        }

        public virtual async Task DeleteAsync(T entity)
        {
            DbContext.Set<T>().Remove(entity);
            await DbContext.SaveChangesAsync();
        }

        public virtual async Task DeleteAsync(List<T> entityList)
        {
            DbContext.Set<T>().RemoveRange(entityList);
            await DbContext.SaveChangesAsync();
        }

        public virtual async Task DeleteAsync(long id)
        {
            var entity = await this.GetByIdAsync(id);
            DbContext.Set<T>().Remove(entity);
            await DbContext.SaveChangesAsync();
        }
    }
}