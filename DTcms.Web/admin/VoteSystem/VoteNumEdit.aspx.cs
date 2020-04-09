using System;
using System.Text;
using System.Text.RegularExpressions;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;
using DTcms.Common;


namespace DTcms.Web.admin.VoteSystem
{
    public partial class VoteNumEdit : Web.UI.ManagePage
    {
        private string action = DTEnums.ActionEnum.Add.ToString(); //操作类型
        private int id = 0; //内容ID
        private int VoteId = 0; //活动ID
        public string curId = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            action = DTRequest.GetQueryString("action");
            id = DTRequest.GetQueryInt("id");
            VoteId = DTRequest.GetQueryInt("VoteId");
            curId = id.ToString();
            if (!Page.IsPostBack)
            {
                Model.VoteJoin vj = new BLL.VoteJoin().GetModel(this.id);
                curSetNum.Text = vj.VoteNum.ToString();
                curSetBrowseNum.Text = vj.BrowseNum.ToString();
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (action == DTEnums.ActionEnum.Edit.ToString()) //修改
            {
                if (!DoEdit(this.id))
                {
                    JscriptMsg("保存过程中发生错误！", "");
                    return;
                }
                JscriptMsg("设置成功！", "VoteJoinPage.aspx?VoteId=" + VoteId.ToString(), "parent.loadMenuTree");
            }
        }
        #region 修改操作=================================
        private bool DoEdit(int _id)
        {
            try
            {

                BLL.VoteJoin bll = new BLL.VoteJoin();
                Model.VoteJoin model = bll.GetModel(_id);

                model.VoteNum += int.Parse(SetNum.Text.Trim());
                model.BrowseNum += int.Parse(SetBrowseNum.Text.Trim());
                if (bll.Update(model))
                {
                    BLL.VoteRecord bllRecord = new BLL.VoteRecord();
                    Model.VoteRecord vr = new Model.VoteRecord();
                    vr.PointId = _id;
                    vr.SetVoteNum = int.Parse(SetNum.Text.Trim());
                    vr.VoteType = 1;
                    vr.VoteRecordId = Utils.GetCookie("AdminUserId");
                    vr.VotePlatform = "管理后台管理员增加";
                    if (bllRecord.Add(vr) > 0)
                    {

                    }
                    
                    return true;
                }
                else
                    return false;
            }
            catch
            {
                return false;
            }
            return false;
        }
        #endregion
    }
}