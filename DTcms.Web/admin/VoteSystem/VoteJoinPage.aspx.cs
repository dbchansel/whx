using System;
using System.Text;
using System.Data;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTcms.Common;
using NPOI.HSSF.UserModel;
using System.IO;
using NPOI.SS.UserModel;

namespace DTcms.Web.admin.VoteSystem
{
    public partial class VoteJoinPage : Web.UI.ManagePage
    {
        protected int totalCount;
        protected int page;
        protected int pageSize;

        protected int site_id;
        protected int status;
        protected int payment_status;
        protected int express_status;
        protected string keywords = string.Empty;
        public static string VoteId = string.Empty;
        private static  Model.Vote v = new Model.Vote();

        protected void Page_Load(object sender, EventArgs e)
        {
            VoteId = DTRequest.GetQueryString("VoteId");
            /*
            this.express_status = DTRequest.GetQueryInt("express_status");
                        */
            this.keywords = DTRequest.GetQueryString("keywords");
            string keyValue = this.keywords == "" ? "" : " and (JoinNumber like '%" + this.keywords + "%' or JoinName like '%"+ this.keywords + "%' )";

            this.pageSize = GetPageSize(10); //每页数量
            if (!Page.IsPostBack)
            {
                v = new BLL.Vote().GetModel(int.Parse(VoteId));
                RptBind("id>0 and VoteId='" + VoteId + "' " + keyValue, "VoteNum desc,CreateDate desc");
            }
        }

        #region 数据绑定=================================
        private void RptBind(string _strWhere, string _orderby)
        {
            this.page = DTRequest.GetQueryInt("page", 1);
            txtKeywords.Text = this.keywords;
            BLL.VoteJoin bll = new BLL.VoteJoin();
            this.rptList.DataSource = bll.GetList(this.pageSize, this.page, _strWhere, _orderby, out this.totalCount);
            this.rptList.DataBind();
            //绑定页码
            txtPageNum.Text = this.pageSize.ToString();
            string pageUrl = Utils.CombUrlTxt("VoteJoinPage.aspx", "page={0}&VoteId={1}", "__id__", VoteId);
            PageContent.InnerHtml = Utils.OutPageList(this.pageSize, this.page, this.totalCount, pageUrl, 8);
        }
        #endregion

        #region 组合SQL查询语句==========================
        protected string CombSqlTxt(int _site_id, int _status, int _payment_status, int _express_status, string _keywords)
        {
            StringBuilder strTemp = new StringBuilder();
            if (_site_id > 0)
            {
                strTemp.Append(" and site_id=" + _site_id);
            }
            return strTemp.ToString();
        }
        #endregion

        #region 返回用户每页数量=========================
        private int GetPageSize(int _default_size)
        {
            int _pagesize;
            if (int.TryParse(Utils.GetCookie("VoteJoinPage_page_size", "DTcmsPage"), out _pagesize))
            {
                if (_pagesize > 0)
                {
                    return _pagesize;
                }
            }
            return _default_size;
        }
        #endregion

        #region 返回订单状态=============================
        protected string GetOrderStatus(int _id)
        {
            string _title = string.Empty;
            Model.orders model = new BLL.orders().GetModel(_id);
            switch (model.status)
            {
                case 1: //如果是线下支付，支付状态为0，如果是线上支付，支付成功后会自动改变订单状态为已确认
                    if (model.payment_status > 0)
                    {
                        _title = "待付款";
                    }
                    else
                    {
                        _title = "待确认";
                    }
                    break;
                case 2: //如果订单为已确认状态，则进入发货状态
                    if (model.express_status > 1)
                    {
                        _title = "已发货";
                    }
                    else
                    {
                        _title = "待发货";
                    }
                    break;
                case 3:
                    _title = "交易完成";
                    break;
                case 4:
                    _title = "已取消";
                    break;
                case 5:
                    _title = "已作废";
                    break;
            }

            return _title;
        }
        #endregion

        //审核
        protected void btnAudit_Click(object sender, EventArgs e)
        {
            BLL.VoteJoin bll = new BLL.VoteJoin();
            Repeater rptList = this.rptList;
            for (int i = 0; i < rptList.Items.Count; i++)
            {
                int id = Convert.ToInt32(((HiddenField)rptList.Items[i].FindControl("hidId")).Value);
                CheckBox cb = (CheckBox)rptList.Items[i].FindControl("chkId");
                if (cb.Checked)
                {
                    bll.UpdateField(id, "JoinSta=1");
                    AddAdminLog(DTEnums.ActionEnum.Audit.ToString(), "审核" + new BLL.Vote().GetModel(int.Parse(VoteId)).Activity_Title + ":审核参加客户:" + new BLL.VoteJoin().GetModel(id).JoinName); //记录日志
                }
            }

            JscriptMsg("批量审核成功！", Utils.CombUrlTxt("VoteJoinPage.aspx", "VoteId={0}",VoteId.ToString()));
        }
        //锁定
        protected void btnAudit_ClickSD(object sender, EventArgs e)
        {
            BLL.VoteJoin bll = new BLL.VoteJoin();
            Repeater rptList = this.rptList;
            for (int i = 0; i < rptList.Items.Count; i++)
            {
                int id = Convert.ToInt32(((HiddenField)rptList.Items[i].FindControl("hidId")).Value);
                CheckBox cb = (CheckBox)rptList.Items[i].FindControl("chkId");
                if (cb.Checked)
                {
                    bll.UpdateField(id, "IsLock=1");
                    AddAdminLog(DTEnums.ActionEnum.Audit.ToString(), "锁定" + new BLL.Vote().GetModel(int.Parse(VoteId)).Activity_Title + ":审核参加客户:" + new BLL.VoteJoin().GetModel(id).JoinName); //记录日志
                }
            }

            JscriptMsg("批量审核成功！", Utils.CombUrlTxt("VoteJoinPage.aspx", "VoteId={0}", VoteId.ToString()));
        }

        protected void btnAudit_ClickJRZX(object sender, EventArgs e)
        {
            BLL.VoteJoin bll = new BLL.VoteJoin();
            Repeater rptList = this.rptList;
            int joinId = 0;
            for (int i = 0; i < rptList.Items.Count; i++)
            {
                int id = Convert.ToInt32(((HiddenField)rptList.Items[i].FindControl("hidId")).Value);
                CheckBox cb = (CheckBox)rptList.Items[i].FindControl("chkId");
                if (cb.Checked)
                {
                    joinId = id;
                   // bll.UpdateField(id, "IsLock=1");
                }
            }
            Model.VoteJoin vj = new BLL.VoteJoin().GetModel(joinId);
            Model.Vote vt = new BLL.Vote().GetModel(vj.VoteId);
            vt.JRZXName = "经过大家一致推举，！！" + vj.JoinName + "！！成为今日之星。" + vj.JoinName + "也欢迎各位光临！！";
            vt.JRZXId = vj.id;
            if(new BLL.Vote().Update(vt))
                JscriptMsg("设置成功，请在活动页面查看！", Utils.CombUrlTxt("VoteJoinPage.aspx", "VoteId={0}", VoteId.ToString()));
        }
        static string[] array = new string[6] { "JoinName", "JoinTel", "JoinAddress", "JoinNumber", "VoteNum", "JoinContent" };
        static string[] array2 = new string[6] { "店铺名称", "电话", "地址", "编号", "票数", "说明" };
        //导出
        protected void btnAudit_ClickDC(object sender, EventArgs e)
        {
            BLL.VoteJoin bll = new BLL.VoteJoin();
            DataTable dt = bll.GetAllList(VoteId);
            string timeName = DateTime.Now.Year + "_" + DateTime.Now.Year + "_" + DateTime.Now.Day + "_" + DateTime.Now.Hour + "_" + DateTime.Now.Minute + "_" + DateTime.Now.Second + "_" + v.Activity_Title + ".xls";
            ExportExcel(dt, timeName);
            return;
            /*
            //创建工作薄
            var workbook = new HSSFWorkbook();
            //创建表
            var table = workbook.CreateSheet("Vote");

            MemoryStream ms = new MemoryStream();
            var row1 = table.CreateRow(0);
            for (int j = 0; j < array2.Length; j++)
            {
                var cell = row1.CreateCell(j);
                cell.SetCellValue(array2[j].ToString());
            }

            //模拟20行20列数据
            for (var i = 1; i < (dt.Rows.Count+1); i++)
            {
                var row = table.CreateRow(i);
                for (int j = 0; j < array.Length; j++)
                {
                    var cell = row.CreateCell(j);
                    cell.SetCellValue(dt.Rows[i-1][array[j]].ToString());
                }
            }


            string timeName = DateTime.Now.Year + "_" + DateTime.Now.Year + "_" + DateTime.Now.Day + "_" + DateTime.Now.Hour + "_" + DateTime.Now.Minute + "_" + DateTime.Now.Second + "_";
            workbook.Write(ms);
            FileStream file = new FileStream(@"DT_Vote/admin/VoteSystem/excel/" + timeName + v.Activity_Title + ".xls", FileMode.Create);
            workbook.Write(file);
            */
        }
        public static HSSFWorkbook BuildWorkbook(DataTable dt)
        {

            //创建工作薄
            var workbook = new HSSFWorkbook();
            //创建表
            var table = workbook.CreateSheet("Vote");

            MemoryStream ms = new MemoryStream();
            var row1 = table.CreateRow(0);
            for (int j = 0; j < array2.Length; j++)
            {
                var cell = row1.CreateCell(j);
                cell.SetCellValue(array2[j].ToString());
            }

            //模拟20行20列数据
            for (var i = 1; i < (dt.Rows.Count + 1); i++)
            {
                var row = table.CreateRow(i);
                for (int j = 0; j < array.Length; j++)
                {
                    var cell = row.CreateCell(j);
                    cell.SetCellValue(dt.Rows[i - 1][array[j]].ToString());
                }
            }
            //自动列宽
            for (int i = 0; i <= dt.Columns.Count; i++)
                table.AutoSizeColumn(i, true);
            return workbook;
        }
        public static void ExportExcel(DataTable dt, string fileName = "")
        {
            //生成Excel
            IWorkbook book = BuildWorkbook(dt);

            //web 下载
            if (fileName == "")
                fileName = string.Format("{0:yyyyMMddHHmmssffff}", DateTime.Now);
            fileName = fileName.Trim();
            string ext = Path.GetExtension(fileName);

            if (ext.ToLower() == ".xls" || ext.ToLower() == ".xlsx")
                fileName = fileName.Replace(ext, string.Empty);

            HttpResponse httpResponse = HttpContext.Current.Response;
            httpResponse.Clear();
            httpResponse.Buffer = true;
            httpResponse.Charset = Encoding.UTF8.BodyName;
            httpResponse.AppendHeader("Content-Disposition", "attachment;filename=" + fileName + ".xls");
            httpResponse.ContentEncoding = Encoding.UTF8;
            httpResponse.ContentType = "application/vnd.ms-excel; charset=UTF-8";
            book.Write(httpResponse.OutputStream);
            httpResponse.End();
        }
        //导出
        protected void btnAudit_ClickYJSJJP(object sender, EventArgs e)
        {
            BLL.VoteJoin bll = new BLL.VoteJoin();
            DataTable dt = bll.GetAllList(VoteId);
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                Model.VoteJoin vj = bll.GetModel(int.Parse(dt.Rows[i]["id"].ToString()));
                int addNum = (new Random()).Next(10, 30);
                vj.VoteNum += addNum;
                vj.VoteNum_XN += addNum;
                if (bll.Update(vj))
                {
                    BLL.VoteRecord bllRecord = new BLL.VoteRecord();
                    Model.VoteRecord vr = new Model.VoteRecord();
                    vr.PointId = vj.id;
                    vr.SetVoteNum = addNum;
                    vr.VoteType = 2;
                    vr.VoteRecordId = Utils.GetCookie("AdminUserId");
                    vr.VotePlatform = "管理后台管理员增加";
                    if (bllRecord.Add(vr) > 0)
                    {

                    }
                }
            }
            Response.Redirect(Utils.CombUrlTxt("VoteJoinPage.aspx", "site_id={0}&status={1}&payment_status={2}&express_status={3}&keywords={4}&VoteId={5}" ,
                this.site_id.ToString(), this.status.ToString(), this.payment_status.ToString(), this.express_status.ToString(), txtKeywords.Text, VoteId));
            /*
            //创建工作薄
            var workbook = new HSSFWorkbook();
            //创建表
            var table = workbook.CreateSheet("joye.net");

            //模拟20行20列数据
            for (var i = 0; i < 20; i++)
            {
                var row = table.CreateRow(i);
                for (int j = 0; j < 20; j++)
                {
                    var cell = row.CreateCell(j);
                    cell.SetCellValue(j);
                }
            }
            //打开xls文件，如没有则创建，如存在则在创建是不要打开该文件
            using (var fs = File.OpenWrite(@"c:/joye.net.xls"))
            {
                workbook.Write(fs);   //向打开的这个xls文件中写入mySheet表并保存。
                Console.WriteLine("生成成功");
            }
            */
        }

        //关健字查询
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            Response.Redirect(Utils.CombUrlTxt("VoteJoinPage.aspx", "site_id={0}&status={1}&payment_status={2}&express_status={3}&keywords={4}&VoteId={5}",
                this.site_id.ToString(), this.status.ToString(), this.payment_status.ToString(), this.express_status.ToString(), txtKeywords.Text, VoteId));
        }
        
        //系统自动加票
        protected void btnAudit_ClickXTZDJP(object sender, EventArgs e)
        {
            Response.Redirect("VoteAutoList_Page.aspx?voteid=" + VoteId);
        }


        //设置分页数量
        protected void txtPageNum_TextChanged(object sender, EventArgs e)
        {
            int _pagesize;
            if (int.TryParse(txtPageNum.Text.Trim(), out _pagesize))
            {
                if (_pagesize > 0)
                {
                    Utils.WriteCookie("VoteJoinPage_page_size", "DTcmsPage", _pagesize.ToString(), 14400);
                }
            }
            Response.Redirect(Utils.CombUrlTxt("VoteJoinPage.aspx", "site_id={0}&status={1}&payment_status={2}&express_status={3}&keywords={4}&VoteId={5}",
    this.site_id.ToString(), this.status.ToString(), this.payment_status.ToString(), this.express_status.ToString(), txtKeywords.Text, VoteId));
            /*
            Response.Redirect(Utils.CombUrlTxt("VoteJoinPage.aspx", "keywords={0}",
                 this.keywords));
                 */
        }

        //批量删除
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            return;
            int sucCount = 0;
            int errorCount = 0;
            BLL.orders bll = new BLL.orders();
            for (int i = 0; i < rptList.Items.Count; i++)
            {
                int id = Convert.ToInt32(((HiddenField)rptList.Items[i].FindControl("hidId")).Value);
                CheckBox cb = (CheckBox)rptList.Items[i].FindControl("chkId");
                if (cb.Checked)
                {
                    if (bll.Delete(id))
                    {
                        sucCount += 1;
                    }
                    else
                    {
                        errorCount += 1;
                    }
                }
            }
        }

    }
}