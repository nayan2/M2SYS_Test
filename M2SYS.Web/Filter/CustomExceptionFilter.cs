using System;
using System.Net;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;

namespace M2SYS.Web.Filter
{
    public class CustomExceptionFilter: ExceptionFilterAttribute
    {
        public override void OnException(ExceptionContext context)
        {
            var exception = context.Exception.InnerException ?? context.Exception;
            context.HttpContext.Response.StatusCode = (int)HttpStatusCode.InternalServerError;
            context.Result = new JsonResult(new
            {
                errMsg = exception.Message, 
                detail = exception.StackTrace
            });
            base.OnException(context);
        }
    }
}