﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="DTcms.Web.UI.Page.usermessage_show" ValidateRequest="false" %>
<%@ Import namespace="System.Collections.Generic" %>
<%@ Import namespace="System.Text" %>
<%@ Import namespace="System.Data" %>
<%@ Import namespace="DTcms.Common" %>

<script runat="server">
override protected void OnInit(EventArgs e)
{

	/* 
		This page was created by DTcms Template Engine at 2020/3/31 20:02:53.
		本页面代码由DTcms模板引擎生成于 2020/3/31 20:02:53. 
	*/

	base.OnInit(e);
	StringBuilder templateBuilder = new StringBuilder(220000);

	templateBuilder.Append("<!doctype html>\r\n<html>\r\n<head>\r\n<meta charset=\"utf-8\">\r\n<title>站内短信息 - ");
	templateBuilder.Append(Utils.ObjectToStr(site.name));
	templateBuilder.Append("</title>\r\n<meta name=\"keywords\" content=\"");
	templateBuilder.Append(Utils.ObjectToStr(site.seo_keyword));
	templateBuilder.Append("\" />\r\n<meta name=\"description\" content=\"");
	templateBuilder.Append(Utils.ObjectToStr(site.seo_description));
	templateBuilder.Append("\" />\r\n<link rel=\"stylesheet\" type=\"text/css\" href=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("scripts/artdialog/ui-dialog.css\" />\r\n<link rel=\"stylesheet\" type=\"text/css\" href=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/css/style.css\" />\r\n<script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("scripts/jquery/jquery-1.11.2.min.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("scripts/artdialog/dialog-plus-min.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/js/common.js\"></");
	templateBuilder.Append("script>\r\n</head>\r\n\r\n<body>\r\n<!--页面头部-->\r\n");

	templateBuilder.Append("<div class=\"header\">\r\n    <div class=\"head-top\">\r\n        <div class=\"section\">\r\n            <div class=\"left-box\">\r\n                <span>网站链接：</span>\r\n                <a target=\"_blank\" href=\"/\">东营创新创业服务平台</a>                \r\n            </div>\r\n            <script type=\"text/javascript\">\r\n                $.ajax({\r\n                    type: \"POST\",\r\n                    url: \"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/submit_ajax.ashx?action=user_check_login\",\r\n                    dataType: \"json\",\r\n                    timeout: 20000,\r\n                    success: function (data, textStatus) {\r\n                        if (data.status == 1) {\r\n                            $(\"#hbbd_menu\").prepend('<a href=\"");
	templateBuilder.Append(linkurl("usercenter","index"));

	templateBuilder.Append("\">我的账户</a>');\r\n                            $(\"#hbbd_menu\").prepend('<a href=\"");
	templateBuilder.Append(linkurl("usercenter","exit"));

	templateBuilder.Append("\">退出</a>');                            \r\n                        } else {\r\n                            $(\"#hbbd_menu\").prepend('<a href=\"");
	templateBuilder.Append(linkurl("login"));

	templateBuilder.Append("\">登录</a>');\r\n                            $(\"#hbbd_menu\").prepend('<a href=\"");
	templateBuilder.Append(linkurl("register"));

	templateBuilder.Append("\">注册</a>');                            \r\n                        }\r\n                    }\r\n                });\r\n            </");
	templateBuilder.Append("script>\r\n            <div id=\"menu\" class=\"right-box\">\r\n                <a href=\"");
	templateBuilder.Append(linkurl("content","contact"));

	templateBuilder.Append("\"><i class=\"iconfont icon-phone\"></i>联系我们</a>                \r\n            </div>\r\n        </div>\r\n    </div>\r\n    <div class=\"head-body\">\r\n        <div class=\"head-body-div\">\r\n            <div class=\"head-body-div-div1\">\r\n            </div>\r\n            <div class=\"head-body-div-div2\">\r\n                <div class=\"hbbd_search\">\r\n                    <div class=\"hbbd_search_txt\">\r\n                        <input id=\"keywords\" name=\"keywords\" type=\"text\" onkeydown=\"if(event.keyCode==13){SiteSearch('");
	templateBuilder.Append(linkurl("search"));

	templateBuilder.Append("', '#keywords');return false};\" placeholder=\"输入关健字\" x-webkit-speech=\"\" />\r\n                    </div>\r\n                    <div class=\"hbbd_search_bt\">\r\n                        <a href=\"javascript:;\" onclick=\"SiteSearch('");
	templateBuilder.Append(linkurl("search"));

	templateBuilder.Append("', '#keywords');\">                            \r\n                        </a>\r\n                    </div>\r\n                </div>\r\n            </div>\r\n            <div class=\"head-body-div-div3\">\r\n                <div class=\"hbbd_menu\" id=\"hbbd_menu\">\r\n                    \r\n                </div>\r\n            </div>\r\n        </div>\r\n    </div>\r\n    <div class=\"head-nav-div\">\r\n        <div class=\"nav-box2\">\r\n            <ul>\r\n                <li class=\"top_a\"><a href=\"");
	templateBuilder.Append(linkurl("index"));

	templateBuilder.Append("\">网站首页</a></li>\r\n                <li class=\"top_a\"><a href=\"");
	templateBuilder.Append(linkurl("news"));

	templateBuilder.Append("\">创业资讯</a></li>\r\n                <li class=\"top_a\"><a href=\"#\">创想邦</a></li>\r\n                <li class=\"top_a\"><a href=\"#\">公共服务</a></li>\r\n                <li class=\"top_a\"><a href=\"#\">创新地图</a></li>\r\n                <li class=\"top_a\"><a href=\"#\">创客驿站</a></li>\r\n                <li class=\"top_a\"><a href=\"#\">双创政策</a></li>\r\n                <li class=\"top_a\"><a href=\"#\">项目申报</a></li>\r\n                <li class=\"top_a\"><a href=\"#\">创新学院</a></li>\r\n                <li class=\"top_a\"><a href=\"#\">动态展示</a></li>                \r\n            </ul>\r\n        </div>\r\n    </div>    \r\n</div>");


	templateBuilder.Append("\r\n<!--/页面头部-->\r\n\r\n<!--当前位置-->\r\n<div class=\"section\">\r\n    <div class=\"location\">\r\n        <span>当前位置：</span>\r\n        <a href=\"");
	templateBuilder.Append(linkurl("index"));

	templateBuilder.Append("\">首页</a> &gt;\r\n        <a href=\"");
	templateBuilder.Append(linkurl("usercenter","index"));

	templateBuilder.Append("\">会员中心</a>\r\n        <a href=\"");
	templateBuilder.Append(linkurl("usermessage","list"));

	templateBuilder.Append("\">站内短消息</a>\r\n    </div>\r\n</div>\r\n<!--/当前位置-->\r\n\r\n<div class=\"section clearfix\">\r\n    <!--页面左边-->\r\n    ");

	templateBuilder.Append("    <div class=\"left-260\">\r\n        <div class=\"bg-wrap\">\r\n            <div class=\"avatar-box\">\r\n                <a class=\"img-box\" href=\"");
	templateBuilder.Append(linkurl("usercenter","avatar"));

	templateBuilder.Append("\">\r\n                ");
	if (userModel.avatar!="")
	{

	templateBuilder.Append("\r\n                    <img src=\"");
	templateBuilder.Append(Utils.ObjectToStr(userModel.avatar));
	templateBuilder.Append("\" />\r\n                ");
	}
	else
	{

	templateBuilder.Append("\r\n                    <i class=\"iconfont icon-user-full\"></i>\r\n                ");
	}	//end for if

	templateBuilder.Append("\r\n                </a>\r\n                <h3>\r\n                ");
	if (userModel.nick_name!="")
	{

	templateBuilder.Append("\r\n                    ");
	templateBuilder.Append(Utils.ObjectToStr(userModel.nick_name));
	templateBuilder.Append("\r\n                ");
	}
	else
	{

	templateBuilder.Append("\r\n                    ");
	templateBuilder.Append(Utils.ObjectToStr(userModel.user_name));
	templateBuilder.Append("\r\n                ");
	}	//end for if

	templateBuilder.Append("\r\n                </h3>\r\n                <p><b>");
	templateBuilder.Append(Utils.ObjectToStr(groupModel.title));
	templateBuilder.Append("</b></p>\r\n            </div>\r\n            \r\n            <div class=\"center-nav\">\r\n                <ul>\r\n                    <li>\r\n                        <h2>\r\n                            <i class=\"iconfont icon-order\"></i>\r\n                            <span>订单管理</span>\r\n                        </h2>\r\n                        <div class=\"list\">\r\n                            <p><a href=\"");
	templateBuilder.Append(linkurl("userorder","list"));

	templateBuilder.Append("\"><i class=\"iconfont icon-arrow-right\"></i>交易订单</a></p>\r\n                            <p><a href=\"");
	templateBuilder.Append(linkurl("userorder","close"));

	templateBuilder.Append("\"><i class=\"iconfont icon-arrow-right\"></i>失效订单</a></p>\r\n                            <p><a href=\"");
	templateBuilder.Append(linkurl("useraddress"));

	templateBuilder.Append("\"><i class=\"iconfont icon-arrow-right\"></i>收货地址</a></p>\r\n                        </div>\r\n                    </li>\r\n                    <li>\r\n                        <h2>\r\n                            <i class=\"iconfont icon-amount\"></i>\r\n                            <span>余额管理</span>\r\n                        </h2>\r\n                        <div class=\"list\">\r\n                            <p><a href=\"");
	templateBuilder.Append(linkurl("useramount","recharge"));

	templateBuilder.Append("\"><i class=\"iconfont icon-arrow-right\"></i>账户充值</a></p>\r\n                            <p><a href=\"");
	templateBuilder.Append(linkurl("useramount","log"));

	templateBuilder.Append("\"><i class=\"iconfont icon-arrow-right\"></i>充值记录</a></p>\r\n                            <p><a href=\"");
	templateBuilder.Append(linkurl("useramount","list"));

	templateBuilder.Append("\"><i class=\"iconfont icon-arrow-right\"></i>收支明细</a></p>\r\n                        </div>\r\n                    </li>\r\n                    <li>\r\n                        <h2>\r\n                            <i class=\"iconfont icon-point\"></i>\r\n                            <span>积分管理</span>\r\n                        </h2>\r\n                        <div class=\"list\">\r\n                            <p><a href=\"");
	templateBuilder.Append(linkurl("userpoint","convert"));

	templateBuilder.Append("\"><i class=\"iconfont icon-arrow-right\"></i>积分兑换</a></p>\r\n                            <p><a href=\"");
	templateBuilder.Append(linkurl("userpoint","list"));

	templateBuilder.Append("\"><i class=\"iconfont icon-arrow-right\"></i>积分明细</a></p>\r\n                        </div>\r\n                    </li>\r\n                    <li>\r\n                        <h2>\r\n                            <i class=\"iconfont icon-comment\"></i>\r\n                            <span>站内消息</span>\r\n                        </h2>\r\n                        <div class=\"list\">\r\n                            <p><a href=\"");
	templateBuilder.Append(linkurl("usermessage","system"));

	templateBuilder.Append("\"><i class=\"iconfont icon-arrow-right\"></i>系统消息</a></p>\r\n                            <p><a href=\"");
	templateBuilder.Append(linkurl("usermessage","accept"));

	templateBuilder.Append("\"><i class=\"iconfont icon-arrow-right\"></i>收件箱</a></p>\r\n                            <p><a href=\"");
	templateBuilder.Append(linkurl("usermessage","send"));

	templateBuilder.Append("\"><i class=\"iconfont icon-arrow-right\"></i>发件箱</a></p>\r\n                        </div>\r\n                    </li>\r\n                    <li>\r\n                        <h2>\r\n                            <i class=\"iconfont icon-user\"></i>\r\n                            <span>账户管理</span>\r\n                        </h2>\r\n                        <div class=\"list\">\r\n                            <p><a href=\"");
	templateBuilder.Append(linkurl("usercenter","invite"));

	templateBuilder.Append("\"><i class=\"iconfont icon-arrow-right\"></i>邀请注册</a></p>\r\n                            <p><a href=\"");
	templateBuilder.Append(linkurl("usercenter","proinfo"));

	templateBuilder.Append("\"><i class=\"iconfont icon-arrow-right\"></i>账户资料</a></p>\r\n                            <p><a href=\"");
	templateBuilder.Append(linkurl("usercenter","avatar"));

	templateBuilder.Append("\"><i class=\"iconfont icon-arrow-right\"></i>头像设置</a></p>\r\n                            <p><a href=\"");
	templateBuilder.Append(linkurl("usercenter","password"));

	templateBuilder.Append("\"><i class=\"iconfont icon-arrow-right\"></i>修改密码</a></p>\r\n                            <p><a href=\"");
	templateBuilder.Append(linkurl("usercenter","exit"));

	templateBuilder.Append("\"><i class=\"iconfont icon-arrow-right\"></i>退出登录</a></p>\r\n                        </div>\r\n                    </li>\r\n                </ul>\r\n            </div>\r\n                \r\n        </div>\r\n    </div>");


	templateBuilder.Append("\r\n    <!--/页面左边-->\r\n    \r\n    <!--页面左边-->\r\n    <div class=\"right-auto\">\r\n        <div class=\"bg-wrap\" style=\"min-height:765px;\">\r\n            \r\n            <div class=\"sub-tit\">\r\n                <a class=\"add\" href=\"javascript:history.go(-1);\"><i class=\"iconfont icon-reply\"></i>返回</a>\r\n                <ul>\r\n                    <li class=\"selected\">\r\n                        <a href=\"javascript:;\">查看短消息</a>\r\n                    </li>\r\n                </ul>\r\n            </div>\r\n            <div class=\"meta\">\r\n                <h2>");
	templateBuilder.Append(Utils.ObjectToStr(model.title));
	templateBuilder.Append("</h2>\r\n                <div class=\"info\">\r\n                    <span><i class=\"iconfont icon-date\"></i>");
	templateBuilder.Append(Utils.ObjectToStr(model.post_time));
	templateBuilder.Append("</span>\r\n                    ");
	if (model.type==2)
	{

	templateBuilder.Append("\r\n                        <span><i class=\"iconfont icon-user\"></i>发件人：");
	templateBuilder.Append(Utils.ObjectToStr(model.post_user_name));
	templateBuilder.Append("</span>\r\n                    ");
	}
	else if (model.type==3)
	{

	templateBuilder.Append("\r\n                        <span><i class=\"iconfont icon-user\"></i>收件人：");
	templateBuilder.Append(Utils.ObjectToStr(model.accept_user_name));
	templateBuilder.Append("</span>\r\n                    ");
	}	//end for if

	templateBuilder.Append("\r\n                </div>\r\n            </div>\r\n            \r\n            <div class=\"entry\">\r\n                ");
	templateBuilder.Append(Utils.ObjectToStr(model.content));
	templateBuilder.Append("\r\n            </div>\r\n            \r\n        </div>\r\n    </div>\r\n    <!--/页面左边-->\r\n</div>\r\n\r\n<!--页面底部-->\r\n");

	templateBuilder.Append("<div class=\"footer\">\r\n    <div class=\"section\">        \r\n        <div class=\"foot-box\">\r\n            <div class=\"copyright\">\r\n                <p>版权所有 ");
	templateBuilder.Append(Utils.ObjectToStr(site.company));
	templateBuilder.Append(" ");
	templateBuilder.Append(Utils.ObjectToStr(site.crod));
	templateBuilder.Append("</p>\r\n                <p>公司地址：");
	templateBuilder.Append(Utils.ObjectToStr(site.address));
	templateBuilder.Append(" 联系电话：");
	templateBuilder.Append(Utils.ObjectToStr(site.tel));
	templateBuilder.Append("</p>\r\n                <p class=\"gray\">Copyright © 2009-2017 dycxpt.com Corporation,All Rights Reserved.</p>\r\n            </div>\r\n            <div class=\"service\">\r\n                <p>东营创新创业服务平台</p>                \r\n            </div>\r\n        </div>\r\n    </div>\r\n</div>");


	templateBuilder.Append("\r\n<!--/页面底部-->\r\n</body>\r\n</html>");
	Response.Write(templateBuilder.ToString());
}
</script>
