<%@ Page Language="C#" AutoEventWireup="true" Inherits="DTcms.Web.UI.Page.payment_vote" ValidateRequest="false" %>
<%@ Import namespace="System.Collections.Generic" %>
<%@ Import namespace="System.Text" %>
<%@ Import namespace="System.Data" %>
<%@ Import namespace="DTcms.Common" %>

<script runat="server">
override protected void OnInit(EventArgs e)
{

	/* 
		This page was created by DTcms Template Engine at 2020/4/6 20:16:34.
		本页面代码由DTcms模板引擎生成于 2020/4/6 20:16:34. 
	*/

	base.OnInit(e);
	StringBuilder templateBuilder = new StringBuilder(220000);

	templateBuilder.Append("<!DOCTYPE html>\r\n<!--HTML5 doctype-->\r\n<html>\r\n<head>\r\n    <meta charset=\"utf-8\">\r\n    <meta name=\"viewport\" content=\"width=device-width,initial-scale=1,user-scalable=0\">\r\n    <title>支付中心－");
	templateBuilder.Append(Utils.ObjectToStr(config.webname));
	templateBuilder.Append("</title>\r\n    <meta name=\"keywords\" content=\"");
	templateBuilder.Append(Utils.ObjectToStr(site.seo_keyword));
	templateBuilder.Append("\" />\r\n    <meta name=\"description\" content=\"");
	templateBuilder.Append(Utils.ObjectToStr(site.seo_description));
	templateBuilder.Append("\" />\r\n    <link rel=\"stylesheet\" type=\"text/css\" href=\"");
	templateBuilder.Append("/templates/mobile");
	templateBuilder.Append("/css/style.css\" />\r\n    <script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append("/templates/mobile");
	templateBuilder.Append("/js/zepto.min.js\"></");
	templateBuilder.Append("script>\r\n    <script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append("/templates/mobile");
	templateBuilder.Append("/js/weui.min.js\"></");
	templateBuilder.Append("script>\r\n    <script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append("/templates/mobile");
	templateBuilder.Append("/js/common.js\"></");
	templateBuilder.Append("script>\r\n    <script type=\"text/javascript\">\r\n\r\n    </");
	templateBuilder.Append("script>\r\n</head>\r\n\r\n<body ontouchstart>\r\n    <div class=\"page\">\r\n        <!--页面头部-->\r\n        <div class=\"header\">\r\n            <a>\r\n                <i class=\"iconfont icon-arrow-left\"></i>\r\n            </a>\r\n            <h3>支付中心</h3>\r\n            <div class=\"right\">\r\n\r\n            </div>\r\n        </div>\r\n        <!--/页面头部-->\r\n        <!--页面内容-->\r\n        <div class=\"page__bd\">\r\n            ");
	if (action=="succeed")
	{

	templateBuilder.Append("\r\n            <!--支付成功-->\r\n            <div class=\"weui-msg msg-box\">\r\n                <div class=\"weui-msg__icon-area\">\r\n                    <i class=\"weui-icon-success weui-icon_msg\"></i>\r\n                </div>\r\n                <div class=\"weui-msg__text-area\">\r\n                    <h2 class=\"weui-msg__title\">支付成功</h2>\r\n                    <p class=\"weui-msg__desc\">\r\n                        支付已经成功，可以点击下方按钮返回首页。\r\n                    </p>\r\n                </div>\r\n                <div class=\"weui-msg__opr-area\">\r\n\r\n                    <p class=\"weui-btn-area\">\r\n                        <a class=\"weui-btn weui-btn_primary\" href=\"VoteMember.aspx?id=");
	templateBuilder.Append(Utils.ObjectToStr(voteid));
	templateBuilder.Append("\">选手页面</a>\r\n                        <a class=\"weui-btn weui-btn_default\" href=\"goVote.aspx?voteid=");
	templateBuilder.Append(Utils.ObjectToStr(activiId));
	templateBuilder.Append("\">返回首页</a>\r\n                    </p>\r\n                </div>\r\n\r\n            </div>\r\n            <!--/支付成功-->\r\n            ");
	}	//end for if

	if (action=="error")
	{

	templateBuilder.Append("\r\n            <!--支付失败-->\r\n            <div class=\"weui-msg msg-box\">\r\n                <div class=\"weui-msg__icon-area\">\r\n                    <i class=\"weui-icon-warn weui-icon_msg\"></i>\r\n                </div>\r\n                <div class=\"weui-msg__text-area\">\r\n                    <h2 class=\"weui-msg__title\">支付失败</h2>\r\n                    <p class=\"weui-msg__desc\">\r\n                        支付失败，可以点击下方按钮进入会员中心查看订单，如您确实已支付，请与我们客服人员联系！\r\n                    </p>\r\n                </div>\r\n                <div class=\"weui-msg__opr-area\">\r\n                    <p class=\"weui-btn-area\">\r\n                        <a class=\"weui-btn weui-btn_primary\" href=\"VoteMember.aspx?id=");
	templateBuilder.Append(Utils.ObjectToStr(voteid));
	templateBuilder.Append("\">选手页面</a>\r\n                        <a class=\"weui-btn weui-btn_default\" href=\"goVote.aspx?voteid=");
	templateBuilder.Append(Utils.ObjectToStr(activiId));
	templateBuilder.Append("\">返回首页</a>\r\n                    </p>\r\n                </div>\r\n            </div>\r\n            <!--/支付失败-->\r\n            ");
	}	//end for if

	templateBuilder.Append("\r\n\r\n        </div>\r\n        <!--/页面内容-->\r\n\r\n    </div>\r\n</body>\r\n</html>\r\n");
	Response.Write(templateBuilder.ToString());
}
</script>
