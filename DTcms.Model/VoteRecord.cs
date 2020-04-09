using System;
using System.Data;

namespace DTcms.Model
{
    /// <summary>
    /// 评价细则
    /// </summary>
    [Serializable]
    public partial class VoteRecord
    {
        public VoteRecord()
        { }
        #region Model
        private int _id;
        private int _PointId = 0;
        private int _VoteType = 0;
        private string _VoteRecordId = string.Empty;
        private string _VotePlatform = string.Empty;
        private int _SetVoteNum = 0;
        private string _Money = string.Empty;
        private string _Other = string.Empty;
        public int id
        {
            set { _id = value; }
            get { return _id; }
        }

        public int PointId
        {
            set { _PointId = value; }
            get { return _PointId; }
        }
        //0，普通投票，1，管理人员投票，2，系统自动投票，3，用户充值投票
        public int VoteType
        {
            set { _VoteType = value; }
            get { return _VoteType; }
        }
        public string VoteRecordId
        {
            set { _VoteRecordId = value; }
            get { return _VoteRecordId; }
        }
        public string VotePlatform
        {
            set { _VotePlatform = value; }
            get { return _VotePlatform; }
        }
        public int SetVoteNum
        {
            set { _SetVoteNum = value; }
            get { return _SetVoteNum; }
        }
        public string Money
        {
            set { _Money = value; }
            get { return _Money; }
        }
        public string Other
        {
            set { _Other = value; }
            get { return _Other; }
        }     
        #endregion
    }
}
