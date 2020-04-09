using System;
using System.Data;

namespace DTcms.Model
{
    /// <summary>
    /// 评价细则
    /// </summary>
    [Serializable]
    public partial class VoteJoin
    {
        public VoteJoin()
        { }
        #region Model
        private int _id;
        private string _CreateUserId = string.Empty;
        private string _JoinNumber = string.Empty;
        private DateTime _CreateDate = DateTime.Now;
        private string _JoinName = string.Empty;
        private string _JoinTel = string.Empty;
        private string _JoinAddress = string.Empty;
        private string _JoinImg1 = string.Empty;
        private string _JoinImg2 = string.Empty;
        private string _JoinImg3 = string.Empty;
        private string _JoinImg4 = string.Empty;
        private string _JoinImg5 = string.Empty;
        private string _JoinImg6 = string.Empty;
        private string _JoinImg7 = string.Empty;
        private string _JoinImg8 = string.Empty;
        private string _JoinImg9 = string.Empty;
        private string _JoinImg10 = string.Empty;
        private string _GiftNum = string.Empty;
        private int _VisualNum = 0;
        private int _VoteNum = 0;

        private string _JoinContent = string.Empty;

        private int _JoinSta = 0;
        private int _VoteId = 0;
        private int _IsLock = 0;
        private int _BrowseNum = 0;
        private string _openid = string.Empty;

        private int _VoteNum_ZS = 0;
        private int _VoteNum_XN = 0;
        private int _BrowseNum_ZS = 0;
        private int _BrowseNum_XN = 0;
        private int _GiftNum_ZS = 0;
        private int _GiftNum_XN = 0;
        private string _DisplayImg = string.Empty;

        public int id
        {
            set { _id = value; }
            get { return _id; }
        }

        public string JoinNumber
        {
            set { _JoinNumber = value; }
            get { return _JoinNumber; }
        }
        public string CreateUserId
        {
            set { _CreateUserId = value; }
            get { return _CreateUserId; }
        }

        public DateTime CreateDate
        {
            set { _CreateDate = value; }
            get { return _CreateDate; }
        }

        public string JoinName
        {
            set { _JoinName = value; }
            get { return _JoinName; }
        }
        public string JoinTel
        {
            set { _JoinTel = value; }
            get { return _JoinTel; }
        }
        public string JoinAddress
        {
            set { _JoinAddress = value; }
            get { return _JoinAddress; }
        }
        public string JoinImg1
        {
            set { _JoinImg1 = value; }
            get { return _JoinImg1; }
        }
        public string JoinImg2
        {
            set { _JoinImg2 = value; }
            get { return _JoinImg2; }
        }
        public string JoinImg3
        {
            set { _JoinImg3 = value; }
            get { return _JoinImg3; }
        }
        public string JoinImg4
        {
            set { _JoinImg4 = value; }
            get { return _JoinImg4; }
        }
        public string JoinImg5
        {
            set { _JoinImg5 = value; }
            get { return _JoinImg5; }
        }
        public string JoinImg6
        {
            set { _JoinImg6 = value; }
            get { return _JoinImg6; }
        }
        public string JoinImg7
        {
            set { _JoinImg7 = value; }
            get { return _JoinImg7; }
        }
        public string JoinImg8
        {
            set { _JoinImg8 = value; }
            get { return _JoinImg8; }
        }
        public string JoinImg9
        {
            set { _JoinImg9 = value; }
            get { return _JoinImg9; }
        }
        public string JoinImg10
        {
            set { _JoinImg10 = value; }
            get { return _JoinImg10; }
        }
        public int VoteNum
        {
            set { _VoteNum = value; }
            get { return _VoteNum; }
        }
        public string openid
        {
            set { _openid = value; }
            get { return _openid; }
        }
        public string GiftNum
        {
            set { _GiftNum = value; }
            get { return _GiftNum; }
        }
        public int VisualNum
        {
            set { _VisualNum = value; }
            get { return _VisualNum; }
        }
        public string JoinContent
        {
            set { _JoinContent = value; }
            get { return _JoinContent; }
        }

        public int JoinSta
        {
            set { _JoinSta = value; }
            get { return _JoinSta; }
        }
        public int VoteId
        {
            set { _VoteId = value; }
            get { return _VoteId; }
        }
        public int IsLock
        {
            set { _IsLock = value; }
            get { return _IsLock; }
        }

        public int BrowseNum
        {
            set { _BrowseNum = value; }
            get { return _BrowseNum; }
        }

        public int VoteNum_ZS
        {
            set { _VoteNum_ZS = value; }
            get { return _VoteNum_ZS; }
        }
        public int VoteNum_XN
        {
            set { _VoteNum_XN = value; }
            get { return _VoteNum_XN; }
        }
        public int BrowseNum_ZS
        {
            set { _BrowseNum_ZS = value; }
            get { return _BrowseNum_ZS; }
        }
        public int BrowseNum_XN
        {
            set { _BrowseNum_XN = value; }
            get { return _BrowseNum_XN; }
        }
        public int GiftNum_ZS
        {
            set { _GiftNum_ZS = value; }
            get { return _GiftNum_ZS; }
        }
        public int GiftNum_XN
        {
            set { _GiftNum_XN = value; }
            get { return _GiftNum_XN; }
        }
        public string DisplayImg
        {
            set { _DisplayImg = value; }
            get { return _DisplayImg; }
        }
        #endregion
    }
}
