﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="DTcms.Web.UI.Page.article_show" ValidateRequest="false" %>
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

	base.channel = "news";
	base.OnInit(e);
	StringBuilder templateBuilder = new StringBuilder(220000);

	templateBuilder.Append("<!DOCTYPE html>\r\n<!--HTML5 doctype-->\r\n<html>\r\n<head>\r\n<meta charset=\"utf-8\">\r\n<meta name=\"viewport\" content=\"width=device-width,initial-scale=1,user-scalable=0\">\r\n");
	string category_title = get_category_title(model.category_id,"新闻资讯");

	templateBuilder.Append("\r\n<title>");
	templateBuilder.Append(Utils.ObjectToStr(model.title));
	templateBuilder.Append(" - ");
	templateBuilder.Append(Utils.ObjectToStr(category_title));
	templateBuilder.Append(" - ");
	templateBuilder.Append(Utils.ObjectToStr(site.name));
	templateBuilder.Append("</title>\r\n<meta name=\"keywords\" content=\"");
	templateBuilder.Append(Utils.ObjectToStr(model.seo_keywords));
	templateBuilder.Append("\" />\r\n<meta name=\"description\" content=\"");
	templateBuilder.Append(Utils.ObjectToStr(model.seo_description));
	templateBuilder.Append("\" />\r\n<link rel=\"stylesheet\" type=\"text/css\" href=\"");
	templateBuilder.Append("/templates/mobile");
	templateBuilder.Append("/css/style.css\" />\r\n<script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append("/templates/mobile");
	templateBuilder.Append("/js/zepto.min.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append("/templates/mobile");
	templateBuilder.Append("/js/weui.min.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append("/templates/mobile");
	templateBuilder.Append("/js/common.js\"></");
	templateBuilder.Append("script>\r\n</head>\r\n\r\n<body ontouchstart>\r\n<div class=\"page\">\r\n    <!--页面头部-->\r\n    <div class=\"header\">\r\n        <a class=\"back\" href=\"javascript:history.back();\">\r\n            <i class=\"iconfont icon-arrow-left\"></i>\r\n        </a>\r\n        <h3>新闻资讯</h3>\r\n        <div class=\"right\"> \r\n            <a class=\"weui-cell_access weui-cell_link\" href=\"javascript:;\" onclick=\"showDialogBox('#category-box');\">\r\n                <i class=\"iconfont icon-nav\"></i>\r\n            </a>\r\n        </div>\r\n    </div>\r\n    <!--/页面头部-->\r\n  \r\n    <!--页面内容-->\r\n    <div class=\"page__bd\">\r\n        <!--资讯介绍-->\r\n        <div class=\"weui-panel weui-panel_access\" style=\"margin-top:10px;\">\r\n            <div class=\"weui-panel__bd\">\r\n                <div class=\"meta\">\r\n                    <h1 class=\"meta-tit\">");
	templateBuilder.Append(Utils.ObjectToStr(model.title));
	templateBuilder.Append("</h1>\r\n                    <p class=\"meta-info\">\r\n                        <span><i class=\"iconfont icon-date\"></i>");
	templateBuilder.Append(Utils.ObjectToStr(model.add_time));
	templateBuilder.Append("</span>\r\n                        <span><i class=\"iconfont icon-msg\"></i><script type=\"text/javascript\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/submit_ajax.ashx?action=view_comment_count&channel_id=");
	templateBuilder.Append(Utils.ObjectToStr(model.channel_id));
	templateBuilder.Append("&id=");
	templateBuilder.Append(Utils.ObjectToStr(model.id));
	templateBuilder.Append("\"></");
	templateBuilder.Append("script>人评论</span>\r\n                        <span><i class=\"iconfont icon-view\"></i><script type=\"text/javascript\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/submit_ajax.ashx?action=view_article_click&channel_id=");
	templateBuilder.Append(Utils.ObjectToStr(model.channel_id));
	templateBuilder.Append("&id=");
	templateBuilder.Append(Utils.ObjectToStr(model.id));
	templateBuilder.Append("&click=1\"></");
	templateBuilder.Append("script>次浏览</span>\r\n                    </p>\r\n                </div>\r\n                <div class=\"entry\">\r\n                    ");
	templateBuilder.Append(Utils.ObjectToStr(model.content));
	templateBuilder.Append("\r\n                </div>\r\n            </div>\r\n        </div>\r\n        <!--/资讯介绍-->\r\n        \r\n        <!--相关资讯-->\r\n        <div class=\"weui-panel weui-panel_access\">\r\n            <div class=\"weui-panel__hd\">相关资讯</div>\r\n            <div class=\"weui-panel__bd\">\r\n                <div class=\"txt-list\">\r\n                    <ul>\r\n                        ");
	DataTable relNews = get_article_list(channel, model.category_id, 5, "is_red=1 and id<>"+model.id);

	foreach(DataRow dr in relNews.Rows)
	{

	templateBuilder.Append("\r\n                        <li>\r\n                            <a href=\"");
	templateBuilder.Append(linkurl("news_show",Utils.ObjectToStr(dr["id"])));

	templateBuilder.Append("\">\r\n                                <i class=\"date\">");	templateBuilder.Append(Utils.ObjectToDateTime(Utils.ObjectToStr(dr["add_time"])).ToString("MM-dd"));

	templateBuilder.Append("</i>\r\n                                <span class=\"text\">" + Utils.ObjectToStr(dr["title"]) + "</span>\r\n                            </a>\r\n                        </li>\r\n                        ");
	}	//end for if

	if (relNews.Rows.Count<1)
	{

	templateBuilder.Append("\r\n                            <div class=\"nodata\">暂无相关...</div>\r\n                        ");
	}	//end for if

	templateBuilder.Append("\r\n                    </ul>\r\n                </div>\r\n            </div>\r\n        </div>\r\n        <!--/相关资讯-->\r\n        \r\n        <!--网友评论-->\r\n        ");
	if (model.is_msg==1)
	{


	templateBuilder.Append("        <link rel=\"stylesheet\" type=\"text/css\" href=\"");
	templateBuilder.Append("/templates/mobile");
	templateBuilder.Append("/css/validate.css\" />\r\n        <script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append("/templates/mobile");
	templateBuilder.Append("/js/mvalidate.js\"></");
	templateBuilder.Append("script>\r\n        <script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append("/templates/mobile");
	templateBuilder.Append("/js/mvalidate-extend.js\"></");
	templateBuilder.Append("script>\r\n        ");
	int comment_count = get_comment_count(model.channel_id, model.id, "is_lock=0");

	templateBuilder.Append("<!--取得评论总数-->\r\n        <script type=\"text/javascript\">\r\n        //初始化评论列表\r\n		function InitCommentList(){\r\n			CommentAjaxList('#btnLoadComment','#commentList',10,");
	templateBuilder.Append(Utils.ObjectToStr(comment_count));
	templateBuilder.Append(",'");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/submit_ajax.ashx?action=comment_list&channel_id=");
	templateBuilder.Append(Utils.ObjectToStr(model.channel_id));
	templateBuilder.Append("&article_id=");
	templateBuilder.Append(Utils.ObjectToStr(model.id));
	templateBuilder.Append("');\r\n		}\r\n		//页面加载完毕事件\r\n		$(document).ready(function(){\r\n			//初始化评论列表\r\n			InitCommentList(); //加载第一页评论列表\r\n			//初始化发表评论表单\r\n			AjaxInitForm('#commentForm', '#btnSubmit', 1);\r\n        });\r\n		\r\n      </");
	templateBuilder.Append("script>\r\n        <div class=\"weui-panel weui-panel_access\">\r\n            <div class=\"weui-panel__hd\">网友评论</div>\r\n            <div class=\"weui-panel__bd\">\r\n            \r\n                <div class=\"comment-box\">\r\n                    \r\n                    <div class=\"comment-add\">\r\n                        <form id=\"commentForm\" name=\"commentForm\" class=\"form-box\" url=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/submit_ajax.ashx?action=comment_add&channel_id=");
	templateBuilder.Append(Utils.ObjectToStr(model.channel_id));
	templateBuilder.Append("&article_id=");
	templateBuilder.Append(Utils.ObjectToStr(model.id));
	templateBuilder.Append("\">\r\n                            <div class=\"input-box\">\r\n                                <textarea id=\"txtContent\" name=\"txtContent\" rows=\"3\" placeholder=\"吐槽一下\" class=\"input\" data-validate=\"comment\"></textarea>\r\n                            </div>\r\n                            <div class=\"input-box\">\r\n                                <input id=\"btnSubmit\" name=\"btnSubmit\" type=\"submit\" value=\"发表\" class=\"weui-btn weui-btn_mini weui-btn_primary\" />\r\n                                <input id=\"txtCode\" name=\"txtCode\" type=\"text\" placeholder=\"验证码\" class=\"input code\" data-validate=\"code\" />\r\n                                <a href=\"javascript:;\" onclick=\"ToggleCode(this, '");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/verify_code.ashx');return false;\">\r\n                                    <img src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/verify_code.ashx\" width=\"80\" height=\"25\" style=\"vertical-align:middle;\" />\r\n                                </a>\r\n                            </div>\r\n                        </form>\r\n                    </div>\r\n                    \r\n                    <ol id=\"commentList\" class=\"comment-list\">\r\n                        <div class=\"nodata\">暂无评论...</div>\r\n                    </ol>\r\n                    \r\n                    <div class=\"comment-more\">\r\n                        <input id=\"btnLoadComment\" type=\"button\" value=\"加载更多评论\" class=\"weui-btn weui-btn_default\" onclick=\"InitCommentList();\" />\r\n                    </div>\r\n                </div>\r\n                \r\n            </div>\r\n        </div>");


	}	//end for if

	templateBuilder.Append("\r\n        <!--/网友评论-->\r\n    \r\n        <!--版权信息-->\r\n        ");

	templateBuilder.Append("        <div class=\"weui-footer footer\">\r\n            <p class=\"weui-footer__links\">\r\n                <a href=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.weburl));
	templateBuilder.Append("?m2w\" class=\"weui-footer__link\">触屏版</a>\r\n                <a href=\"");
	templateBuilder.Append(linkurl("index"));

	templateBuilder.Append("\" class=\"weui-footer__link\">电脑版</a>\r\n            </p>\r\n            <p class=\"weui-footer__text\">");
	templateBuilder.Append(Utils.ObjectToStr(site.copyright));
	templateBuilder.Append("</p>\r\n        </div>");


	templateBuilder.Append("\r\n        <!--/版权信息-->\r\n\r\n        <!--底部导航-->\r\n        ");

	templateBuilder.Append("        <div class=\"weui-tab foot-nav\">\r\n            <div class=\"weui-tab__panel\">\r\n\r\n            </div>\r\n            <div class=\"weui-tabbar\">\r\n                <a href=\"");
	templateBuilder.Append(linkurl("index"));

	templateBuilder.Append("\" class=\"weui-tabbar__item\">\r\n                    <i class=\"iconfont icon-home weui-tabbar__icon\"></i>\r\n                    <p class=\"weui-tabbar__label\">首页</p>\r\n                </a>\r\n                <a href=\"");
	templateBuilder.Append(linkurl("cart"));

	templateBuilder.Append("\" class=\"weui-tabbar__item\">\r\n                    <span class=\"item-box\">\r\n                        <i class=\"iconfont icon-cart weui-tabbar__icon\"></i>\r\n                        <span class=\"weui-badge\"><span id=\"shoppingCartCount\"><script type=\"text/javascript\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/submit_ajax.ashx?action=view_cart_count\"></");
	templateBuilder.Append("script></span></span>\r\n                    </span>\r\n                    <p class=\"weui-tabbar__label\">购物车</p>\r\n                </a>\r\n                <a href=\"");
	templateBuilder.Append(linkurl("search"));

	templateBuilder.Append("\" class=\"weui-tabbar__item\">\r\n                    <i class=\"iconfont icon-search weui-tabbar__icon\"></i>\r\n                    <p class=\"weui-tabbar__label\">搜索</p>\r\n                </a>\r\n                <a href=\"");
	templateBuilder.Append(linkurl("usercenter","index"));

	templateBuilder.Append("\" class=\"weui-tabbar__item\">\r\n                    <i class=\"iconfont icon-user weui-tabbar__icon\"></i>\r\n                    <p class=\"weui-tabbar__label\">会员</p>\r\n                </a>\r\n            </div>\r\n        </div>");


	templateBuilder.Append("\r\n        <!--/底部导航-->\r\n    </div>\r\n    <!--/页面内容-->\r\n</div>\r\n\r\n<!--类别容器-->\r\n<div id=\"category-box\" class=\"dialog-wrap\">\r\n    <div class=\"dialog-box\">\r\n        <div class=\"header\">\r\n            <a class=\"back\" href=\"javascript:;\" onclick=\"closeDialogBox('#category-box');\">\r\n                <i class=\"iconfont icon-arrow-left\"></i>\r\n            </a>\r\n            <h3>栏目类别</h3>\r\n        </div>\r\n        <ul class=\"navbar\">\r\n            ");
	DataTable categoryList1 = get_category_child_list(channel, 0);

	foreach(DataRow cdr1 in categoryList1.Rows)
	{

	templateBuilder.Append("\r\n            <li>\r\n                <h3><a href=\"");
	templateBuilder.Append(linkurl("news_list",Utils.ObjectToStr(cdr1["id"])));

	templateBuilder.Append("\">" + Utils.ObjectToStr(cdr1["title"]) + "</a></h3> \r\n                <p>\r\n                ");
	DataTable categoryList2 = get_category_child_list(channel, Utils.StrToInt(Utils.ObjectToStr(cdr1["id"]), 0));

	foreach(DataRow cdr2 in categoryList2.Rows)
	{

	if (Utils.StrToInt(Utils.ObjectToStr(cdr2["id"]), 0)==model.category_id)
	{

	templateBuilder.Append("\r\n                    <a href=\"");
	templateBuilder.Append(linkurl("news_list",Utils.ObjectToStr(cdr2["id"])));

	templateBuilder.Append("\" class=\"selected\">" + Utils.ObjectToStr(cdr2["title"]) + "</a>\r\n                    ");
	}
	else
	{

	templateBuilder.Append("\r\n                    <a href=\"");
	templateBuilder.Append(linkurl("news_list",Utils.ObjectToStr(cdr2["id"])));

	templateBuilder.Append("\">" + Utils.ObjectToStr(cdr2["title"]) + "</a>\r\n                    ");
	}	//end for if

	}	//end for if

	templateBuilder.Append("\r\n                </p>\r\n            </li>\r\n            ");
	}	//end for if

	templateBuilder.Append("\r\n        </ul>\r\n    </div>\r\n</div>\r\n<!--类别容器-->\r\n\r\n</body>\r\n</html>\r\n");
	Response.Write(templateBuilder.ToString());
}
</script>
