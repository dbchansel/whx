﻿using System;
using System.Collections.Generic;
using System.Web;
using System.Text;
using DTcms.Common;
using System.Data;

namespace DTcms.Web.UI.Page
{
    public partial class record_show : Web.UI.BasePage
    {
        protected string channel = string.Empty; //频道名称
        protected int id;
        protected string page = string.Empty;
        protected Model.article model = new Model.article();
        protected string is_record = string.Empty;

        /// <summary>
        /// 重写虚方法,此方法将在Init事件前执行
        /// </summary>
        protected override void ShowPage()
        {
            this.Init += new EventHandler(article_show_Init);
        }

        /// <summary>
        /// OnInit事件,让频道名称变量先赋值
        /// </summary>
        void article_show_Init(object sender, EventArgs e)
        {
            id = DTRequest.GetQueryInt("id");
            page = DTRequest.GetQueryString("page");
            string localUrl = System.Web.HttpContext.Current.Request.Url.ToString();
            is_record = DTRequest.GetQueryString("record");
            BLL.article bll = new BLL.article();

            if (id > 0) //如果ID获取到，将使用ID
            {
                if (!bll.ArticleExists(channel, id))
                {
                    HttpContext.Current.Response.Redirect(linkurl("error", "?msg=" + Utils.UrlEncode("出错啦，您要浏览的页面不存在或已删除！")));
                    return;
                }
                model = bll.ArticleModel(channel, id);
            }
            else if (!string.IsNullOrEmpty(page)) //否则检查设置的别名
            {
                if (!bll.ArticleExists(channel, page))
                {
                    HttpContext.Current.Response.Redirect(linkurl("error", "?msg=" + Utils.UrlEncode("出错啦，您要浏览的页面不存在或已删除！")));
                    return;
                }
                model = bll.ArticleModel(channel, page);
            }
            else
            {
                return;
            }
            //跳转URL
            if (model.link_url != null)
            {
                model.link_url = model.link_url.Trim();
            }
            if (!string.IsNullOrEmpty(model.link_url))
            {
                HttpContext.Current.Response.Redirect(model.link_url);
            }
        }

        protected string getRecordType(string type)
        {
            if (type == "1")
            {
                return "<font style='color:#67C23A'>进</font>";
            }
            else
                return "<font style='color:#409EFF'>出</font>";
        }

        protected string getRecordMoney(string type,string sale_prices,string real_prices)
        {
            if (type == "1")
            {
                return "<font style='color:#67C23A'>" + real_prices + "</font>";
            }
            else
                return "<font style='color:#409EFF'>" + sale_prices + "</font>";
        }
        protected bool saveRecord(string prices, string trannsform_type, string remarks)
        {
            return true;
        }

        protected DataTable getRecord()
        {
            DataTable dt = new BLL.erp_record_Info().GetAllList(id.ToString());

            return dt;
        }

        /// <summary>
        /// 获取上一条下一条的链接
        /// </summary>
        /// <param name="urlkey">urlkey</param>
        /// <param name="type">-1代表上一条，1代表下一条</param>
        /// <param name="defaultvalue">默认文本</param>
        /// <param name="callIndex">是否使用别名，0使用ID，1使用别名</param>
        /// <returns>A链接</returns>
        protected string get_prevandnext_article(string urlkey, int type, string defaultvalue, int callIndex)
        {
            string symbol = (type == -1 ? "<" : ">");
            BLL.article bll = new BLL.article();
            string str = string.Empty;
            str = " and category_id=" + model.category_id;

            string orderby = type == -1 ? "id desc" : "id asc";
            DataSet ds = bll.ArticleList(channel, 1, "channel_id=" + model.channel_id + " " + str + " and status=0 and Id" + symbol + id, orderby);
            if (ds == null || ds.Tables[0].Rows.Count <= 0)
            {
                return defaultvalue;
            }
            if (callIndex == 1 && !string.IsNullOrEmpty(ds.Tables[0].Rows[0]["call_index"].ToString()))
            {
                return "<a href=\"" + linkurl(urlkey, ds.Tables[0].Rows[0]["call_index"].ToString()) + "\">" + ds.Tables[0].Rows[0]["title"] + "</a>";
            }
            return "<a href=\"" + linkurl(urlkey, ds.Tables[0].Rows[0]["id"].ToString()) + "\">" + ds.Tables[0].Rows[0]["title"] + "</a>";
        }
    }
}
