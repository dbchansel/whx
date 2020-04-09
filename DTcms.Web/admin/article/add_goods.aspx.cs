using System;
using System.Data;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTcms.Common;


namespace DTcms.Web.admin.article
{
    public partial class add_goods : Web.UI.ManagePage
    {
        protected int good_id = 0;
        protected int record_id = 0;
        protected string action = string.Empty;
        private Model.article _goods = new Model.article();
        private Model.article_goods _goodsinfo = new Model.article_goods();
        private Model.erp_record_Info _records = new Model.erp_record_Info();
        public string outTitle = string.Empty;
        protected string urlstr = string.Empty;
        protected int type = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            good_id = DTRequest.GetQueryInt("good_id");
            record_id = DTRequest.GetQueryInt("id");
            action = DTRequest.GetQueryString("action");
            if (!Page.IsPostBack)
            {
                //是否开启
                this.OpenLockRank.Items.Add(new ListItem("进", "1"));
                this.OpenLockRank.Items.Add(new ListItem("出", "0"));

                if (good_id > 0)
                {
                    loadInfo_goods(good_id);
                }


                if (action == "add")
                {

                }
                else
                {
                    loadInfo_records(record_id);
                }
            }
        }
        private void loadInfo_goods(int parent_id)
        {
            _goods = new BLL.article().GetModel(2,parent_id);

            if (_goods != null)
            {
                good_name.Text = _goods.title;
            }
            //            Activity_GMBGTime.Text = model.Activity_GMBGTime.ToString("yyyy-MM-dd HH:mm:ss");
        }
        private void loadInfo_records(int parent_id)
        {

            _records = new BLL.erp_record_Info().GetModel(parent_id);

            if (_records != null)
            {
                OpenLockRank.Text = _records.trannsform_type.ToString();
                transform_num.Text = _records.transform_num.ToString();
                sale_prices.Text = _records.sale_prices.ToString();
                real_prices.Text = _records.real_prices.ToString();
                product_date.Text = _records.product_date.ToString();
                end_date.Text = _records.end_date.ToString();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            //_records.id = Guid.NewGuid().ToString();
            _records.parent_id = good_id.ToString();
            _records.remarks = remarks.Text.ToString().Trim();
            _records.trannsform_type = int.Parse(OpenLockRank.SelectedValue);
            _records.transform_num = transform_num.Text.Trim().ToString();
            _records.sale_prices = sale_prices.Text.Trim().ToString();
            _records.real_prices = real_prices.Text.Trim().ToString();
            _records.product_date =  Utils.StrToDateTime(product_date.Text.Trim());
            _records.end_date = Utils.StrToDateTime(end_date.Text.Trim());
            if (new BLL.erp_record_Info().Add(_records)>0)
            {
                if (!string.IsNullOrEmpty(good_id.ToString()))
                {
                    DataTable dt = new BLL.DbContext().getValueBySql(" select stock_quantity from  dt_channel_article_goods where id='" + _records.parent_id + "'");
                    int curNum = int.Parse(dt.Rows[0]["stock_quantity"].ToString());
                    
                    if (_records.trannsform_type > 0)
                    {
                        curNum += int.Parse(_records.transform_num);
                    }
                    else
                    {
                        curNum -= int.Parse(_records.transform_num);
                    }
                    bool s =  new BLL.article_goods().upsertNum(curNum.ToString(), good_id.ToString());

                    JscriptMsg("保存成功！", "");

                    Response.Write("<script>window.opener=null;window.close();</script>");// 不会弹出询问
                }
            }
        }
    }
}