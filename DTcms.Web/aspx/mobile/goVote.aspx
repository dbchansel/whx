<%@ Page Language="C#" AutoEventWireup="true" Inherits="DTcms.Web.UI.Page.goVote" ValidateRequest="false" %>
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

	templateBuilder.Append("<!DOCTYPE html>\r\n<!--HTML5 doctype-->\r\n<html>\r\n<head>\r\n    <meta charset=\"utf-8\">\r\n    <meta name=\"viewport\" content=\"width=device-width,initial-scale=1,user-scalable=0\">\r\n    <title>投票登录</title>\r\n    <meta name=\"keywords\" content=\"");
	templateBuilder.Append(Utils.ObjectToStr(site.seo_keyword));
	templateBuilder.Append("\" />\r\n    <meta name=\"description\" content=\"");
	templateBuilder.Append(Utils.ObjectToStr(site.seo_description));
	templateBuilder.Append("\" />\r\n    <link rel=\"stylesheet\" type=\"text/css\" href=\"");
	templateBuilder.Append("/templates/mobile");
	templateBuilder.Append("/css/validate.css\" />\r\n    <link rel=\"stylesheet\" type=\"text/css\" href=\"");
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
	templateBuilder.Append("script>\r\n    <script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append("/templates/mobile");
	templateBuilder.Append("/js/mvalidate.js\"></");
	templateBuilder.Append("script>\r\n    <script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append("/templates/mobile");
	templateBuilder.Append("/js/mvalidate-extend.js\"></");
	templateBuilder.Append("script>\r\n    <script type=\"text/javascript\">\r\n        var openid; // 用户openid\r\n        var nickname; // 用户昵称\r\n        var headimgurl; //用户头像\r\n        $(document).ready(function () {\r\n            checkCookie();      \r\n        });\r\n\r\n        function checkCookie() {\r\n            openid = getCookie('openid')\r\n            if (openid != null && openid != \"\")\r\n            {\r\n                window.location.href = \"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("aspx/mobile/Vote.aspx?openid=\" + openid + \"&VoteId=");
	templateBuilder.Append(Utils.ObjectToStr(voteID));
	templateBuilder.Append("\";\r\n            }\r\n            else\r\n            {\r\n                window.location.href = \"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("api/oauth/index.aspx?id=4&vote=");
	templateBuilder.Append(Utils.ObjectToStr(voteID));
	templateBuilder.Append("\";\r\n            }\r\n        }\r\n        function getCookie(c_name) {\r\n            if (document.cookie.length > 0) {\r\n                c_start = document.cookie.indexOf(c_name + \"=\")\r\n                if (c_start != -1) {\r\n                    c_start = c_start + c_name.length + 1\r\n                    c_end = document.cookie.indexOf(\";\", c_start)\r\n                    if (c_end == -1) c_end = document.cookie.length\r\n                    return unescape(document.cookie.substring(c_start, c_end))\r\n                }\r\n            }\r\n            return \"\"\r\n        }\r\n\r\n\r\n    </");
	templateBuilder.Append("script>\r\n</head>\r\n\r\n<body ontouchstart>\r\n  \r\n</body>\r\n</html>\r\n");
	Response.Write(templateBuilder.ToString());
}
</script>
