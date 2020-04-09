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
    public partial class VoteList_Page : Web.UI.ManagePage
    {
        protected int totalCount;
        protected int page;
        protected int pageSize;
        private static string dateCount;

        protected int site_id;
        protected int status;
        protected int payment_status;
        protected int express_status;
        protected string keywords = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            /*
            this.express_status = DTRequest.GetQueryInt("express_status");
                        */
            this.keywords = DTRequest.GetQueryString("keywords"); 
            //this.dateCount = DTRequest.GetQueryString("dateCount");
            string keyValue = this.keywords == "" ? "" : " and Activity_Title like '%"+ this.keywords + "%' ";
            if (!string.IsNullOrEmpty(dateCount))
            {
                if (dateCount == "-1")
                {

                }
                else {
                    keyValue += " and DateDiff(dd, Activity_VoteEDTime, getdate()) = " + dateCount + " ";
                }
            }

            this.pageSize = GetPageSize(10); //每页数量
            if (!Page.IsPostBack)
            {
                InitDateTimeList();
                RptBind("id>0 " + keyValue + " and Rules_VoteSta<>2", "CreateDate desc");
            }
        }

        private void InitDateTimeList()
        {
            DateDownList.Items.Add("--不限定--");
            for (int i = 0; i < 5; i++)
            {
                DateTime dt = DateTime.Now;
                ListItem li = new ListItem();
                dt = dt.AddDays(-i);
                DateDownList.Items.Add(new ListItem(dt.Year + "-" + dt.Month + "-" + dt.Day, i+""));
            }
            DateDownList.SelectedValue = dateCount;
        }

        #region 数据绑定=================================
        private void RptBind(string _strWhere, string _orderby)
        {
            this.page = DTRequest.GetQueryInt("page", 1);
            txtKeywords.Text = this.keywords;
            BLL.Vote bll = new BLL.Vote();
            DataTable dt = bll.GetList(this.pageSize, this.page, _strWhere, _orderby, out this.totalCount).Tables[0];
            dt.Columns.Add("EXDatetime", typeof(string)); //数据类型为 文本
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if(dt.Rows[i]["VoteSta"].ToString() != "2" && Utils.StrToDateTime(dt.Rows[i]["Activity_VoteEDTime"].ToString()) > DateTime.Now) 
                    dt.Rows[i]["EXDatetime"] = (Utils.StrToDateTime(dt.Rows[i]["Activity_VoteEDTime"].ToString()) - DateTime.Now).ToString();
            }
            this.rptList.DataSource = dt;
            this.rptList.DataBind();
            //绑定页码
            txtPageNum.Text = this.pageSize.ToString();
            string pageUrl = Utils.CombUrlTxt("VoteList_Page.aspx", "page={0}", "__id__");
            PageContent.InnerHtml = Utils.OutPageList(this.pageSize, this.page, this.totalCount, pageUrl, 8 );
        }
        protected string getAll(string id)
        {
            decimal gift = 0;
            DataTable dt = new BLL.VoteJoin().GetAllList(id);
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                DataTable dt2 = new BLL.orders().getAllGift(dt.Rows[i]["id"].ToString());
                for (int j = 0; j < dt2.Rows.Count; j++)
                {
                    if (dt2.Rows[j]["status"].ToString() == "2")
                    {
                        gift += Convert.ToDecimal(dt2.Rows[j]["order_amount"].ToString()); 
                    }
                }
            }
            return gift.ToString();
        }
        #endregion

        #region 组合SQL查询语句==========================
        protected string CombSqlTxt(int _site_id, int _status, int _payment_status, int _express_status, string _keywords)
        {
            return "";
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
            if (int.TryParse(Utils.GetCookie("VoteList_Page_page_size", "DTcmsPage"), out _pagesize))
            {
                if (_pagesize > 0)
                {
                    return _pagesize;
                }
            }
            return _default_size;
        }
        #endregion

        #region 返回订单状态=============================
        protected string GetOrderStatus(int _id)
        {
            string _title = string.Empty;
            Model.orders model = new BLL.orders().GetModel(_id);
            switch (model.status)
            {
                case 1: //如果是线下支付，支付状态为0，如果是线上支付，支付成功后会自动改变订单状态为已确认
                    if (model.payment_status > 0)
                    {
                        _title = "待付款";
                    }
                    else
                    {
                        _title = "待确认";
                    }
                    break;
                case 2: //如果订单为已确认状态，则进入发货状态
                    if (model.express_status > 1)
                    {
                        _title = "已发货";
                    }
                    else
                    {
                        _title = "待发货";
                    }
                    break;
                case 3:
                    _title = "交易完成";
                    break;
                case 4:
                    _title = "已取消";
                    break;
                case 5:
                    _title = "已作废";
                    break;
            }

            return _title;
        }
        #endregion

        //审核
        protected void btnAudit_Click_Copy(object sender, EventArgs e)
        {
            BLL.Vote bll = new BLL.Vote();
            Repeater rptList = this.rptList;
            for (int i = 0; i < rptList.Items.Count; i++)
            {
                int id = Convert.ToInt32(((HiddenField)rptList.Items[i].FindControl("hidId")).Value);
                CheckBox cb = (CheckBox)rptList.Items[i].FindControl("chkId");
                if (cb.Checked)
                {
                    Model.Vote mv = bll.GetModel(id);
                    if (mv != null)
                    {
                        mv.id = 0;
                        mv.VoteSta = 0;
                        mv.BrowseNum = 0;
                        mv.JoinMemberNum = 0;
                        mv.BrowseNum = 0;
                        mv.User1Id = 0;
                        mv.User2Id = 0;
                        mv.User3Id = 0;
                        mv.CreateDate = DateTime.Now;
                        int cc = new BLL.Vote().Add(mv);
                    }
                    AddAdminLog(DTEnums.ActionEnum.Audit.ToString(), "审核" + new BLL.Vote().GetModel(id).Activity_Title + "审核活动"); //记录日志
                }
            }

            JscriptMsg("批量审核成功！", Utils.CombUrlTxt("VoteList_Page.aspx", ""));
        }
        //审核
        protected void btnAudit_Click(object sender, EventArgs e)
        {
            BLL.Vote bll = new BLL.Vote();
            Repeater rptList = this.rptList;
            for (int i = 0; i < rptList.Items.Count; i++)
            {
                int id = Convert.ToInt32(((HiddenField)rptList.Items[i].FindControl("hidId")).Value);
                CheckBox cb = (CheckBox)rptList.Items[i].FindControl("chkId");
                if (cb.Checked)
                {
                    bll.UpdateField(id, "Rules_VoteSta=1");
                    AddAdminLog(DTEnums.ActionEnum.Audit.ToString(), "审核" + new BLL.Vote().GetModel(id).Activity_Title + "审核活动"); //记录日志
                }
            }

            JscriptMsg("批量审核成功！", Utils.CombUrlTxt("VoteList_Page.aspx", ""));
        }
        //审核
        protected void btnAudit_ClickSC(object sender, EventArgs e)
        {
            BLL.Vote bll = new BLL.Vote();
            Repeater rptList = this.rptList;
            for (int i = 0; i < rptList.Items.Count; i++)
            {
                int id = Convert.ToInt32(((HiddenField)rptList.Items[i].FindControl("hidId")).Value);
                CheckBox cb = (CheckBox)rptList.Items[i].FindControl("chkId");
                if (cb.Checked)
                {
                    bll.UpdateField(id, "Rules_VoteSta=2");
                    AddAdminLog(DTEnums.ActionEnum.Audit.ToString(), "删除" + new BLL.Vote().GetModel(id).Activity_Title + "审核活动"); //记录日志
                }
            }

            JscriptMsg("批量删除成功！", Utils.CombUrlTxt("VoteList_Page.aspx", ""));
        }
        //开始
        protected void btnAudit_ClickKS(object sender, EventArgs e)
        {
            BLL.Vote bll = new BLL.Vote();
            Repeater rptList = this.rptList;
            for (int i = 0; i < rptList.Items.Count; i++)
            {
                int id = Convert.ToInt32(((HiddenField)rptList.Items[i].FindControl("hidId")).Value);
                CheckBox cb = (CheckBox)rptList.Items[i].FindControl("chkId");
                if (cb.Checked)
                {
                    if (new BLL.Vote().isAllowNum(id))
                    {
                        bll.UpdateField(id, "VoteSta=1");
                        AddAdminLog(DTEnums.ActionEnum.Audit.ToString(), "活动开始" + new BLL.Vote().GetModel(id).Activity_Title + "审核活动"); //记录日志

                        JscriptMsg("批量审核成功！", Utils.CombUrlTxt("VoteList_Page.aspx", ""));
                    }
                    else
                        JscriptMsg("批量审核失败！", Utils.CombUrlTxt("VoteList_Page.aspx", ""));

                }
            }

        }
        //结束
        protected void btnAudit_ClickJS(object sender, EventArgs e)
        {
            BLL.Vote bll = new BLL.Vote();
            Repeater rptList = this.rptList;
            for (int i = 0; i < rptList.Items.Count; i++)
            {
                int id = Convert.ToInt32(((HiddenField)rptList.Items[i].FindControl("hidId")).Value);
                CheckBox cb = (CheckBox)rptList.Items[i].FindControl("chkId");
                if (cb.Checked)
                {
                    bll.UpdateField(id, "VoteSta=2");
                    AddAdminLog(DTEnums.ActionEnum.Audit.ToString(), "活动结束" + new BLL.Vote().GetModel(id).Activity_Title + "审核活动"); //记录日志
                }
            }

            JscriptMsg("批量审核成功！", Utils.CombUrlTxt("VoteList_Page.aspx", ""));
        }

        //关健字查询
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            Response.Redirect(Utils.CombUrlTxt("VoteList_Page.aspx", "keywords={0}",txtKeywords.Text));
        }


        //发货状态
        protected void ddlDateTime_SelectedIndexChanged(object sender, EventArgs e)
        {
            int dateCount1 = DateDownList.SelectedIndex - 1 ;
            dateCount = dateCount1.ToString();
            Response.Redirect(Utils.CombUrlTxt("VoteList_Page.aspx", "dateCount={3}&keywords={4}",
                this.site_id.ToString(), this.status.ToString(), this.payment_status.ToString(), dateCount1.ToString(), this.keywords));
        }
        //设置分页数量
        protected void txtPageNum_TextChanged(object sender, EventArgs e)
        {
            int _pagesize;
            if (int.TryParse(txtPageNum.Text.Trim(), out _pagesize))
            {
                if (_pagesize > 0)
                {
                    Utils.WriteCookie("VoteList_Page_page_size", "DTcmsPage", _pagesize.ToString(), 14400);
                }
            }
            Response.Redirect(Utils.CombUrlTxt("VoteList_Page.aspx", "site_id={0}&status={1}&payment_status={2}&express_status={3}&keywords={4}",
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