using System;
using System.Collections.Generic;
using System.Web;
using System.Text;
using DTcms.Common;
using System.Data;



namespace DTcms.Web.UI.Page
{
    public partial class VoteMember : Web.UI.BasePage
    {
        protected string channel = string.Empty; //频道名称
        protected int id;
        protected string curopenid = string.Empty;
        protected string JRZXURLStr = string.Empty;
        protected string page = string.Empty;
        protected Model.VoteJoin model = new Model.VoteJoin();
        protected Model.Vote model2 = new Model.Vote();
        protected string isVote = "true";

        //当前排名
        protected int RankNum = 0;
        protected int LastVoteNum = 0;

        //获取选手列表
        protected DataTable VoteJoinInfo = new DataTable();
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
            id = DTRequest.GetQueryInt("id");
            curopenid = DTRequest.GetQueryString("openid");
            BLL.VoteJoin bll = new BLL.VoteJoin();
            model = bll.GetModel(id);

            model2 = new BLL.Vote().GetModel(model.VoteId);
            JRZXURLStr = "/upload/moren.png";
            if (model2.JRZXId != 0 && model2.JRZXId != null)
            {
                Model.VoteJoin jrzx = new BLL.VoteJoin().GetModel(model2.JRZXId);
                if (jrzx != null)
                {
                    if(!string.IsNullOrEmpty(jrzx.DisplayImg))
                        JRZXURLStr = jrzx.DisplayImg;
                }
            }
            DataTable dtAll = bll.GetList2(model.VoteId);
            if (model2.Activity_VoteEDTime < DateTime.Now)
                isVote = "false";
            for (int i = 0; i < dtAll.Rows.Count;i++)
            {
                if (dtAll.Rows[i]["id"].ToString() == model.id.ToString())
                {
                    RankNum = (i + 1);
                    if (i != 0)
                    {
                        LastVoteNum = int.Parse(dtAll.Rows[i - 1]["VoteNum"].ToString()) - int.Parse(dtAll.Rows[i - 1]["VoteNum"].ToString());
                    }
                       
                }
            }
            string ss = "";
        }
        protected DataTable get_VoteInfo()
        {
            DataTable dt = new DataTable();
            Model.VoteJoin obj = new BLL.VoteJoin().GetModel(id);
            dt.Columns.Add("img_url", Type.GetType("System.String"));
            if (!string.IsNullOrEmpty(obj.JoinImg1))
            {
                dt.Rows.Add(obj.JoinImg1);
            }
            changeBrowseNum();
            return dt;
        }
        protected DataTable get_VoteInfoPic()
        {
            DataTable dt = new DataTable();
            Model.VoteJoin obj = new BLL.VoteJoin().GetModel(id);
            dt.Columns.Add("img_url", Type.GetType("System.String"));
            if (!string.IsNullOrEmpty(obj.JoinImg2))
            {
                dt.Rows.Add(obj.JoinImg2);
            }
            if (!string.IsNullOrEmpty(obj.JoinImg3))
            {
                dt.Rows.Add(obj.JoinImg3);
            }
            if (!string.IsNullOrEmpty(obj.JoinImg4))
            {
                dt.Rows.Add(obj.JoinImg4);
            }
            if (!string.IsNullOrEmpty(obj.JoinImg5))
            {
                dt.Rows.Add(obj.JoinImg5);
            }
            if (!string.IsNullOrEmpty(obj.JoinImg6))
            {
                dt.Rows.Add(obj.JoinImg6);
            }
            if (!string.IsNullOrEmpty(obj.JoinImg7))
            {
                dt.Rows.Add(obj.JoinImg7);
            }
            if (!string.IsNullOrEmpty(obj.JoinImg8))
            {
                dt.Rows.Add(obj.JoinImg8);
            }
            if (!string.IsNullOrEmpty(obj.JoinImg9))
            {
                dt.Rows.Add(obj.JoinImg9);
            }
            if (!string.IsNullOrEmpty(obj.JoinImg10))
            {
                dt.Rows.Add(obj.JoinImg10);
            }
            changeBrowseNum();
            return dt;
        }
        //更改浏览量
        private void changeBrowseNum()
        {
            model.BrowseNum++;
            new BLL.VoteJoin().Update(model);
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
