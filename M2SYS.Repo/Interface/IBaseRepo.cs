﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using M2SYS.Utility.DTOs;

namespace M2SYS.Repo.Interface
{
    public interface IBaseRepo<T> where T: class
    {
        Task<T> GetByIdAsync(long id);
        Task<Page<T>> GetPageAsync(int pageIndex, int pageSize, Expression<Func<T, bool>> predicate, Func<IQueryable<T>, IOrderedQueryable<T>> orderBy, params Expression<Func<T, object>>[] includes);
        Task<List<T>> GetsAsync(params Expression<Func<T, object>>[] includes);
        Task<List<T>> GetsAsync(Expression<Func<T, bool>> predicate, params Expression<Func<T, object>>[] includes);
        Task<List<T>> GetsAsync(Expression<Func<T, bool>> predicate, Func<IQueryable<T>, IOrderedQueryable<T>> orderBy, params Expression<Func<T, object>>[] includes);
        Task<List<TResult>> GetsAsync<TResult>(Expression<Func<T, bool>> predicate, Func<IQueryable<T>, IOrderedQueryable<T>> orderBy, Expression<Func<T, TResult>> selector, params Expression<Func<T, object>>[] includes);
        Task<bool> AnyAsync(Expression<Func<T, bool>> predicate, params Expression<Func<T, object>>[] includes);
        Task<T> FirstOrDefaultAsync(Expression<Func<T, bool>> predicate, params Expression<Func<T, object>>[] includes);
        Task<T> AddAsync(T entity);
        Task<List<T>> AddAsync(List<T> entityList);
        Task<T> EditAsync(T entity);
        Task<List<T>> EditAsync(List<T> entityList);
        Task<T> AddOrUpdateAsync(T entity);
        Task<List<T>> AddOrUpdateAsync(List<T> entityList);
        Task<T> EditAsync(long id, T entity);
        Task DeleteAsync(T entity);
        Task DeleteAsync(List<T> entityList);
        Task DeleteAsync(long id);
    }
}