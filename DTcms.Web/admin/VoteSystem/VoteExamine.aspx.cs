using System;
using System.Text;
using System.Data;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTcms.Common;

namespace DTcms.Web.admin.VoteSystem
{
    public partial class VoteExamine : Web.UI.ManagePage
    {
        protected int totalCount;
        protected int page;
        protected int pageSize;

        protected int site_id;
        protected int status;
        protected int payment_status;
        protected int express_status;
        protected string keywords = string.Empty;
        public string VoteId = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            /*
            this.express_status = DTRequest.GetQueryInt("express_status");
                        */
            this.keywords = DTRequest.GetQueryString("keywords");


            this.pageSize = GetPageSize(10); //每页数量
            if (!Page.IsPostBack)
            {
                RptBind(" JoinSta=0 ", "CreateDate desc");
            }
        }

        #region 数据绑定=================================
        private void RptBind(string _strWhere, string _orderby)
        {
            this.page = DTRequest.GetQueryInt("page", 1);
            txtKeywords.Text = this.keywords;
            BLL.VoteJoin bll = new BLL.VoteJoin();
            this.rptList.DataSource = bll.GetList(this.pageSize, this.page, _strWhere, _orderby, out this.totalCount);
            this.rptList.DataBind();

            //绑定页码
            txtPageNum.Text = this.pageSize.ToString();
            string pageUrl = Utils.CombUrlTxt("VoteExamine.aspx", "page={0}", "__id__");
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
        #endregion

        #region 返回用户每页数量=========================
        private int GetPageSize(int _default_size)
        {
            int _pagesize;
            if (int.TryParse(Utils.GetCookie("VoteExamine_page_size", "DTcmsPage"), out _pagesize))
            {
                if (_pagesize > 0)
                {
                    return _pagesize;
                }
            }
            return _default_size;
        }
        #endregion

        //审核
        protected void btnAudit_Click(object sender, EventArgs e)
        {
            BLL.VoteJoin bll = new BLL.VoteJoin();
            Repeater rptList = this.rptList;
            for (int i = 0; i < rptList.Items.Count; i++)
            {
                int id = Convert.ToInt32(((HiddenField)rptList.Items[i].FindControl("hidId")).Value);
                CheckBox cb = (CheckBox)rptList.Items[i].FindControl("chkId");
                if (cb.Checked)
                {
                    bll.UpdateField(id, "JoinSta=1");
                    AddAdminLog(DTEnums.ActionEnum.Audit.ToString(), "审核"); //记录日志
                }
            }

            JscriptMsg("批量审核成功！", Utils.CombUrlTxt("VoteExamine.aspx", "VoteId={0}", this.VoteId.ToString()));
        }
        //锁定
        protected void btnAudit_ClickSD(object sender, EventArgs e)
        {
            BLL.VoteJoin bll = new BLL.VoteJoin();
            Repeater rptList = this.rptList;
            for (int i = 0; i < rptList.Items.Count; i++)
            {
                int id = Convert.ToInt32(((HiddenField)rptList.Items[i].FindControl("hidId")).Value);
                CheckBox cb = (CheckBox)rptList.Items[i].FindControl("chkId");
                if (cb.Checked)
                {
                    bll.UpdateField(id, "IsLock=1");
                    AddAdminLog(DTEnums.ActionEnum.Audit.ToString(), "锁定" + new BLL.Vote().GetModel(int.Parse(VoteId)).Activity_Title + ":审核参加客户:" + new BLL.VoteJoin().GetModel(id).JoinName); //记录日志
                }
            }

            JscriptMsg("批量审核成功！", Utils.CombUrlTxt("VoteExamine.aspx", "VoteId={0}", this.VoteId.ToString()));
        }

        //关健字查询
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            Response.Redirect(Utils.CombUrlTxt("VoteExamine.aspx.aspx", "site_id={0}&status={1}&payment_status={2}&express_status={3}&keywords={4}",
                this.site_id.ToString(), this.status.ToString(), this.payment_status.ToString(), this.express_status.ToString(), txtKeywords.Text));
        }

        //设置分页数量
        protected void txtPageNum_TextChanged(object sender, EventArgs e)
        {
            int _pagesize;
            if (int.TryParse(txtPageNum.Text.Trim(), out _pagesize))
            {
                if (_pagesize > 0)
                {
                    Utils.WriteCookie("VoteExamine_page_size", "DTcmsPage", _pagesize.ToString(), 14400);
                }
            }
            Response.Redirect(Utils.CombUrlTxt("VoteExamine.aspx", "site_id={0}&status={1}&payment_status={2}&express_status={3}&keywords={4}",
                this.site_id.ToString(), this.status.ToString(), this.payment_status.ToString(), this.express_status.ToString(), this.keywords));
        }

        //批量删除
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            return;
            int sucCount = 0;
            int errorCount = 0;
            BLL.orders bll = new BLL.orders();
            for (int i = 0; i < rptList.Items.Count; i++)
            {
                int id = Convert.ToInt32(((HiddenField)rptList.Items[i].FindControl("hidId")).Value);
                CheckBox cb = (CheckBox)rptList.Items[i].FindControl("chkId");
                if (cb.Checked)
                {
                    if (bll.Delete(id))
                    {
                        sucCount += 1;
                    }
                    else
                    {
                        errorCount += 1;
                    }
                }
            }
        }

    }
}