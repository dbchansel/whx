using System;
using System.Data;

namespace DTcms.Model
{
    /// <summary>
    /// 自动投票规则
    /// </summary>
    [Serializable]
    public partial class VoteAuto
    {
        public VoteAuto()
        { }
        #region Model
        private int _id;
        private int _VoteId = 0;
        private int _AutoType = 0;
        private string _JoinMembers = string.Empty;
        private int _PL = 0;
        private DateTime? _AutoBG = DateTime.Now;
        private DateTime? _AutoED = DateTime.Now;
        private int _sta = 0;
        private DateTime _CreateDate = DateTime.Now;
        private int _Status1 = 0;
        private int _Status2 = 0;
        private string _JoinMembers2 = string.Empty;
        private int _PL2 = 0;
        private DateTime? _AutoBG2 = DateTime.Now;
        private DateTime? _AutoED2 = DateTime.Now;
        private string _AutoRoles = string.Empty;

        public int id
        {
            set { _id = value; }
            get { return _id; }
        }

        public int VoteId
        {
            set { _VoteId = value; }
            get { return _VoteId; }
        }
        //自动投票类型0，多人定时投票，1，依据名次投票；2，多人定时送礼物，3，依据名次送礼物，4，其他
        public int AutoType
        {
            set { _AutoType = value; }
            get { return _AutoType; }
        }
        //选手编号;区分
        public string JoinMembers
        {
            set { _JoinMembers = value; }
            get { return _JoinMembers; }
        }
        //频率  秒
        public int PL
        {
            set { _PL = value; }
            get { return _PL; }
        }
        public DateTime? AutoBG
        {
            set { _AutoBG = value; }
            get { return _AutoBG; }
        }
        public DateTime? AutoED
        {
            set { _AutoED = value; }
            get { return _AutoED; }
        }
        //类型1  排名1_排名2>票数1_票数2;
        public string AutoRoles
        {
            set { _AutoRoles = value; }
            get { return _AutoRoles; }
        }
        //0 未启用 1 启用 2 删除
        public int sta
        {
            set { _sta = value; }
            get { return _sta; }
        }
        public DateTime CreateDate
        {
            set { _CreateDate = value; }
            get { return _CreateDate; }
        }
        public int Status1
        {
            set { _Status1 = value; }
            get { return _Status1; }
        }
        public int Status2
        {
            set { _Status2 = value; }
            get { return _Status2; }
        }
        public string JoinMembers2
        {
            set { _JoinMembers2 = value; }
            get { return _JoinMembers2; }
        }
        public int PL2
        {
            set { _PL2 = value; }
            get { return _PL2; }
        }
        public DateTime? AutoBG2
        {
            set { _AutoBG2 = value; }
            get { return _AutoBG2; }
        }
        public DateTime? AutoED2
        {
            set { _AutoED2 = value; }
            get { return _AutoED2; }
        }
        #endregion
    }
}
