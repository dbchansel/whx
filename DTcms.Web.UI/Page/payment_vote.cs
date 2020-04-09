using System;
using System.Collections.Generic;
using System.Text;
using System.Web;
using DTcms.Common;

namespace DTcms.Web.UI.Page
{
    public partial class payment_vote : Web.UI.BasePage
    {
        protected string action = string.Empty;
        protected string order_no = string.Empty;
        protected string order_type = string.Empty;
        protected decimal order_amount = 0;

        protected Model.orderconfig orderConfig = new BLL.orderconfig().loadConfig(); //订单配置
        protected Model.users userModel; //用户
        protected Model.orders orderModel; //购物
        protected Model.user_recharge rechargeModel; //充值
        protected Model.payment payModel; //支付
        protected int voteid = 0;
        protected int activiId = 0;

        /// <summary>
        /// 重写父类的虚方法,此方法将在Init事件前执行
        /// </summary>
        protected override void ShowPage()
        {
            this.Init += new EventHandler(payment_Init); //加入Init事件
        }

        /// <summary>
        /// 将在Init事件执行
        /// </summary>
        protected void payment_Init(object sender, EventArgs e)
        {
            //取得处事类型
            action = DTRequest.GetQueryString("action");
            order_no = DTRequest.GetQueryString("order_no");
            order_type = DTEnums.AmountTypeEnum.BuyGoods.ToString().ToLower();
            switch (action)
            {         
                case "succeed":
                    //检查订单的类型(充值或购物)
                    orderModel = new BLL.orders().GetModel(order_no);
                    if (orderModel == null)
                    {
                        HttpContext.Current.Response.Redirect("error.aspx?msg=" + Utils.UrlEncode("出错啦，订单号不存在或已删除！"));
                        return;
                    }
                    else
                    {
                        ChangeVoteNum();
                    }
                    break;
                case "error":
                    //检查订单的类型(充值或购物)
                    orderModel = new BLL.orders().GetModel(order_no);
                    if (orderModel == null)
                    {
                        HttpContext.Current.Response.Redirect("error.aspx?msg=" + Utils.UrlEncode("出错啦，订单号不存在或已删除！"));
                        return;
                    }
                    break;
                }
            }
        private void ChangeVoteNum()
        {
            voteid = orderModel.voteid;
            int voteNum = (int)(orderModel.order_amount * 100);
            Model.VoteJoin vj = new BLL.VoteJoin().GetModel(voteid);
            if (vj != null)
            {
                vj.VoteNum += voteNum;
                activiId = vj.VoteId;
                if (new BLL.VoteJoin().Update(vj))
                {

                }
                else
                    HttpContext.Current.Response.Redirect("error.aspx?msg=" + Utils.UrlEncode("支付成功，但投票出错，请联系管理员！"));
            }
            else
                HttpContext.Current.Response.Redirect("error.aspx?msg=" + Utils.UrlEncode("出错啦，未查找到该活动！"));
        }
    }
}