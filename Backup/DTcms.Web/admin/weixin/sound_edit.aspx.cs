﻿using System;
using System.Data;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTcms.Common;

namespace DTcms.Web.admin.weixin
{
    public partial class sound_edit : Web.UI.ManagePage
    {
        private string action = DTEnums.ActionEnum.Add.ToString(); //操作类型
        private int id = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            string _action = DTRequest.GetQueryString("action");

            if (!string.IsNullOrEmpty(_action) && _action == DTEnums.ActionEnum.Edit.ToString())
            {
                this.action = DTEnums.ActionEnum.Edit.ToString();//修改类型
                this.id = DTRequest.GetQueryInt("id");
                if (this.id == 0)
                {
                    JscriptMsg("传输参数不正确！", "back");
                    return;
                }
                if (!new BLL.weixin_request_rule().Exists(this.id))
                {
                    JscriptMsg("记录不存在或已删除！", "back");
                    return;
                }
            }
            if (!Page.IsPostBack)
            {
                ChkAdminLevel("weixin_response_sound", DTEnums.ActionEnum.View.ToString()); //检查权限
                TreeBind();
                if (action == DTEnums.ActionEnum.Edit.ToString()) //修改
                {
                    ShowInfo(this.id);
                }
            }
        }

        #region 绑定公众账户=============================
        private void TreeBind()
        {
            BLL.weixin_account bll = new BLL.weixin_account();
            DataTable dt = bll.GetList(0, "", "sort_id asc,id desc").Tables[0];

            this.ddlAccountId.Items.Clear();
            this.ddlAccountId.Items.Add(new ListItem("请选择公众账户", ""));
            foreach (DataRow dr in dt.Rows)
            {
                this.ddlAccountId.Items.Add(new ListItem(dr["name"].ToString(), dr["id"].ToString()));
            }
        }
        #endregion

        #region 赋值操作=================================
        private void ShowInfo(int _id)
        {
            BLL.weixin_request_rule bll = new BLL.weixin_request_rule();
            Model.weixin_request_rule model = bll.GetModel(_id);

            ddlAccountId.SelectedValue = model.account_id.ToString();
            ddlAccountId.Enabled = false;
            txtSortId.Text = model.sort_id.ToString();
            txtKeywords.Text = model.keywords;
            rblIsLikeQuery.SelectedValue = model.is_like_query.ToString();
            txtTitle.Text = model.contents[0].title;
            txtImgUrl.Text = model.contents[0].img_url;
            txtMediaUrl.Text = model.contents[0].media_url;
            txtContent.Text = model.contents[0].content;
        }
        #endregion

        #region 增加操作=================================
        private bool DoAdd(out string errmsg)
        {
            Model.weixin_request_rule model = new Model.weixin_request_rule();
            BLL.weixin_request_rule bll = new BLL.weixin_request_rule();

            model.name = "语音回复";
            model.request_type = 1;
            model.response_type = 3;
            model.account_id = Utils.StrToInt(ddlAccountId.SelectedValue, 0);
            model.keywords = txtKeywords.Text.Trim();
            model.is_like_query = Utils.StrToInt(rblIsLikeQuery.SelectedValue, 0);
            model.sort_id = Utils.StrToInt(txtSortId.Text.Trim(), 99);
            List<Model.weixin_request_content> ls = new List<Model.weixin_request_content>();
            //上传素材到微信服务器
            string mediaId = new API.Weixin.Common.CRMComm().UploadForeverMedia(model.account_id, Utils.GetMapPath(txtImgUrl.Text.Trim()), out errmsg);
            if (!string.IsNullOrEmpty(errmsg))
            {
                return false;
            }
            ls.Add(new Model.weixin_request_content()
            {
                account_id = model.account_id,
                title = txtTitle.Text.Trim(),
                img_url = txtImgUrl.Text.Trim(),
                media_id = mediaId,
                media_url = txtMediaUrl.Text.Trim(),
                meida_hd_url = txtMediaUrl.Text.Trim(),
                content = txtContent.Text.Trim()
            });
            model.contents = ls;

            if (bll.Add(model) > 0)
            {
                AddAdminLog(DTEnums.ActionEnum.Add.ToString(), "添加微信语音回复，关健字:" + model.keywords); //记录日志
                errmsg = string.Empty;
                return true;
            }
            errmsg = "保存过程中出错！";
            return false;
        }
        #endregion

        #region 修改操作=================================
        private bool DoEdit(int _id, out string errmsg)
        {
            API.Weixin.Common.CRMComm wxComm = new API.Weixin.Common.CRMComm();
            BLL.weixin_request_rule bll = new BLL.weixin_request_rule();
            Model.weixin_request_rule model = bll.GetModel(_id);

            model.account_id = Utils.StrToInt(ddlAccountId.SelectedValue, 0);
            model.keywords = txtKeywords.Text.Trim();
            model.is_like_query = Utils.StrToInt(rblIsLikeQuery.SelectedValue, 0);
            model.sort_id = Utils.StrToInt(txtSortId.Text.Trim(), 99);
            //判断是否需要重新上传素材
            string mediaId = model.contents[0].media_id;
            if (model.contents[0].img_url != txtImgUrl.Text.Trim())
            {
                if (!string.IsNullOrEmpty(mediaId))
                {
                    wxComm.DeleteForeverMedia(model.account_id, mediaId, out errmsg); //删除永久素材
                }
                mediaId = wxComm.UploadForeverMedia(model.account_id, Utils.GetMapPath(txtImgUrl.Text.Trim()), out errmsg); //重新上传素材
            }

            List<Model.weixin_request_content> ls = new List<Model.weixin_request_content>();
            ls.Add(new Model.weixin_request_content()
            {
                account_id = model.account_id,
                rule_id = model.id,
                title = txtTitle.Text.Trim(),
                img_url = txtImgUrl.Text.Trim(),
                media_id = mediaId,
                media_url = txtMediaUrl.Text.Trim(),
                meida_hd_url = txtMediaUrl.Text.Trim(),
                content = txtContent.Text.Trim()
            });
            model.contents = ls;

            if (bll.Update(model))
            {
                AddAdminLog(DTEnums.ActionEnum.Edit.ToString(), "修改微信语音回复，关健字:" + model.keywords); //记录日志
                errmsg = string.Empty;
                return true;
            }
            errmsg = "保存过程中出错！";
            return false;
        }
        #endregion

        //保存
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string errmsg = string.Empty;
            if (action == DTEnums.ActionEnum.Edit.ToString()) //修改
            {
                ChkAdminLevel("weixin_response_sound", DTEnums.ActionEnum.Edit.ToString()); //检查权限
                if (DoEdit(this.id, out errmsg))
                {
                    JscriptMsg("修改语音回复成功！", "sound_list.aspx");
                    return;
                }
            }
            else //添加
            {
                ChkAdminLevel("weixin_response_sound", DTEnums.ActionEnum.Add.ToString()); //检查权限
                if (DoAdd(out errmsg))
                {
                    JscriptMsg("添加语音回复成功！", "sound_list.aspx");
                    return;
                }
            }
            JscriptMsg("保存错误：" + errmsg, string.Empty);
            return;
        }

    }
}