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
    public partial class VoteAutoEdit : Web.UI.ManagePage
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
            if (action == "") //修改
            {
                if (!DoEdit(this.id))
                {
                    JscriptMsg("保存过程中发生错误！", "");
                    return;
                }
                JscriptMsg("修改成功！", "VoteAutoList_Page.aspx?VoteId=" + curId.ToString(), "parent.loadMenuTree");
            }
            else if (action == DTEnums.ActionEnum.Add.ToString())
            {
                if (!DoAdd())
                {
                    JscriptMsg("保存过程中发生错误！", "");
                    return;
                }
                JscriptMsg("新增成功", "VoteAutoList_Page.aspx?VoteId=" + curId.ToString(), "parent.loadMenuTree");
            }
        }

        #region 增加操作=================================
        private bool DoAdd()
        {
            try
            {
                Model.VoteAuto model = new Model.VoteAuto();
                BLL.VoteAuto bll = new BLL.VoteAuto();
                model.VoteId = this.VoteId;
                if (Status1.Checked)
                {
                    model.Status1 = 1;
                    model.JoinMembers = JoinMembers.Text.Trim();
                    model.PL = int.Parse(PL.Text.Trim());
                    model.AutoBG = Utils.StrToDateTime(AutoBG.Text.Trim());
                    model.AutoED = Utils.StrToDateTime(AutoED.Text.Trim());
                }
                else
                    model.Status1 = 0;

                if (Status2.Checked)
                {
                    model.PL2 = int.Parse(PL2.Text.Trim());
                    model.AutoBG2 = Utils.StrToDateTime(AutoBG2.Text.Trim());
                    model.AutoED2 = Utils.StrToDateTime(AutoED2.Text.Trim());
                    model.AutoRoles = pmfw1b.Text.Trim() + "_" + pmfw1e.Text.Trim() + ">" + psfw1b.Text.Trim() + "_" + psfw1e.Text.Trim() + ";" +
                                      pmfw2b.Text.Trim() + "_" + pmfw2e.Text.Trim() + ">" + psfw2b.Text.Trim() + "_" + psfw2e.Text.Trim() + ";" +
                                      pmfw3b.Text.Trim() + "_" + pmfw3e.Text.Trim() + ">" + psfw3b.Text.Trim() + "_" + psfw3e.Text.Trim() + ";" +
                                      pmfw4b.Text.Trim() + "_" + pmfw4e.Text.Trim() + ">" + psfw4b.Text.Trim() + "_" + psfw4e.Text.Trim() + "";
                }
                else
                    model.Status2 = 0;

                model.CreateDate = DateTime.Now;
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
                BLL.VoteAuto bll = new BLL.VoteAuto();
                Model.VoteAuto model = bll.GetModel(_id);
                if (Status1.Checked)
                {
                    model.Status1 = 1;
                    model.JoinMembers = JoinMembers.Text.Trim();
                    model.PL = int.Parse(PL.Text.Trim());
                    model.AutoBG = Utils.StrToDateTime(AutoBG.Text.Trim());
                    model.AutoED = Utils.StrToDateTime(AutoED.Text.Trim());
                }
                else
                    model.Status1 = 0;

                if (Status2.Checked)
                {
                    model.PL2 = int.Parse(PL2.Text.Trim());
                    model.AutoBG2 = Utils.StrToDateTime(AutoBG2.Text.Trim());
                    model.AutoED2 = Utils.StrToDateTime(AutoED2.Text.Trim());
                    model.AutoRoles = pmfw1b.Text.Trim() + "_" + pmfw1e.Text.Trim() + ">" + psfw1b.Text.Trim() + "_" + psfw1e.Text.Trim() + ";" +
                                      pmfw2b.Text.Trim() + "_" + pmfw2e.Text.Trim() + ">" + psfw2b.Text.Trim() + "_" + psfw2e.Text.Trim() + ";" +
                                      pmfw3b.Text.Trim() + "_" + pmfw3e.Text.Trim() + ">" + psfw3b.Text.Trim() + "_" + psfw3e.Text.Trim() + ";" +
                                      pmfw4b.Text.Trim() + "_" + pmfw4e.Text.Trim() + ">" + psfw4b.Text.Trim() + "_" + psfw4e.Text.Trim() + "";
                }
                else
                    model.Status2 = 0;

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
            BLL.VoteAuto bll = new BLL.VoteAuto();
            Model.VoteAuto model = bll.GetModel(_id);
            //model1.BuildDate.ToString("yyyy-MM-dd HH:mm:ss");
            JoinMembers.Text = model.JoinMembers;
            PL.Text = model.PL.ToString();
            PL2.Text = model.PL2.ToString();

            AutoBG.Text = model.AutoED.ToString();
            AutoED.Text = model.AutoED.ToString();
            AutoBG2.Text = model.AutoBG2.ToString();
            AutoED2.Text = model.AutoED2.ToString();

            if (model.Status1 == 1)
                Status1.Checked = true;
            else
                Status1.Checked = false;
            if (model.Status2 == 1)
                Status2.Checked = true;
            else
                Status2.Checked = false;

            string[] str = model.AutoRoles.Split(';');
            if (!string.IsNullOrEmpty(model.AutoRoles))
            {
                pmfw1b.Text = str[0].Split('>')[0].Split('_')[0].ToString();
                pmfw1e.Text = str[0].Split('>')[0].Split('_')[1].ToString();
                psfw1b.Text = str[0].Split('>')[1].Split('_')[0].ToString();
                psfw1b.Text = str[0].Split('>')[1].Split('_')[1].ToString();


                pmfw2b.Text = str[1].Split('>')[0].Split('_')[0].ToString();
                pmfw2e.Text = str[1].Split('>')[0].Split('_')[1].ToString();
                psfw2b.Text = str[1].Split('>')[1].Split('_')[0].ToString();
                psfw2b.Text = str[1].Split('>')[1].Split('_')[1].ToString();


                pmfw3b.Text = str[2].Split('>')[0].Split('_')[0].ToString();
                pmfw3e.Text = str[2].Split('>')[0].Split('_')[1].ToString();
                psfw3b.Text = str[2].Split('>')[1].Split('_')[0].ToString();
                psfw3b.Text = str[2].Split('>')[1].Split('_')[1].ToString();


                pmfw4b.Text = str[3].Split('>')[0].Split('_')[0].ToString();
                pmfw4e.Text = str[3].Split('>')[0].Split('_')[1].ToString();
                psfw4b.Text = str[3].Split('>')[1].Split('_')[0].ToString();
                psfw4b.Text = str[3].Split('>')[1].Split('_')[1].ToString();
            }
           
        }
        #endregion
    }
}