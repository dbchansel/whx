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
    public partial class VoteAutoList_Page : Web.UI.ManagePage
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
        private static Model.Vote v = new Model.Vote();

        protected void Page_Load(object sender, EventArgs e)
        {
            VoteId = DTRequest.GetQueryString("VoteId");
           
            if (!Page.IsPostBack)
            {
                v = new BLL.Vote().GetModel(int.Parse(VoteId));
                RptBind("id>0 and VoteId='" + VoteId + "' ", "CreateDate desc");
            }
        }

        #region 数据绑定=================================
        private void RptBind(string _strWhere, string _orderby)
        {
            BLL.VoteAuto bll = new BLL.VoteAuto();
            this.rptList.DataSource = bll.GetAllList(VoteId);
            this.rptList.DataBind();
        }
        #endregion

        //审核
        protected void btnAudit_Click(object sender, EventArgs e)
        {
            BLL.VoteAuto bll = new BLL.VoteAuto();
            Repeater rptList = this.rptList;
            for (int i = 0; i < rptList.Items.Count; i++)
            {
                int id = Convert.ToInt32(((HiddenField)rptList.Items[i].FindControl("hidId")).Value);
                CheckBox cb = (CheckBox)rptList.Items[i].FindControl("chkId");
                if (cb.Checked)
                {
                    bll.UpdateField(id, "sta=1");
                    AddAdminLog(DTEnums.ActionEnum.Audit.ToString(), "启用" + ":审核参加投票活动:" + new BLL.Vote().GetModel(id).Activity_Title); //记录日志
                }
            }

            JscriptMsg("批量启用成功！", Utils.CombUrlTxt("VoteAutoList_Page.aspx", "VoteId={0}", VoteId.ToString()));
        }
        //锁定
        protected void btnAudit_ClickSD(object sender, EventArgs e)
        {
            BLL.VoteAuto bll = new BLL.VoteAuto();
            Repeater rptList = this.rptList;
            for (int i = 0; i < rptList.Items.Count; i++)
            {
                int id = Convert.ToInt32(((HiddenField)rptList.Items[i].FindControl("hidId")).Value);
                CheckBox cb = (CheckBox)rptList.Items[i].FindControl("chkId");
                if (cb.Checked)
                {
                    bll.UpdateField(id, "sta=2");
                    AddAdminLog(DTEnums.ActionEnum.Audit.ToString(), "禁用" + new BLL.Vote().GetModel(int.Parse(VoteId)).Activity_Title + ":审核参加客户:" + new BLL.VoteJoin().GetModel(id).JoinName); //记录日志
                }
            }

            JscriptMsg("批量禁用成功！", Utils.CombUrlTxt("VoteAutoList_Page.aspx", "VoteId={0}", VoteId.ToString()));
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
    }
}