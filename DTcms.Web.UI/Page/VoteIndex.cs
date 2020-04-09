using System;
using System.Collections.Generic;
using System.Web;
using System.Text;
using DTcms.Common;
using System.Data;


namespace DTcms.Web.UI.Page
{
    public partial class VoteIndex : Web.UI.BasePage
    {
        protected string channel = string.Empty; //频道名称
        protected int id;
        protected string openid;
        protected string page = string.Empty;
        protected Model.Vote model = new Model.Vote();

        //投票状态
        protected string Activity_VoteBGTimeStr = string.Empty;
        protected string Activity_VoteEDTimeStr = string.Empty;
        protected string VoteStaStr = "0";
        protected string djsStr = string.Empty;

        private DataTable _PDataTable;

        //参加选手数
        protected int VoteJoinNum = 0;
        //总票数
        protected int VoteTicketNum = 0;
        //总浏览量
        protected int VoteBrowseNum = 0;

        //获取选手列表
        protected DataTable VoteJoinInfo = new DataTable();
        //排名
        protected DataTable _RankDataTable = new DataTable();
        protected DataTable _RankDataTable2 = new DataTable();
        /// <summary>
        /// 重写虚方法,此方法将在Init事件前执行
        /// </summary>
        protected override void ShowPage()
        {
            this.Init += new EventHandler(VoteShow);
        }

        /// <summary>
        /// OnInit事件,让频道名称变量先赋值
        /// </summary>
        void VoteShow(object sender, EventArgs e)
        {
            id = DTRequest.GetQueryInt("VoteId"); 
            openid = DTRequest.GetQueryString("openid");
            if (id == 0)
                return;
            BLL.Vote bll = new BLL.Vote();
            model = bll.GetModel(id);
            Activity_VoteBGTimeStr =  model.Activity_VoteBGTime.Year + "-" + model.Activity_VoteBGTime.Month + "-" +model.Activity_VoteBGTime.Day;
            Activity_VoteEDTimeStr = model.Activity_VoteEDTime.Year + "-" + model.Activity_VoteEDTime.Month + "-" + model.Activity_VoteEDTime.Day;
            VoteStaStr = (DateTime.Now > model.Activity_VoteEDTime) ? "1" : "0";
            djsStr = model.Activity_VoteEDTime.ToString();

            VoteJoinNum = model.JoinMemberNum;
            VoteBrowseNum = model.BrowseNum;
            BLL.VoteJoin vj = new BLL.VoteJoin();
            VoteJoinInfo = vj.GetList1(id);
            int VotepicNum = VoteJoinInfo.Rows.Count;
            VotepicNum = VotepicNum > 6 ? 6 : VotepicNum;
            for (int i = 0; i < VoteJoinInfo.Rows.Count; i++)
            {
                VoteTicketNum += int.Parse(VoteJoinInfo.Rows[i]["VoteNum"].ToString());
            }
            _RankDataTable = vj.GetList2(id);
            _RankDataTable2 = vj.GetList2(id);
            string ss = "";
        }
        private void InitRankDataTable2()
        {
            for (int i = 0; i < _RankDataTable2.Rows.Count; i++)
            {
                _RankDataTable2.Rows[i]["JoinName"] = _RankDataTable2.Rows[i]["JoinName"].ToString().Length > 9 ? _RankDataTable2.Rows[i]["JoinName"].ToString().Substring(0, 8).ToString() + ".." : _RankDataTable2.Rows[i]["JoinName"].ToString();
                _RankDataTable2.Rows[i]["JoinAddress"] = _RankDataTable2.Rows[i]["JoinAddress"].ToString().Length > 10 ? _RankDataTable2.Rows[i]["JoinAddress"].ToString().Substring(0, 9).ToString() + ".." : _RankDataTable2.Rows[i]["JoinAddress"].ToString();
            }
        }
        protected DataTable get_VoteInfo()
        {
            DataTable dt = new DataTable();
            Model.Vote obj = new BLL.Vote().GetModel(id);
            dt.Columns.Add("img_url", Type.GetType("System.String"));
            if (obj.Vote_Pic1 != null)
            {
                dt.Rows.Add(obj.Vote_Pic1);
            }
            if (obj.Vote_Pic2 != null)
            {
                dt.Rows.Add(obj.Vote_Pic2);
            }
            if (obj.Vote_Pic3 != null)
            {
                dt.Rows.Add(obj.Vote_Pic3);
            }
            if (obj.Vote_Pic4 != null)
            {
                dt.Rows.Add(obj.Vote_Pic4);
            }

            if (obj.Vote_Pic5 != null)
            {
                dt.Rows.Add(obj.Vote_Pic5);
            }
            changeBrowseNum();
            return dt;
        }

        //更改浏览量
        private void changeBrowseNum()
        {
            model.BrowseNum++;
            new BLL.Vote().Update(model);
        }

            /*
            public DataTable GetTaskScoreInfo(int id)
            {
                DataTable evaInfo = new BLL.Evaluation().GetAllList();

                BLL.EvaluationTaskScoreInfo bll = new BLL.EvaluationTaskScoreInfo();
                _EDataTable = bll.GetDataTable(" PJPointID=" + id + "and IsDone in (7,97,98,99,100) ");

                //   DataTable newData = _EDataTable;
                _EDataTable.Columns.Add("ListNum", typeof(string));
                _EDataTable.Columns.Add("BussCategory", typeof(string));
                _EDataTable.Columns.Add("AddRdel", typeof(string));
                _EDataTable.Columns.Add("EContent", typeof(string));
                _EDataTable.Columns.Add("realScore", typeof(string));
                for (int i = 0; i < _EDataTable.Rows.Count; i++)
                {
                    _EDataTable.Rows[i]["ListNum"] = (i + 1).ToString();
                    _EDataTable.Rows[i]["BussCategory"] = GetBName(_EDataTable.Rows[i]["pId"].ToString());
                    _EDataTable.Rows[i]["AddRdel"] = GetPCategory(_EDataTable.Rows[i]["pId"].ToString());
                    _EDataTable.Rows[i]["realScore"] = GetRealScore2(_EDataTable.Rows[i]["pId"].ToString(), evaInfo);
                    _EDataTable.Rows[i]["EContent"] = GetPContent(_EDataTable.Rows[i]["pId"].ToString());
                }
                return _EDataTable;
            }

            public string GetPCategory(string id)
            {
                if (id == "0")
                    return "";
                string _value = _PDataTable.Select("id =" + id + " ")[0]["EvaluationCategory"].ToString();
                if (!String.IsNullOrEmpty(_value))
                {
                    if (_value == "0")
                    {
                        return "<span style=\"color:green;\">" + eCategoryName[int.Parse(_value)] + "</span>";
                    }
                    else if (_value == "1")
                    {
                        return "<span style=\"color:red;\">" + eCategoryName[int.Parse(_value)] + "</span>";
                    }
                    else if (_value == "2")
                    {
                        return "<span style=\"color:gray;\">" + eCategoryName[int.Parse(_value)] + "</span>";
                    }
                    return eCategoryName[int.Parse(_value)];
                }
                return "";
            }

            public string GetPContent(string id)
            {
                string _value = _PDataTable.Select("id =" + id + " ")[0]["EvaluationName"].ToString();
                if (!String.IsNullOrEmpty(_value))
                    return _value;
                return "";
            }
            */
        }
}
