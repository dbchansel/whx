using System;
using System.Data;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTcms.Common;


namespace DTcms.Web.admin.VoteSystem
{
    public partial class VoteActivityUrl : Web.UI.ManagePage
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
            if (voteid >0 )
            {
                if (type == 0)
                {
                    urlstr = "http://wtp.danni.fun/aspx/mobile/goVote.aspx?id=" + voteid;
                }
                else if (type == 1)
                {
                    urlstr = "	http://wtp.danni.fun/aspx/mobile/VoteMember.aspx?id=" + voteid;
                }

            }
        }
    }
}