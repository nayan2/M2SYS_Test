using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using M2SYS.Utility.DTOs;
using Microsoft.EntityFrameworkCore;

namespace M2SYS.Utility.Extension
{
    public static class PagingExtension
    {
        public static async Task<Page<T>> PagingAsync<T>(this IQueryable<T> query, int pageIndex = 0, int pageSize = 10)
        {
            var total = await query.CountAsync(); ;
            var skip = Math.Max(pageSize * pageIndex, 0);
            var list = await query.Skip(skip).Take(pageSize).ToListAsync();

            return new Page<T>()
            {
                TotalCount = total,
                Data = list,
            };
        }

        public static async Task<Page<TResult>> PagingAsync<T, TResult>(this IQueryable<T> query, Expression<Func<T, TResult>> selector, int pageIndex = 0, int pageSize = 10)
        {
            var total = await query.CountAsync(); ;
            var skip = Math.Max(pageSize * pageIndex, 0);
            var list = await query.Skip(skip).Take(pageSize).Select(selector).ToListAsync();

            return new Page<TResult>()
            {
                TotalCount = total,
                Data = list,
            };
        }

        public static Page<T> Paging<T>(this List<T> query, int pageIndex = 0, int pageSize = 10)
        {
            var total = query.Count;
            var skip = Math.Max(pageSize * pageIndex, 0);
            var list = query.Skip(skip).Take(pageSize).ToList();

            return new Page<T>()
            {
                TotalCount = total,
                Data = list,
            };
        }
    }
}