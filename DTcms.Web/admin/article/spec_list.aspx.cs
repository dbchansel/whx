﻿using System;
using System.Text;
using System.Data;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTcms.Common;

namespace DTcms.Web.admin.article
{
    public partial class spec_list : Web.UI.ManagePage
    {
        protected int totalCount;
        protected int page;
        protected int pageSize;

        protected string keywords = string.Empty;
        protected int channel_id;
        protected string channel_name = string.Empty; //频道名称

        protected void Page_Load(object sender, EventArgs e)
        {
            this.channel_id = DTRequest.GetQueryInt("channel_id");
            this.channel_name = new BLL.site_channel().GetChannelName(this.channel_id); //取得频道名称
            this.keywords = DTRequest.GetQueryString("keywords");

            this.pageSize = GetPageSize(10); //每页数量

            if (this.channel_id == 0)
            {
                JscriptMsg("频道参数不正确！", "back");
                return;
            }
            if (!Page.IsPostBack)
            {
                ChkAdminLevel("channel_" + this.channel_name + "_spec", DTEnums.ActionEnum.View.ToString()); //检查权限
                RptBind("parent_id=0 and channel_id=" + channel_id.ToString() + CombSqlTxt(keywords), "sort_id asc,id desc");
            }
        }

        #region 数据绑定=================================
        private void RptBind(string _strWhere, string _orderby)
        {
            this.page = DTRequest.GetQueryInt("page", 1);
            txtKeywords.Text = this.keywords;
            BLL.article_spec bll = new BLL.article_spec();
            this.rptList.DataSource = bll.GetList(this.pageSize, this.page, _strWhere, _orderby, out this.totalCount);
            this.rptList.DataBind();

            //绑定页码
            txtPageNum.Text = this.pageSize.ToString();
            string pageUrl = Utils.CombUrlTxt("spec_list.aspx", "channel_id={0}&keywords={1}&page={2}", this.channel_id.ToString(), this.keywords, "__id__");
            PageContent.InnerHtml = Utils.OutPageList(this.pageSize, this.page, this.totalCount, pageUrl, 8);
        }
        #endregion

        #region 组合SQL查询语句==========================
        protected string CombSqlTxt(string _keywords)
        {
            StringBuilder strTemp = new StringBuilder();
            _keywords = _keywords.Replace("'", "");
            if (!string.IsNullOrEmpty(_keywords))
            {
                strTemp.Append(" and title like  '%" + _keywords + "%'");
            }

            return strTemp.ToString();
        }
        #endregion

        #region 返回每页数量=============================
        private int GetPageSize(int _default_size)
        {
            int _pagesize;
            if (int.TryParse(Utils.GetCookie("channel_spec_page_size", "DTcmsPage"), out _pagesize))
            {
                if (_pagesize > 0)
                {
                    return _pagesize;
                }
            }
            return _default_size;
        }
        #endregion

        //嵌套绑定
        protected void rptList_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            BLL.article_spec bll = new BLL.article_spec();
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                Repeater rptSpecList = (Repeater)e.Item.FindControl("rptSpecList");
                //找到分类Repeater关联的数据项 
                DataRowView drv = (DataRowView)e.Item.DataItem;
                //提取父ID 
                int parentId = Convert.ToInt32(drv["id"]);
                //根据分类ID查询并绑定所属频道 
                rptSpecList.DataSource = bll.GetList(0, "parent_id=" + parentId, "sort_id asc,id desc");
                rptSpecList.DataBind();
            }
        }

        //关健字查询
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            Response.Redirect(Utils.CombUrlTxt("spec_list.aspx", "channel_id={0}&keywords={1}", this.channel_id.ToString(), txtKeywords.Text));
        }

        //设置分页数量
        protected void txtPageNum_TextChanged(object sender, EventArgs e)
        {
            int _pagesize;
            if (int.TryParse(txtPageNum.Text.Trim(), out _pagesize))
            {
                if (_pagesize > 0)
                {
                    Utils.WriteCookie("channel_spec_page_size", "DTcmsPage", _pagesize.ToString(), 14400);
                }
            }
            Response.Redirect(Utils.CombUrlTxt("spec_list.aspx", "channel_id={0}&keywords={1}", this.channel_id.ToString(), this.keywords));
        }

        //保存排序
        protected void btnSave_Click(object sender, EventArgs e)
        {
            ChkAdminLevel("channel_" + this.channel_name + "_spec", DTEnums.ActionEnum.Edit.ToString()); //检查权限
            BLL.article_spec bll = new BLL.article_spec();
            for (int i = 0; i < rptList.Items.Count; i++)
            {
                int id = Convert.ToInt32(((HiddenField)rptList.Items[i].FindControl("hidId")).Value);
                int sortId;
                if (!int.TryParse(((TextBox)rptList.Items[i].FindControl("txtSortId")).Text.Trim(), out sortId))
                {
                    sortId = 99;
                }
                bll.UpdateField(id, "sort_id=" + sortId.ToString());
            }
            AddAdminLog(DTEnums.ActionEnum.Edit.ToString(), "保存商品规格排序"); //记录日志
            JscriptMsg("保存排序成功！", Utils.CombUrlTxt("spec_list.aspx", "channel_id={0}&keywords={1}", this.channel_id.ToString(), this.keywords));
        }

        //批量删除
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            ChkAdminLevel("channel_" + this.channel_name + "_spec", DTEnums.ActionEnum.Delete.ToString()); //检查权限
            BLL.article_spec bll = new BLL.article_spec();
            for (int i = 0; i < rptList.Items.Count; i++)
            {
                int id = Convert.ToInt32(((HiddenField)rptList.Items[i].FindControl("hidId")).Value);
                CheckBox cb = (CheckBox)rptList.Items[i].FindControl("chkId");
                if (cb.Checked)
                {
                    bll.Delete(id);
                }
            }
            AddAdminLog(DTEnums.ActionEnum.Delete.ToString(), "删除商品规格"); //记录日志
            JscriptMsg("删除规格成功！", Utils.CombUrlTxt("spec_list.aspx", "channel_id={0}&keywords={1}", this.channel_id.ToString(), this.keywords));
        }

    }
}