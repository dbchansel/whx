using System;
using System.Data;

namespace DTcms.Model
{
    /// <summary>
    /// 评价细则
    /// </summary>
    [Serializable]
    public partial class Vote
    {
        public Vote()
        { }
        #region Model
        private int _id;
        private string _CreateUserId = string.Empty;
        private string _Activity_Title = string.Empty;
        private DateTime _CreateDate = DateTime.Now;
        private DateTime _Activity_GMEDTime = DateTime.Now;
        private DateTime _Activity_VoteBGTime = DateTime.Now;
        private DateTime _Activity_VoteEDTime = DateTime.Now;
        private DateTime _Activity_GMBGTime = DateTime.Now;
        private string _Activity_Remarks = string.Empty;
        private int _Rules_VoteSta = 0;
        private int _Rules_MinMember = 0;
        private int _Rules_PDUVotes = 0;
        private int _Rules_DPVotes = 0;
        private int _Rules_MaxVotes = 0;
        private int _Rules_DateInterval = 0;
        private int _Rules_MaxGift = 0;
        private int _Rules_RemindSta = 0;
        private int _Rules_AnonymousGift = 0;
        private int _Rules_GiftSelf = 0;

        private string _Vote_Pic1 = string.Empty;
        private string _Vote_Pic2 = string.Empty;
        private string _Vote_Pic3 = string.Empty;
        private string _Vote_Pic4 = string.Empty;
        private string _Vote_Pic5 = string.Empty;
        private string _Vote_SuccPopAds = string.Empty;
        private string _Vote_ActivityContent = string.Empty;
        private string _Vote_PrizeContent = string.Empty;

        private int _Surface_DisplayOrder = 0;
        private int _Surface_BVolume = 0;
        private int _Surface_RankNum = 0;
        private int _SignUp_MinPic = 0;
        private int _SignUp_MaxPic = 0;
        private string _SignUp_Name = string.Empty;
        private string _SignUp_Tel = string.Empty;
        private string _SignUp_Content = string.Empty;
        private int _Gift_DisplayRecord = 0;
        private string _Gift_SendInterface = string.Empty;

        private int _Gift_BL = 0;

        private string _Gift_Name1 = string.Empty;
        private int _Gift_Price1 = 0;
        private int _Gift_Votes1 = 0;

        private string _Gift_Name2 = string.Empty;
        private int _Gift_Price2 = 0;
        private int _Gift_Votes2 = 0;

        private string _Gift_Name3 = string.Empty;
        private int _Gift_Price3 = 0;
        private int _Gift_Votes3 = 0;

        private string _Gift_Name4 = string.Empty;
        private int _Gift_Price4 = 0;
        private int _Gift_Votes4 = 0;
        private int _JoinMemberNum = 0;
        private int _User1Id = 0;
        private int _User2Id = 0;
        private int _User3Id = 0;

        private int _Gift_Votes1_ZS = 0;
        private int _Gift_Votes1_XN = 0;
        private int _GiftSum = 0;
        //0 未开始
        //1 已开始
        //2 一结束
        private int _VoteSta = 0;
        private int _BrowseNum = 0;

        private int _OpenLockRank = 0;

        private string _JRZXName = string.Empty;
        private int _JRZXId = 0;

        /// <summary>
        /// 自增ID
        /// </summary>
        public int id
        {
            set { _id = value; }
            get { return _id; }
        }


        public string Activity_Title
        {
            set { _Activity_Title = value; }
            get { return _Activity_Title; }
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
        public DateTime Activity_GMBGTime
        {
            set { _Activity_GMBGTime = value; }
            get { return _Activity_GMBGTime; }
        }
        public DateTime Activity_GMEDTime
        {
            set { _Activity_GMEDTime = value; }
            get { return _Activity_GMEDTime; }
        }
        public DateTime Activity_VoteBGTime
        {
            set { _Activity_VoteBGTime = value; }
            get { return _Activity_VoteBGTime; }
        }
        public DateTime Activity_VoteEDTime
        {
            set { _Activity_VoteEDTime = value; }
            get { return _Activity_VoteEDTime; }
        }
        public string Activity_Remarks
        {
            set { _Activity_Remarks = value; }
            get { return _Activity_Remarks; }
        }
        public int Rules_VoteSta
        {
            set { _Rules_VoteSta = value; }
            get { return _Rules_VoteSta; }
        }
        public int Rules_MinMember
        {
            set { _Rules_MinMember = value; }
            get { return _Rules_MinMember; }
        }
        public int Rules_PDUVotes
        {
            set { _Rules_PDUVotes = value; }
            get { return _Rules_PDUVotes; }
        }
        public int Rules_DPVotes
        {
            set { _Rules_DPVotes = value; }
            get { return _Rules_DPVotes; }
        }
        public int Rules_MaxVotes
        {
            set { _Rules_MaxVotes = value; }
            get { return _Rules_MaxVotes; }
        }
        public int Rules_DateInterval
        {
            set { _Rules_DateInterval = value; }
            get { return _Rules_DateInterval; }
        }
        public int Rules_MaxGift
        {
            set { _Rules_MaxGift = value; }
            get { return _Rules_MaxGift; }
        }
        public int Rules_RemindSta
        {
            set { _Rules_RemindSta = value; }
            get { return _Rules_RemindSta; }
        }
        public int Rules_AnonymousGift
        {
            set { _Rules_AnonymousGift = value; }
            get { return _Rules_AnonymousGift; }
        }
        public int Rules_GiftSelf
        {
            set { _Rules_GiftSelf = value; }
            get { return _Rules_GiftSelf; }
        }

        public string Vote_Pic1
        {
            set { _Vote_Pic1 = value; }
            get { return _Vote_Pic1; }
        }
        public string Vote_Pic2
        {
            set { _Vote_Pic2 = value; }
            get { return _Vote_Pic2; }
        }
        public string Vote_Pic3
        {
            set { _Vote_Pic3 = value; }
            get { return _Vote_Pic3; }
        }
        public string Vote_Pic4
        {
            set { _Vote_Pic4 = value; }
            get { return _Vote_Pic4; }
        }
        public string Vote_Pic5
        {
            set { _Vote_Pic5 = value; }
            get { return _Vote_Pic5; }
        }
        public string Vote_SuccPopAds
        {
            set { _Vote_SuccPopAds = value; }
            get { return _Vote_SuccPopAds; }
        }
        public string Vote_ActivityContent
        {
            set { _Vote_ActivityContent = value; }
            get { return _Vote_ActivityContent; }
        }

        public string Vote_PrizeContent
        {
            set { _Vote_PrizeContent = value; }
            get { return _Vote_PrizeContent; }
        }
        public int Surface_DisplayOrder
        {
            set { _Surface_DisplayOrder = value; }
            get { return _Surface_DisplayOrder; }
        }
        public int Surface_BVolume
        {
            set { _Surface_BVolume = value; }
            get { return _Surface_BVolume; }
        }
        public int Surface_RankNum
        {
            set { _Surface_RankNum = value; }
            get { return _Surface_RankNum; }
        }
        public int SignUp_MinPic
        {
            set { _SignUp_MinPic = value; }
            get { return _SignUp_MinPic; }
        }
        public int SignUp_MaxPic
        {
            set { _SignUp_MaxPic = value; }
            get { return _SignUp_MaxPic; }
        }

        public string SignUp_Name
        {
            set { _SignUp_Name = value; }
            get { return _SignUp_Name; }
        }
        public string SignUp_Tel
        {
            set { _SignUp_Tel = value; }
            get { return _SignUp_Tel; }
        }
        public string SignUp_Content
        {
            set { _SignUp_Content = value; }
            get { return _SignUp_Content; }
        }
        public int Gift_DisplayRecord
        {
            set { _Gift_DisplayRecord = value; }
            get { return _Gift_DisplayRecord; }
        }
        public string Gift_SendInterface
        {
            set { _Gift_SendInterface = value; }
            get { return _Gift_SendInterface; }
        }
        public int Gift_BL
        {
            set { _Gift_BL = value; }
            get { return _Gift_BL; }
        }

        public string Gift_Name1
        {
            set { _Gift_Name1 = value; }
            get { return _Gift_Name1; }
        }
        public int Gift_Price1
        {
            set { _Gift_Price1 = value; }
            get { return _Gift_Price1; }
        }
        public int Gift_Votes1
        {
            set { _Gift_Votes1 = value; }
            get { return _Gift_Votes1; }
        }


        public string Gift_Name2
        {
            set { _Gift_Name2 = value; }
            get { return _Gift_Name2; }
        }
        public int Gift_Price2
        {
            set { _Gift_Price2 = value; }
            get { return _Gift_Price2; }
        }
        public int Gift_Votes2
        {
            set { _Gift_Votes2 = value; }
            get { return _Gift_Votes2; }
        }

        public string Gift_Name3
        {
            set { _Gift_Name3 = value; }
            get { return _Gift_Name3; }
        }
        public int Gift_Price3
        {
            set { _Gift_Price3 = value; }
            get { return _Gift_Price3; }
        }
        public int Gift_Votes3
        {
            set { _Gift_Votes3 = value; }
            get { return _Gift_Votes3; }
        }

        public string Gift_Name4
        {
            set { _Gift_Name4 = value; }
            get { return _Gift_Name4; }
        }
        public int Gift_Price4
        {
            set { _Gift_Price4 = value; }
            get { return _Gift_Price4; }
        }
        public int Gift_Votes4
        {
            set { _Gift_Votes4 = value; }
            get { return _Gift_Votes4; }
        }

        public int JoinMemberNum
        {
            set { _JoinMemberNum = value; }
            get { return _JoinMemberNum; }
        }
        public int User1Id
        {
            set { _User1Id = value; }
            get { return _User1Id; }
        }
        public int User2Id
        {
            set { _User2Id = value; }
            get { return _User2Id; }
        }
        public int User3Id
        {
            set { _User3Id = value; }
            get { return _User3Id; }
        }

        public int VoteSta
        {
            set { _VoteSta = value; }
            get { return _VoteSta; }
        }
        public int BrowseNum
        {
            set { _BrowseNum = value; }
            get { return _BrowseNum; }
        }
        public int Gift_Votes1_ZS
        {
            set { _Gift_Votes1_ZS = value; }
            get { return _Gift_Votes1_ZS; }
        }
        public int Gift_Votes1_XN
        {
            set { _Gift_Votes1_XN = value; }
            get { return _Gift_Votes1_XN; }
        }

        public int GiftSum
        {
            set { _GiftSum = value; }
            get { return _GiftSum; }
        }
        public int OpenLockRank
        {
            set { _OpenLockRank = value; }
            get { return _OpenLockRank; }
        }
        public string JRZXName
        {
            set { _JRZXName = value; }
            get { return _JRZXName; }
        }
        public int JRZXId
        {
            set { _JRZXId = value; }
            get { return _JRZXId; }
        }
        #endregion
    }
}