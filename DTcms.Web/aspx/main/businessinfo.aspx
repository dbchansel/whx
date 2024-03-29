﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="DTcms.Web.UI.Page.article_list" ValidateRequest="false" %>
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

	base.channel = "news";
	base.OnInit(e);
	StringBuilder templateBuilder = new StringBuilder(220000);
	const int pagesize = 12;

	templateBuilder.Append("<!doctype html>\r\n<html>\r\n<head>\r\n    <meta charset=\"utf-8\">\r\n    <title>");
	templateBuilder.Append(Utils.ObjectToStr(model.title));
	templateBuilder.Append(" - ");
	templateBuilder.Append(Utils.ObjectToStr(site.name));
	templateBuilder.Append("</title>\r\n    <meta name=\"keywords\" content=\"");
	templateBuilder.Append(Utils.ObjectToStr(model.seo_keywords));
	templateBuilder.Append("\" />\r\n    <meta name=\"description\" content=\"");
	templateBuilder.Append(Utils.ObjectToStr(model.seo_description));
	templateBuilder.Append("\" />\r\n    <link rel=\"stylesheet\" type=\"text/css\" href=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("css/pagination.css\" />\r\n    <link rel=\"stylesheet\" type=\"text/css\" href=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/css/style.css\" />\r\n    <link rel=\"stylesheet\" type=\"text/css\" href=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/css/validate.css\" />\r\n    <script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/js/mvalidate.js\"></");
	templateBuilder.Append("script>\r\n    <script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/js/mvalidate-extend.js\"></");
	templateBuilder.Append("script>\r\n    <script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("scripts/jquery/jquery-1.11.2.min.js\"></");
	templateBuilder.Append("script>\r\n    <script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/js/common.js\"></");
	templateBuilder.Append("script>\r\n</head>\r\n\r\n<body id=\"news\">\r\n    <!--页面头部-->\r\n    ");

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


	templateBuilder.Append("\r\n    <!--/页面头部-->\r\n    <!--当前位置-->\r\n    ");
	string category_nav = get_category_menu("news_list", category_id);

	templateBuilder.Append("\r\n    <div class=\"section\">\r\n        <div class=\"location\">\r\n            <span>当前位置：</span>\r\n            <a href=\"");
	templateBuilder.Append(linkurl("index"));

	templateBuilder.Append("\">首页</a> &gt;\r\n            <a href=\"");
	templateBuilder.Append(linkurl("news"));

	templateBuilder.Append("\">新闻资讯</a>\r\n            ");
	templateBuilder.Append(Utils.ObjectToStr(category_nav));
	templateBuilder.Append("\r\n        </div>\r\n    </div>\r\n    <!--/当前位置-->\r\n\r\n    <div class=\"section clearfix\">\r\n        <!--/页面右边-->\r\n        <div class=\"right-260\">\r\n            <div class=\"bg-wrap nobg\">\r\n                <div class=\"sidebar-box\">\r\n                    <h4>资讯类别</h4>\r\n                    <ul class=\"navbar\">\r\n                        ");
	DataTable categoryList1 = get_category_child_list(channel, 0);

	foreach(DataRow cdr1 in categoryList1.Rows)
	{

	templateBuilder.Append("\r\n                        <li>\r\n                            <h5><a href=\"");
	templateBuilder.Append(linkurl("news_list",Utils.ObjectToStr(cdr1["id"])));

	templateBuilder.Append("\">" + Utils.ObjectToStr(cdr1["title"]) + "</a></h5>\r\n                            <p>\r\n                                ");
	DataTable categoryList2 = get_category_child_list(channel, Utils.StrToInt(Utils.ObjectToStr(cdr1["id"]), 0));

	foreach(DataRow cdr2 in categoryList2.Rows)
	{

	if (Utils.StrToInt(Utils.ObjectToStr(cdr2["id"]), 0)==category_id)
	{

	templateBuilder.Append("\r\n                                <a href=\"");
	templateBuilder.Append(linkurl("news_list",Utils.ObjectToStr(cdr2["id"])));

	templateBuilder.Append("\" class=\"selected\">" + Utils.ObjectToStr(cdr2["title"]) + "</a>\r\n                                ");
	}
	else
	{

	templateBuilder.Append("\r\n                                <a href=\"");
	templateBuilder.Append(linkurl("news_list",Utils.ObjectToStr(cdr2["id"])));

	templateBuilder.Append("\">" + Utils.ObjectToStr(cdr2["title"]) + "</a>\r\n                                ");
	}	//end for if

	}	//end for if

	templateBuilder.Append("\r\n                            </p>\r\n                        </li>\r\n                        ");
	}	//end for if

	templateBuilder.Append("\r\n                    </ul>\r\n                </div>\r\n\r\n                <div class=\"sidebar-box\">\r\n                    <h4>图片新闻</h4>\r\n                    <ul class=\"side-img-list\">\r\n                        ");
	DataTable redNews = get_article_list(channel, 0, 4, "status=0 and is_red=1 and img_url<>''");

	foreach(DataRow dr in redNews.Rows)
	{

	templateBuilder.Append("\r\n                        <li>\r\n                            <div class=\"img-box\">\r\n                                <img src=\"" + Utils.ObjectToStr(dr["img_url"]) + "\" />\r\n                            </div>\r\n                            <div class=\"txt-box\">\r\n                                <a href=\"");
	templateBuilder.Append(linkurl("news_show",Utils.ObjectToStr(dr["id"])));

	templateBuilder.Append("\">" + Utils.ObjectToStr(dr["title"]) + "</a>\r\n                                <span>");	templateBuilder.Append(Utils.ObjectToDateTime(Utils.ObjectToStr(dr["add_time"])).ToString("yyyy-MM-dd"));

	templateBuilder.Append("</span>\r\n                            </div>\r\n                        </li>\r\n                        ");
	}	//end for if

	templateBuilder.Append("\r\n                    </ul>\r\n                </div>\r\n\r\n                <div class=\"sidebar-box\">\r\n                    <h4>阅读排行</h4>\r\n                    <ul class=\"txt-list\">\r\n                        ");
	DataTable hotNews = get_article_list(channel, 0, 10, "status=0", "click desc,id desc");

	int hotdr__loop__id=0;
	foreach(DataRow hotdr in hotNews.Rows)
	{
		hotdr__loop__id++;


	templateBuilder.Append("\r\n                        <li>\r\n                            ");
	if (hotdr__loop__id<2)
	{

	templateBuilder.Append("\r\n                                <label class=\"hot\">");
	templateBuilder.Append(hotdr__loop__id.ToString());

	templateBuilder.Append("</label>\r\n                                ");
	}
	else
	{

	templateBuilder.Append("\r\n                                <label>");
	templateBuilder.Append(hotdr__loop__id.ToString());

	templateBuilder.Append("</label>\r\n                                ");
	}	//end for if

	templateBuilder.Append("\r\n                                <a href=\"");
	templateBuilder.Append(linkurl("news_show",Utils.ObjectToStr(hotdr["id"])));

	templateBuilder.Append("\">" + Utils.ObjectToStr(hotdr["title"]) + "</a>\r\n                        </li>\r\n                        ");
	}	//end for if

	templateBuilder.Append("\r\n                    </ul>\r\n                </div>\r\n\r\n            </div>\r\n        </div>\r\n        <!--/页面右边-->\r\n        <!--页面左边-->\r\n        <div class=\"left-auto\">\r\n            <div class=\"bg-wrap\">\r\n                <ul class=\"n-list\">\r\n                    <!--取得一个分页DataTable-->\r\n                    ");
	DataTable newsList = get_article_list(channel, category_id, pagesize, page, "status=0", out totalcount, out pagelist, "news_list", category_id, "__id__");

	foreach(DataRow dr in newsList.Rows)
	{

	templateBuilder.Append("\r\n                    <li>\r\n                        <h2><a href=\"");
	templateBuilder.Append(linkurl("news_show",Utils.ObjectToStr(dr["id"])));

	templateBuilder.Append("\">" + Utils.ObjectToStr(dr["title"]) + "</a></h2>\r\n                        <div class=\"note\">\r\n                            ");
	if (Utils.ObjectToStr(dr["img_url"])!="")
	{

	templateBuilder.Append("\r\n                            <b><img src=\"" + Utils.ObjectToStr(dr["img_url"]) + "\" /></b>\r\n                            ");
	}	//end for if

	templateBuilder.Append("\r\n                            <p>" + Utils.ObjectToStr(dr["zhaiyao"]) + "</p>\r\n                            <div class=\"info\">\r\n                                <span><i class=\"iconfont icon-date\"></i>" + Utils.ObjectToStr(dr["add_time"]) + "</span>\r\n                                <span><i class=\"iconfont icon-comment\"></i>\r\n                                <script type=\"text/javascript\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/submit_ajax.ashx?action=view_comment_count&channel_id=" + Utils.ObjectToStr(dr["channel_id"]) + "&id=" + Utils.ObjectToStr(dr["id"]) + "\"></");
	templateBuilder.Append("script>人评论</span>\r\n                                <span><i class=\"iconfont icon-view\"></i>\r\n                                <script type=\"text/javascript\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/submit_ajax.ashx?action=view_article_click&channel_id=" + Utils.ObjectToStr(dr["channel_id"]) + "&id=" + Utils.ObjectToStr(dr["id"]) + "\"></");
	templateBuilder.Append("script>次浏览</span>\r\n                            </div>\r\n                        </div>\r\n                    </li>\r\n                    ");
	}	//end for if

	templateBuilder.Append("\r\n                </ul>\r\n\r\n                <!--页码列表-->\r\n                <div class=\"page-box\">\r\n                    <div class=\"digg\">");
	templateBuilder.Append(Utils.ObjectToStr(pagelist));
	templateBuilder.Append("</div>\r\n                </div>\r\n                <!--/页码列表-->\r\n\r\n            </div>\r\n        </div>\r\n        <!--/页面左边-->\r\n    </div>\r\n    <div>\r\n        <div class=\"input-box\">\r\n            <textarea id=\"txtContent\" name=\"txtContent\" rows=\"3\" placeholder=\"吐槽一下\" class=\"input\" data-validate=\"comment\"></textarea>\r\n        </div>\r\n\r\n        <div class=\"weui-panel weui-panel_access\">\r\n            <div class=\"weui-panel__bd\">\r\n                <div class=\"comment-box\">\r\n                    <div class=\"comment-add\">\r\n                        <form id=\"commentForm\" name=\"commentForm\" class=\"form-box\" url=\"\">\r\n                            <div class=\"input-box\">\r\n                                <textarea id=\"txtContent\" name=\"txtContent\" rows=\"3\" placeholder=\"吐槽一下\" class=\"input\" data-validate=\"comment\"></textarea>\r\n                            </div>\r\n                            <div class=\"input-box\">\r\n                                <input id=\"btnSubmit\" name=\"btnSubmit\" type=\"submit\" value=\"发表\" class=\"weui-btn weui-btn_mini weui-btn_primary\" />\r\n                                <a href=\"javascript:;\" onclick=\"ToggleCode(this, '");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/verify_code.ashx');return false;\">\r\n                                    <img src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/verify_code.ashx\" width=\"80\" height=\"25\" style=\"vertical-align:middle;\" />\r\n                                </a>\r\n                            </div>\r\n                        </form>\r\n                    </div>\r\n\r\n                    <ol id=\"commentList\" class=\"comment-list\">\r\n                        <div class=\"nodata\">暂无评论...</div>\r\n                    </ol>\r\n\r\n                    <div class=\"comment-more\">\r\n                        <input id=\"btnLoadComment\" type=\"button\" value=\"加载更多评论\" class=\"weui-btn weui-btn_default\" onclick=\"InitCommentList();\" />\r\n                    </div>\r\n                </div>\r\n\r\n            </div>\r\n        </div>\r\n    </div>\r\n\r\n    <!--页面底部-->\r\n    ");

	templateBuilder.Append("<div class=\"footer\">\r\n    <div class=\"section\">        \r\n        <div class=\"foot-box\">\r\n            <div class=\"copyright\">\r\n                <p>版权所有 ");
	templateBuilder.Append(Utils.ObjectToStr(site.company));
	templateBuilder.Append(" ");
	templateBuilder.Append(Utils.ObjectToStr(site.crod));
	templateBuilder.Append("</p>\r\n                <p>公司地址：");
	templateBuilder.Append(Utils.ObjectToStr(site.address));
	templateBuilder.Append(" 联系电话：");
	templateBuilder.Append(Utils.ObjectToStr(site.tel));
	templateBuilder.Append("</p>\r\n                <p class=\"gray\">Copyright © 2009-2017 dycxpt.com Corporation,All Rights Reserved.</p>\r\n            </div>\r\n            <div class=\"service\">\r\n                <p>东营创新创业服务平台</p>                \r\n            </div>\r\n        </div>\r\n    </div>\r\n</div>");


	templateBuilder.Append("\r\n    <!--/页面底部-->\r\n</body>\r\n</html>");
	Response.Write(templateBuilder.ToString());
}
</script>
