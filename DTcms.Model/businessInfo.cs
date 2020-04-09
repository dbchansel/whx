using System;

namespace DTcms.Model
{
    /// <summary>
    /// TAG标签
    /// </summary>
    [Serializable]
    public partial class businessInfo
    {
        public businessInfo()
        { }
        #region Model
        private int _id;
        private string _title = string.Empty;
        private DateTime _add_time = DateTime.Now;
        private string _BusinessName = string.Empty;
        private string _BusinessLicenseNumber = string.Empty;
        private string _LegalRepresentativeCode = string.Empty;
        private string _LegalRepresentativeName = string.Empty;
        private string _AgentName = string.Empty;
        private string _AgentTel = string.Empty;
        private string _ExternalGuaranteeremark = string.Empty;
        private string _Financingremark = string.Empty;
        private string _Loanremark = string.Empty;
        private string _Enterpriseremark = string.Empty;
        private string _EnterpriseDemandremark = string.Empty;
        /// <summary>
        /// 自增ID
        /// </summary>
        public int id
        {
            set { _id = value; }
            get { return _id; }
        }
        /// <summary>
        /// 企业名称
        /// </summary>
        public string BusinessName
        {
            set { _title = value; }
            get { return _title; }
        }
        /// <summary>
        /// 营业执照编号
        /// </summary>
        public string BusinessLicenseNumber
        {
            set { _BusinessLicenseNumber = value; }
            get { return _BusinessLicenseNumber; }
        }
        /// <summary>
        /// 法人身份证号
        /// </summary>
        public string LegalRepresentativeCode
        {
            set { _LegalRepresentativeCode = value; }
            get { return _LegalRepresentativeCode; }
        }
        /// <summary>
        /// 法定代表人
        /// </summary>
        public string LegalRepresentativeName
        {
            set { _LegalRepresentativeName = value; }
            get { return _LegalRepresentativeName; }
        }
        /// <summary>
        /// 经办人姓名
        /// </summary>
        public string AgentName
        {
            set { _AgentName = value; }
            get { return _AgentName; }
        }
        /// <summary>
        /// 经办人电话
        /// </summary>
        public string AgentTel
        {
            set { _AgentTel = value; }
            get { return _AgentTel; }
        }
        /// <summary>
        /// 对外担保情况
        /// </summary>
        public string ExternalGuaranteeremark
        {
            set { _ExternalGuaranteeremark = value; }
            get { return _ExternalGuaranteeremark; }
        }
        /// <summary>
        /// 融资情况
        /// </summary>
        public string Financingremark
        {
            set { _Financingremark = value; }
            get { return _Financingremark; }
        }
        /// <summary>
        /// 贷款情况
        /// </summary>
        public string Loanremark
        {
            set { _Loanremark = value; }
            get { return _Loanremark; }
        }
        /// <summary>
        /// 企业介绍
        /// </summary>
        public string Enterpriseremark
        {
            set { _Enterpriseremark = value; }
            get { return _Enterpriseremark; }
        }
        /// <summary>
        /// 企业需求
        /// </summary>
        public string EnterpriseDemandremark
        {
            set { _EnterpriseDemandremark = value; }
            get { return _EnterpriseDemandremark; }
        }
        /// <summary>
        /// 时间
        /// </summary>
        public DateTime add_time
        {
            set { _add_time = value; }
            get { return _add_time; }
        }
        #endregion
    }
}