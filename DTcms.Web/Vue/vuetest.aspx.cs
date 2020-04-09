using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json.Linq;

namespace DTcms.Web.Vue
{
    public partial class vuetest : Web.UI.ManagePage
    {
        /// <summary>
        /// 登录
        /// </summary>
        /// <param name="account"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        /// 
        [HttpPost]
        public void Login(JObject data)
        {
            //使用account和password验证用户
            string ss = "";
        }
    }
}