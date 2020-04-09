using System;
using System.IO;
using System.Drawing;
using System.Drawing.Imaging;
using System.Web;
using System.Web.SessionState;
using DTcms.Common;
using DTcms.Web.UI;
using System.Data;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;

namespace DTcms.Web.tools
{
    /// <summary>
    /// vue_ajax 的摘要说明
    /// </summary>
    public class vue_ajax : CommonData,IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            //检查管理员是否登录
            if (!new ManagePage().IsAdminLogin())
            {
                context.Response.Write("{\"status\": 0, \"msg\": \"尚未登录或已超时，请登录后操作！\"}");
                return;
            }
            //取得处事类型
            string action = DTRequest.GetQueryString("action");
            vuetext(context);

            context.Response.ContentType = "text/plain";
            context.Response.Write("Hello World");
        }
        private void vuetext(HttpContext context)
        {
            string ss = AESDecrypt(context.Request.Form[0].ToString()); 
            //JObject jo = (JObject)JsonConvert.DeserializeObject(AESDecrypt(context.Request.Form[0].ToString()));
            DataTable data = new DataTable();
            //1、添加列
            data.Columns.Add("Name", typeof(string)); //数据类型为 文本

            DataRow dr1 = data.NewRow();
            dr1["Name"] = "张三"; //通过索引赋值
            data.Rows.Add(dr1);

            object ret = new { pagedata = data };

            //JsonResult(context, ret);
            JsonResult(context, ret);
            //context.Response.Write("{\"status\": 0, \"msg\": \"不是远程附件地址！\"}");
            //return;
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}