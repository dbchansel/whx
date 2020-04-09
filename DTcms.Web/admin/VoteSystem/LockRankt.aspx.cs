using System;
using System.Data;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTcms.Common;

namespace DTcms.Web.admin.VoteSystem
{
    public partial class LockRankt : System.Web.UI.Page
    {
        protected int voteid = 0;
        private Model.Vote _Vote = new Model.Vote();
        private Model.VoteJoin _VoteJoin = new Model.VoteJoin();
        protected string urlstr = string.Empty;
        protected int type = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            voteid = DTRequest.GetQueryInt("id");
            type = DTRequest.GetQueryInt("type");
            if (!Page.IsPostBack)
            {
                //是否开启
                this.OpenLockRank.Items.Add(new ListItem("否", "0"));
                this.OpenLockRank.Items.Add(new ListItem("是", "1"));

                //
                DataTable dt1 = new BLL.VoteJoin().GetAllList(voteid.ToString());
                this.User1Id.Items.Add(new ListItem("--不设置--", "-1"));
                this.User2Id.Items.Add(new ListItem("--不设置--", "-1"));
                this.User3Id.Items.Add(new ListItem("--不设置--", "-1"));
                for (int i = 0; i < dt1.Rows.Count; i++)
                {
                    this.User1Id.Items.Add(new ListItem(dt1.Rows[i]["JoinName"].ToString(), dt1.Rows[i]["id"].ToString()));
                    this.User2Id.Items.Add(new ListItem(dt1.Rows[i]["JoinName"].ToString(), dt1.Rows[i]["id"].ToString()));
                    this.User3Id.Items.Add(new ListItem(dt1.Rows[i]["JoinName"].ToString(), dt1.Rows[i]["id"].ToString()));
                }
                
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Model.Vote v = new BLL.Vote().GetModel(voteid);
            if (v != null)
            {
                v.User1Id = int.Parse(User1Id.SelectedValue.Trim());
                v.User2Id = int.Parse(User2Id.SelectedValue.Trim());
                v.User3Id = int.Parse(User3Id.SelectedValue.Trim());
            }
        }
    }
}