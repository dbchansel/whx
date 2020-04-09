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
    public partial class VoteJoinEdit : Web.UI.ManagePage
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
                if (id != 0)
                    ShowInfo(id);
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
                JscriptMsg("修改成功！", "VoteJoinPage.aspx?VoteId=" + VoteId.ToString(), "parent.loadMenuTree");
            }
            else if (action == DTEnums.ActionEnum.Add.ToString())
            {
                if (!DoAdd())
                {
                    JscriptMsg("保存过程中发生错误！", "");
                    return;
                }
                JscriptMsg("新增成功", "VoteJoinPage.aspx?VoteId=" + VoteId.ToString(), "parent.loadMenuTree");
            }
        }

        #region 增加操作=================================
        private bool DoAdd()
        {
            try
            {
                Model.VoteJoin model = new Model.VoteJoin();
                BLL.VoteJoin bll = new BLL.VoteJoin();
                model.VoteId = this.VoteId;
                model.JoinNumber = bll.GetJoinNum(VoteId).ToString();
                model.JoinName = JoinName.Text.Trim();
                model.JoinTel = JoinTel.Text.Trim();
                model.JoinAddress = JoinAddress.Text.Trim();
                model.JoinImg1 = JoinImg1.Text.Trim();
                model.JoinImg2 = JoinImg2.Text.Trim();
                model.JoinImg3 = JoinImg3.Text.Trim();
                model.JoinImg4 = JoinImg4.Text.Trim();
                model.JoinImg5 = JoinImg5.Text.Trim();
                model.JoinImg6 = JoinImg6.Text.Trim();
                model.JoinImg7 = JoinImg7.Text.Trim();
                model.JoinImg8 = JoinImg8.Text.Trim();
                model.JoinImg9 = JoinImg9.Text.Trim();
                model.JoinImg10 = JoinImg10.Text.Trim();
                model.DisplayImg = DisplayImg.Text.Trim();
                model.VoteNum = 0;
                model.GiftNum = "0";
                model.VisualNum = int.Parse(VisualNum.Text.Trim());
                model.JoinContent = JoinContent.Value;
                model.JoinSta = 1;
                model.IsLock = int.Parse(IsLock.Text.Trim());
             
                //       model.SignUp_MinPic = int.Parse(SignUp_MinPic.Text.Trim());
                model.CreateDate = DateTime.Now;
                model.CreateUserId = Utils.GetCookie("CreateUserId");
                if (bll.Add(model) > 0)
                {
                    BLL.Vote bll1 = new BLL.Vote();
                    Model.Vote model1 = bll1.GetModel(VoteId);
                    model1.JoinMemberNum++;
                    if (bll1.Update(model1))
                    {
                        return true;
                    }
                    return false;
                }
                else
                    return false;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
        #endregion
        #region 修改操作=================================
        private bool DoEdit(int _id)
        {
            try
            {

                BLL.VoteJoin bll = new BLL.VoteJoin();
                Model.VoteJoin model = bll.GetModel(_id);
                model.JoinName = JoinName.Text.Trim();
                model.JoinTel = JoinTel.Text.Trim();
                model.JoinAddress = JoinAddress.Text.Trim();
                model.JoinImg1 = JoinImg1.Text.Trim();
                model.JoinImg2 = JoinImg2.Text.Trim();
                model.JoinImg3 = JoinImg3.Text.Trim();
                model.JoinImg4 = JoinImg4.Text.Trim();
                model.JoinImg5 = JoinImg5.Text.Trim();
                model.JoinImg6 = JoinImg6.Text.Trim();
                model.JoinImg7 = JoinImg7.Text.Trim();
                model.JoinImg8 = JoinImg8.Text.Trim();
                model.JoinImg9 = JoinImg9.Text.Trim();
                model.JoinImg10 = JoinImg10.Text.Trim();
                model.DisplayImg = DisplayImg.Text.Trim();
                model.VisualNum = int.Parse(VisualNum.Text.Trim());
                model.JoinContent = JoinContent.Value;
                model.IsLock = int.Parse(IsLock.Text.Trim());

                if (bll.Update(model))
                {
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
        #region 赋值操作=================================
        private void ShowInfo(int _id)
        {
            BLL.VoteJoin bll = new BLL.VoteJoin();
            Model.VoteJoin model = bll.GetModel(_id);
            //model1.BuildDate.ToString("yyyy-MM-dd HH:mm:ss");
            JoinNumber.Text = model.JoinNumber;
            JoinName.Text = model.JoinName;
            JoinTel.Text = model.JoinTel;
            JoinAddress.Text = model.JoinAddress;
            JoinImg1.Text = model.JoinImg1;
            JoinImg2.Text = model.JoinImg2;
            JoinImg3.Text = model.JoinImg3;
            JoinImg4.Text = model.JoinImg4;
            JoinImg5.Text = model.JoinImg5;
            JoinImg6.Text = model.JoinImg6;
            JoinImg7.Text = model.JoinImg7;
            JoinImg8.Text = model.JoinImg8;
            JoinImg9.Text = model.JoinImg9;
            JoinImg10.Text = model.JoinImg10;
            DisplayImg.Text = model.DisplayImg;
            VoteNum.Text = model.VoteNum.ToString();
            GiftNum.Text = model.GiftNum.ToString();
            VisualNum.Text = model.VisualNum.ToString();
            JoinContent.Value = model.JoinContent.ToString();
            IsLock.Text = model.IsLock.ToString();
        }
        #endregion
    }
}