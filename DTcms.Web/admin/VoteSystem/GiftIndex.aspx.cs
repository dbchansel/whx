using System;
using System.Text;
using System.Data;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTcms.Common;
using NPOI.HSSF.UserModel;
using System.IO;
using NPOI.SS.UserModel;

namespace DTcms.Web.admin.VoteSystem
{
    public partial class GiftIndex : Web.UI.ManagePage
    {
        protected int totalCount;
        protected int page;
        protected int pageSize;

        protected int site_id;
        protected int status;
        protected int payment_status;
        protected int express_status;
        protected string keywords = string.Empty;
        public static string VoteId = string.Empty;
        private static Model.Vote v = new Model.Vote();
        private string sta = "";

        protected void Page_Load(object sender, EventArgs e)
        {


            this.pageSize = GetPageSize(10); //每页数量
            if (!Page.IsPostBack)
            {
                sta = DTRequest.GetQueryString("sta");
                string stastr = "";
                if (sta != "--不限定--")
                {
                    stastr = " and status=" + ((sta == "已支付") ? "2" : "1");
                }
                //    v = new BLL.Vote().GetModel(int.Parse(VoteId));
                RptBind("id>0 " + stastr + " ", "add_time desc");
                DateDownList.Items.Add("--不限定--");

                DateDownList.Items.Add("已支付");
                DateDownList.Items.Add("未支付");

            }
        }
        protected void ddlDateTime_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Redirect(Utils.CombUrlTxt("GiftIndex.aspx", "sta={0}", DateDownList.SelectedValue));
        }
        #region 数据绑定=================================
        private void RptBind(string _strWhere, string _orderby)
        {
            this.page = DTRequest.GetQueryInt("page", 1);
            BLL.orders bll = new BLL.orders();
            this.rptList.DataSource = bll.GetList(this.pageSize, this.page, _strWhere, _orderby, out this.totalCount);
            this.rptList.DataBind();
            //绑定页码
            txtPageNum.Text = this.pageSize.ToString();
            string pageUrl = Utils.CombUrlTxt("GiftIndex.aspx", "page={0}", "__id__");
            PageContent.InnerHtml = Utils.OutPageList(this.pageSize, this.page, this.totalCount, pageUrl, 8);
        }
        #endregion

        #region 组合SQL查询语句==========================
        protected string CombSqlTxt(int _site_id, int _status, int _payment_status, int _express_status, string _keywords)
        {
            StringBuilder strTemp = new StringBuilder();
            if (_site_id > 0)
            {
                strTemp.Append(" and site_id=" + _site_id);
            }
            return strTemp.ToString();
        }

        protected string getHDTitle(string _voteid)
        {
            if (string.IsNullOrEmpty(_voteid))
                return "";
            int Pid = (new BLL.VoteJoin().GetModel(int.Parse(_voteid))).VoteId;
            return (new BLL.Vote().GetModel(Pid)).Activity_Title;
        }
        protected string getDPName(string _voteid)
        {
            if (string.IsNullOrEmpty(_voteid))
                return "";
            return (new BLL.VoteJoin().GetModel(int.Parse(_voteid))).JoinName; 
        }
        #endregion

        #region 返回用户每页数量=========================
        private int GetPageSize(int _default_size)
        {
            int _pagesize;
            if (int.TryParse(Utils.GetCookie("GiftIndex.aspx_page_size", "DTcmsPage"), out _pagesize))
            {
                if (_pagesize > 0)
                {
                    return _pagesize;
                }
            }
            return _default_size;
        }
        #endregion

        //设置分页数量
        protected void txtPageNum_TextChanged(object sender, EventArgs e)
        {
            int _pagesize;
            if (int.TryParse(txtPageNum.Text.Trim(), out _pagesize))
            {
                if (_pagesize > 0)
                {
                    Utils.WriteCookie("GiftIndex.aspx_page_size", "DTcmsPage", _pagesize.ToString(), 14400);
                }
            }
            Response.Redirect(Utils.CombUrlTxt("GiftIndex.aspx", "id={0}",VoteId));
        }
    }
}