<%@ Page Language="C#" AutoEventWireup="true" Inherits="DTcms.Web.UI.Page.error" ValidateRequest="false" %>
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

	templateBuilder.Append("<!DOCTYPE html>\r\n<!--HTML5 doctype-->\r\n<html>\r\n<head>\r\n<meta charset=\"utf-8\">\r\n<meta name=\"viewport\" content=\"width=device-width,initial-scale=1,user-scalable=0\">\r\n<title>错误提示</title>\r\n<link rel=\"stylesheet\" type=\"text/css\" href=\"");
	templateBuilder.Append("/templates/mobile");
	templateBuilder.Append("/css/style.css\" />\r\n</head>\r\n\r\n<body ontouchstart>\r\n<div class=\"page\">\r\n    <!--页面内容-->\r\n    <div class=\"page__bd\">\r\n        \r\n        <div class=\"weui-msg msg-box\">\r\n            <div class=\"weui-msg__icon-area\">\r\n                <i class=\"weui-icon-warn weui-icon_msg\"></i>\r\n            </div>\r\n            <div class=\"weui-msg__text-area\">\r\n                <h2 class=\"weui-msg__title\">错误提示</h2>\r\n                <p class=\"weui-msg__desc\">\r\n                    ");
	templateBuilder.Append(Utils.ObjectToStr(msg));
	templateBuilder.Append("\r\n                </p>\r\n            </div>\r\n            <div class=\"weui-msg__opr-area\">\r\n                <!--\r\n                                    <p class=\"weui-btn-area\">\r\n                    <a class=\"weui-btn weui-btn_default\" href=\"/index.html\">返回首页</a>\r\n                </p>\r\n                -->\r\n\r\n            </div>\r\n        </div>\r\n    \r\n  </div>\r\n  <!--/页面内容-->\r\n\r\n</div>\r\n</body>\r\n</html>\r\n");
	Response.Write(templateBuilder.ToString());
}
</script>
