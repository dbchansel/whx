using System;
using System.Data;
using System.Collections.Generic;
using DTcms.Common;

namespace DTcms.BLL
{
    /// <summary>
    /// 文章内容
    /// </summary>
    public partial class DbContext
    {
        private readonly DAL.DbContext dal;

        public DataTable getValueBySql(string sqlStr)
        {
            return new DAL.DbContext().getValueBySql(sqlStr);
        }
    }
}