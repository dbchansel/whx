using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DTcms.Model
{
    /// <summary>
    /// 进出货记录
    /// </summary>
    [Serializable]
    public partial class erp_record_Info
    {
        public erp_record_Info()
        { }
        #region Model
        private int _id;
        private int _trannsform_type;
        private string _transform_num = string.Empty;
        private string _sale_prices = string.Empty;
        private string _real_prices = string.Empty;
        private string _parent_id = string.Empty;
        private DateTime? _createdate = DateTime.Now;
        private DateTime? _product_date = DateTime.Now;
        private DateTime? _end_date = DateTime.Now;
        private string _remarks = string.Empty;
        /// <summary>
        /// ID
        /// </summary>
        public int id
        {
            set { _id = value; }
            get { return _id; }
        }
        public int trannsform_type
        {
            set { _trannsform_type = value; }
            get { return _trannsform_type; }
        }

        public string transform_num
        {
            get
            {
                return _transform_num;
            }

            set
            {
                _transform_num = value;
            }
        }

        public string sale_prices
        {
            get
            {
                return _sale_prices;
            }

            set
            {
                _sale_prices = value;
            }
        }

        public string real_prices
        {
            get
            {
                return _real_prices;
            }

            set
            {
                _real_prices = value;
            }
        }

        public string parent_id
        {
            get
            {
                return _parent_id;
            }

            set
            {
                _parent_id = value;
            }
        }

        public DateTime? createdate
        {
            get
            {
                return _createdate;
            }

            set
            {
                _createdate = value;
            }
        }

        public DateTime? product_date
        {
            get
            {
                return _product_date;
            }

            set
            {
                _product_date = value;
            }
        }

        public DateTime? end_date
        {
            get
            {
                return _end_date;
            }

            set
            {
                _end_date = value;
            }
        }

        public string remarks
        {
            get
            {
                return _remarks;
            }

            set
            {
                _remarks = value;
            }
        }

        #endregion
    }
}
