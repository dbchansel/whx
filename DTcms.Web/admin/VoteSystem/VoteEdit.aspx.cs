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
    public partial class VoteEdit : Web.UI.ManagePage
    {
        private string action = DTEnums.ActionEnum.Add.ToString(); //操作类型
        private int id = 0; //内容ID
        public string curId = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            action = DTRequest.GetQueryString("action");
            id = DTRequest.GetQueryInt("id");
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
                JscriptMsg("修改成功！", "VoteList_Page.aspx", "parent.loadMenuTree");
            }
            else if(action == DTEnums.ActionEnum.Add.ToString())
            {
                if (!DoAdd())
                {
                    JscriptMsg("保存过程中发生错误！", "");
                    return;
                }
                JscriptMsg("新增成功", "VoteList_Page.aspx", "parent.loadMenuTree");
            }
        }

        #region 增加操作=================================
        private bool DoAdd()
        {

            try
            {
                Model.Vote model = new Model.Vote();
                BLL.Vote bll = new BLL.Vote();

                model.Activity_Title = Activity_Title.Text.Trim();
                model.Activity_GMBGTime = Utils.StrToDateTime(Activity_GMBGTime.Text.Trim());
                model.Activity_GMEDTime = Utils.StrToDateTime(Activity_GMEDTime.Text.Trim());
                model.Activity_VoteBGTime = Utils.StrToDateTime(Activity_VoteBGTime.Text.Trim());
                model.Activity_VoteEDTime = Utils.StrToDateTime(Activity_VoteEDTime.Text.Trim());
                model.Activity_Remarks = Activity_Remarks.Text.Trim();
                model.Rules_VoteSta = int.Parse(Rules_VoteSta.Text.Trim());
                model.Rules_MinMember = int.Parse(Rules_MinMember.Text.Trim());
                model.Rules_PDUVotes = int.Parse(Rules_PDUVotes.Text.Trim());
                model.Rules_DPVotes = int.Parse(Rules_DPVotes.Text.Trim());
                model.Rules_MaxVotes = int.Parse(Rules_MaxVotes.Text.Trim());
                model.Rules_DateInterval = int.Parse(Rules_DateInterval.Text.Trim());
                model.Rules_MaxGift = int.Parse(Rules_MaxGift.Text.Trim());
                model.Rules_RemindSta = int.Parse(Rules_RemindSta.Text.Trim());
                model.Rules_AnonymousGift = int.Parse(Rules_AnonymousGift.Text.Trim());
                model.Rules_GiftSelf = int.Parse(Rules_GiftSelf.Text.Trim());
                model.Vote_Pic1 = Vote_Pic1.Text.Trim();
                model.Vote_Pic2 = Vote_Pic2.Text.Trim();
                model.Vote_Pic3 = Vote_Pic3.Text.Trim();
                model.Vote_Pic4 = Vote_Pic4.Text.Trim();
                model.Vote_Pic5 = Vote_Pic5.Text.Trim();
                model.Vote_SuccPopAds = Vote_SuccPopAds.Text.Trim();
                model.Vote_ActivityContent = Vote_ActivityContent.Value;
                model.Vote_PrizeContent = Vote_PrizeContent.Value;

                model.Surface_DisplayOrder = int.Parse(Surface_DisplayOrder.Text.Trim());
                model.Surface_BVolume = int.Parse(Surface_BVolume.Text.Trim());
                model.Surface_RankNum = int.Parse(Surface_RankNum.Text.Trim());
         //       model.SignUp_MinPic = int.Parse(SignUp_MinPic.Text.Trim());
                model.CreateDate = DateTime.Now;
                model.CreateUserId = Utils.GetCookie("CreateUserId");
                model.JoinMemberNum = 0;
                if (bll.Add(model) > 0)
                {
                    return true;
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
                BLL.Vote bll = new BLL.Vote();
                Model.Vote model = bll.GetModel(_id);

                model.Activity_Title = Activity_Title.Text.Trim();
                model.Activity_GMBGTime = Utils.StrToDateTime(Activity_GMBGTime.Text.Trim());
                model.Activity_GMEDTime = Utils.StrToDateTime(Activity_GMEDTime.Text.Trim());
                model.Activity_VoteBGTime = Utils.StrToDateTime(Activity_VoteBGTime.Text.Trim());
                model.Activity_VoteEDTime = Utils.StrToDateTime(Activity_VoteEDTime.Text.Trim());
                model.Activity_Remarks = Activity_Remarks.Text.Trim();
                model.Rules_MinMember = int.Parse(Rules_MinMember.Text.Trim());
                model.Rules_PDUVotes = int.Parse(Rules_PDUVotes.Text.Trim());
                model.Rules_DPVotes = int.Parse(Rules_DPVotes.Text.Trim());
                model.Rules_MaxVotes = int.Parse(Rules_MaxVotes.Text.Trim());
                model.Rules_DateInterval = int.Parse(Rules_DateInterval.Text.Trim());
                model.Rules_MaxGift = int.Parse(Rules_MaxGift.Text.Trim());
                model.Rules_RemindSta = int.Parse(Rules_RemindSta.Text.Trim());
                model.Rules_AnonymousGift = int.Parse(Rules_AnonymousGift.Text.Trim());
                model.Rules_GiftSelf = int.Parse(Rules_GiftSelf.Text.Trim());
                model.Vote_Pic1 = Vote_Pic1.Text.Trim();
                model.Vote_Pic2 = Vote_Pic2.Text.Trim();
                model.Vote_Pic3 = Vote_Pic3.Text.Trim();
                model.Vote_Pic4 = Vote_Pic4.Text.Trim();
                model.Vote_Pic5 = Vote_Pic5.Text.Trim();
                model.Vote_SuccPopAds = Vote_SuccPopAds.Text.Trim();
                model.Vote_ActivityContent = Vote_ActivityContent.Value;
                model.Vote_PrizeContent = Vote_PrizeContent.Value;

                model.Surface_DisplayOrder = int.Parse(Surface_DisplayOrder.Text.Trim());
                model.Surface_BVolume = int.Parse(Surface_BVolume.Text.Trim());
                model.Surface_RankNum = int.Parse(Surface_RankNum.Text.Trim());

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
            BLL.Vote bll = new BLL.Vote();
            Model.Vote model = bll.GetModel(_id);
            //model1.BuildDate.ToString("yyyy-MM-dd HH:mm:ss");
            Activity_Title.Text = model.Activity_Title;
            Activity_GMBGTime.Text = model.Activity_GMBGTime.ToString("yyyy-MM-dd HH:mm:ss");
            Activity_GMEDTime.Text = model.Activity_GMEDTime.ToString("yyyy-MM-dd HH:mm:ss");
            Activity_VoteBGTime.Text = model.Activity_VoteBGTime.ToString("yyyy-MM-dd HH:mm:ss");
            Activity_VoteEDTime.Text = model.Activity_VoteEDTime.ToString("yyyy-MM-dd HH:mm:ss");
            Activity_Remarks.Text = model.Activity_Remarks;
            Rules_MinMember.Text = model.Rules_MinMember.ToString();
            Rules_PDUVotes.Text = model.Rules_PDUVotes.ToString();
            Rules_DPVotes.Text = model.Rules_DPVotes.ToString();
            Rules_MaxVotes.Text = model.Rules_MaxVotes.ToString();
            Rules_DateInterval.Text = model.Rules_DateInterval.ToString();
            Rules_MaxGift.Text = model.Rules_MaxGift.ToString();
            Rules_RemindSta.Text = model.Rules_RemindSta.ToString();
            Rules_AnonymousGift.Text = model.Rules_AnonymousGift.ToString();
            Rules_GiftSelf.Text = model.Rules_GiftSelf.ToString();
            Vote_Pic1.Text = model.Vote_Pic1;
            Vote_Pic2.Text = model.Vote_Pic2;
            Vote_Pic3.Text = model.Vote_Pic3;
            Vote_Pic4.Text = model.Vote_Pic4;
            Vote_Pic5.Text = model.Vote_Pic5;
            Vote_SuccPopAds.Text = model.Vote_SuccPopAds;
            Vote_ActivityContent.Value = model.Vote_ActivityContent;
            Vote_PrizeContent.Value = model.Vote_PrizeContent;
            Surface_DisplayOrder.Text = model.Surface_DisplayOrder.ToString();
            Surface_BVolume.Text = model.Surface_BVolume.ToString();
            Surface_RankNum.Text = model.Surface_RankNum.ToString();          
        }
        #endregion
    }
}