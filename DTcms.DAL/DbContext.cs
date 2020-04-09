using System;
using System.Data;
using System.Text;
using System.Reflection;
using System.Collections.Generic;
using System.Data.SqlClient;
using DTcms.DBUtility;
using DTcms.Common;

namespace DTcms.DAL
{
    /// <summary>
    /// 数据访问类:文章内容
    /// </summary>
    public partial class DbContext
    {
        /// <summary>
        /// 获得前几行数据
        /// </summary>
        public DataTable getValueBySql(string sqlStr)
        {
            return DbHelperSQL.Query(sqlStr.ToString()).Tables[0];
        }
    }
}

