﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="DTcms.Web.UI.Page.article" ValidateRequest="false" %>
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

	base.channel = "down";
	base.OnInit(e);
	StringBuilder templateBuilder = new StringBuilder(220000);

	templateBuilder.Append("<!doctype html>\r\n<html>\r\n<head>\r\n<meta charset=\"utf-8\">\r\n<title>资源下载 - ");
	templateBuilder.Append(Utils.ObjectToStr(site.name));
	templateBuilder.Append("</title>\r\n<meta name=\"keywords\" content=\"");
	templateBuilder.Append(Utils.ObjectToStr(site.seo_keyword));
	templateBuilder.Append("\" />\r\n<meta name=\"description\" content=\"");
	templateBuilder.Append(Utils.ObjectToStr(site.seo_description));
	templateBuilder.Append("\" />\r\n<link rel=\"stylesheet\" type=\"text/css\" href=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/css/style.css\">\r\n<script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("scripts/jquery/jquery-1.11.2.min.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/js/common.js\"></");
	templateBuilder.Append("script>\r\n</head>\r\n\r\n<body id=\"down\">\r\n<!--页面头部-->\r\n");

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
	templateBuilder.Append(linkurl("down"));

	templateBuilder.Append("\">资源下载</a>\r\n    </div>\r\n</div>\r\n<!--/当前位置-->\r\n\r\n<!--/推荐资源-->\r\n<div class=\"section\">\r\n    <div class=\"wrapper clearfix\">\r\n        <div class=\"wrap-box\">\r\n            <div class=\"left-455\" style=\"margin:0;\">\r\n                <div class=\"side-img-box\">\r\n                ");
	DataTable focusList = get_article_list(channel, 0, 1, "status=0 and is_slide=1");

	foreach(DataRow dr in focusList.Rows)
	{

	templateBuilder.Append("\r\n                    <a href=\"");
	templateBuilder.Append(linkurl("down_show",Utils.ObjectToStr(dr["id"])));

	templateBuilder.Append("\">\r\n                        <div class=\"abs-bg\"></div>\r\n                        <div class=\"info\">\r\n                            <h3>" + Utils.ObjectToStr(dr["title"]) + "</h3>\r\n                            <p>");	templateBuilder.Append(Utils.ObjectToDateTime(Utils.ObjectToStr(dr["add_time"])).ToString("yyyy-MM-dd"));

	templateBuilder.Append("</p>\r\n                        </div>\r\n                        <img src=\"" + Utils.ObjectToStr(dr["img_url"]) + "\" />\r\n                    </a>\r\n                ");
	}	//end for if

	templateBuilder.Append("\r\n                </div>\r\n            </div>\r\n            <div class=\"left-690\">\r\n                <ul class=\"img-list\">\r\n                ");
	DataTable redList = get_article_list(channel, 0, 6, "status=0 and is_red=1");

	foreach(DataRow dr in redList.Rows)
	{

	templateBuilder.Append("\r\n                    <li>\r\n                        <a href=\"");
	templateBuilder.Append(linkurl("down_show",Utils.ObjectToStr(dr["id"])));

	templateBuilder.Append("\">\r\n                            <div class=\"img-box\"><img src=\"" + Utils.ObjectToStr(dr["img_url"]) + "\" /></div>\r\n                            <div class=\"abs-bg\"></div>\r\n                            <div class=\"remark\">\r\n                                <h3>" + Utils.ObjectToStr(dr["title"]) + "</h3>\r\n                                <p>");	templateBuilder.Append(Utils.ObjectToDateTime(Utils.ObjectToStr(dr["add_time"])).ToString("yyyy-MM-dd"));

	templateBuilder.Append("</p>\r\n                            </div>\r\n                        </a>\r\n                    </li>\r\n                ");
	}	//end for if

	templateBuilder.Append("\r\n                </ul>\r\n            </div>\r\n        </div>\r\n    </div>\r\n</div>\r\n<!--/推荐资源-->\r\n\r\n<!--分类推荐-->\r\n<div class=\"section\">\r\n    ");
	DataTable categoryList = get_category_child_list(channel,0);

	foreach(DataRow cdr in categoryList.Rows)
	{

	templateBuilder.Append("\r\n    <div class=\"main-tit\">\r\n        <h2>" + Utils.ObjectToStr(cdr["title"]) + "</h2>\r\n        <p>\r\n            ");
	DataTable bcategoryList = get_category_child_list(channel,Utils.StrToInt(Utils.ObjectToStr(cdr["id"]), 0));

	foreach(DataRow dr in bcategoryList.Rows)
	{

	templateBuilder.Append("\r\n            <a href=\"");
	templateBuilder.Append(linkurl("down_list",Utils.ObjectToStr(dr["id"])));

	templateBuilder.Append("\">" + Utils.ObjectToStr(dr["title"]) + "</a>\r\n            ");
	}	//end for if

	templateBuilder.Append("\r\n            <a href=\"");
	templateBuilder.Append(linkurl("down_list",Utils.ObjectToStr(cdr["id"])));

	templateBuilder.Append("\">更多<i>+</i></a>\r\n        </p>\r\n    </div>\r\n    <div class=\"wrapper clearfix\">\r\n        <div class=\"wrap-box\">\r\n            <ul class=\"img-list\">\r\n            ");
	DataTable dt = get_article_list(channel, Utils.StrToInt(Utils.ObjectToStr(cdr["id"]), 0), 5, "status=0");

	foreach(DataRow dr in dt.Rows)
	{

	templateBuilder.Append("\r\n                <li>\r\n                    <a title=\"" + Utils.ObjectToStr(dr["title"]) + "\" href=\"");
	templateBuilder.Append(linkurl("down_show",Utils.ObjectToStr(dr["id"])));

	templateBuilder.Append("\">\r\n                        <div class=\"img-box\"><img src=\"" + Utils.ObjectToStr(dr["img_url"]) + "\" /></div>\r\n                        <div class=\"info\">\r\n                            <h3>" + Utils.ObjectToStr(dr["title"]) + "</h3>\r\n                            <p>\r\n                                <strong>下载 <script type=\"text/javascript\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/submit_ajax.ashx?action=view_attach_count&channel_id=" + Utils.ObjectToStr(dr["channel_id"]) + "id=" + Utils.ObjectToStr(dr["id"]) + "&view=count\"></");
	templateBuilder.Append("script></strong>\r\n                                <span>");	templateBuilder.Append(Utils.ObjectToDateTime(Utils.ObjectToStr(dr["add_time"])).ToString("yyyy-MM-dd"));

	templateBuilder.Append("</span>\r\n                            </p>\r\n                        </div>\r\n                    </a>\r\n                </li>\r\n            ");
	}	//end for if

	templateBuilder.Append("\r\n            </ul>\r\n        </div>\r\n    </div>\r\n    ");
	}	//end for if

	templateBuilder.Append("\r\n</div>\r\n<!--/分类推荐-->\r\n\r\n<!--页面底部-->\r\n");

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
