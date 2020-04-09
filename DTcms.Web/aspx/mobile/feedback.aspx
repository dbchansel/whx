<%@ Page Language="C#" AutoEventWireup="true" Inherits="DTcms.Web.Plugin.Feedback.feedback" ValidateRequest="false" %>
<%@ Import namespace="System.Collections.Generic" %>
<%@ Import namespace="System.Text" %>
<%@ Import namespace="System.Data" %>
<%@ Import namespace="DTcms.Common" %>

<script runat="server">
override protected void OnInit(EventArgs e)
{

	/* 
		This page was created by DTcms Template Engine at 2017/7/9 5:42:58.
		本页面代码由DTcms模板引擎生成于 2017/7/9 5:42:58. 
	*/

	base.OnInit(e);
	StringBuilder templateBuilder = new StringBuilder(220000);

	templateBuilder.Append("<!DOCTYPE html>\r\n<!--HTML5 doctype-->\r\n<html>\r\n<head>\r\n<meta charset=\"utf-8\">\r\n<meta name=\"viewport\" content=\"width=device-width,initial-scale=1,user-scalable=0\">\r\n<title>留言反馈 - ");
	templateBuilder.Append(Utils.ObjectToStr(site.name));
	templateBuilder.Append("</title>\r\n<meta content=\"");
	templateBuilder.Append(Utils.ObjectToStr(site.seo_keyword));
	templateBuilder.Append("\" name=\"keywords\" />\r\n<meta content=\"");
	templateBuilder.Append(Utils.ObjectToStr(site.seo_description));
	templateBuilder.Append("\" name=\"description\" />\r\n<link rel=\"stylesheet\" type=\"text/css\" href=\"");
	templateBuilder.Append("/templates/mobile");
	templateBuilder.Append("/css/validate.css\" />\r\n<link rel=\"stylesheet\" type=\"text/css\" href=\"");
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
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append("/templates/mobile");
	templateBuilder.Append("/js/mvalidate.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append("/templates/mobile");
	templateBuilder.Append("/js/mvalidate-extend.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\">\r\n$(function(){\r\n	//初始化发表留言表单\r\n	AjaxInitForm('#feedbackForm', '#btnSubmit', 1);\r\n});\r\n</");
	templateBuilder.Append("script>\r\n</head>\r\n\r\n<body ontouchstart>\r\n<div class=\"page\">\r\n    <!--页面头部-->\r\n    <div class=\"header\">\r\n        <a class=\"back\" href=\"javascript:history.back();\">\r\n            <i class=\"iconfont icon-arrow-left\"></i>\r\n        </a>\r\n        <h3>留言反馈</h3>\r\n        <div class=\"right\"> \r\n            <a class=\"weui-cell_access weui-cell_link\" href=\"");
	templateBuilder.Append(linkurl("index"));

	templateBuilder.Append("\">\r\n                <i class=\"iconfont icon-home\"></i>\r\n            </a>\r\n        </div>\r\n    </div>\r\n    <!--/页面头部-->\r\n  \r\n    <!--页面内容-->\r\n    <div class=\"page__bd\">\r\n        \r\n        <!--留言列表-->\r\n        <div class=\"weui-panel weui-panel_access\" style=\"margin-top:10px;\">\r\n            <div class=\"weui-panel__hd\">留言列表</div>\r\n            <div class=\"weui-panel__bd\">\r\n                <div class=\"comment-box\">\r\n                    <ol class=\"comment-list\">\r\n                        ");
	DataTable feedbackList = new DTcms.Web.Plugin.Feedback.feedback().get_feedback_list(10, page, "", out totalcount);

	string pagelist = get_page_link(10, page, totalcount, "feedback", "__id__");

	foreach(DataRow dr in feedbackList.Rows)
	{

	templateBuilder.Append("\r\n                        <li>\r\n                            <div class=\"avatar\">\r\n                                <i class=\"iconfont icon-user-full\"></i>\r\n                            </div>\r\n                            <div class=\"inner\">\r\n                                <div class=\"meta\">\r\n                                    <span class=\"blue\">" + Utils.ObjectToStr(dr["user_name"]) + "</span>\r\n                                    <span class=\"time\">" + Utils.ObjectToStr(dr["add_time"]) + "</span>\r\n                                </div>\r\n                                <p>" + Utils.ObjectToStr(dr["content"]) + "</p>\r\n                            </div>\r\n                            \r\n                            ");
	if (Utils.ObjectToStr(dr["reply_content"])!="")
	{

	templateBuilder.Append("\r\n                            <div class=\"answer\">\r\n                                <div class=\"meta\">\r\n                                    <span class=\"time\">" + Utils.ObjectToStr(dr["reply_time"]) + "</span>\r\n                                    <span class=\"blue\">管理员回复：</span>\r\n                                </div>\r\n                                <p>" + Utils.ObjectToStr(dr["reply_content"]) + "</p>\r\n                            </div>\r\n                            ");
	}	//end for if

	templateBuilder.Append("\r\n                        </li>\r\n                        ");
	}	//end for if

	if (totalcount==0)
	{

	templateBuilder.Append("\r\n                        <div class=\"nodata\" style=\"border:none;\">暂无留言...</div>\r\n                        ");
	}	//end for if

	templateBuilder.Append("\r\n                    </ol>\r\n                </div>\r\n                \r\n            </div>\r\n        </div>\r\n        <!--/留言列表-->\r\n        \r\n        <!--分页页码-->\r\n        <div class=\"page-list\">\r\n            ");
	templateBuilder.Append(Utils.ObjectToStr(pagelist));
	templateBuilder.Append("\r\n        </div>\r\n        <!--/分页页码-->\r\n        \r\n        <!--发表留言-->\r\n        <form id=\"feedbackForm\" name=\"feedbackForm\" class=\"form-box\" url=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("plugins/feedback/ajax.ashx?action=add&site=");
	templateBuilder.Append(Utils.ObjectToStr(site.id));
	templateBuilder.Append("\">\r\n        <div class=\"weui-panel weui-panel_access\">\r\n            <div class=\"weui-panel__hd\">发表留言</div>\r\n            <div class=\"weui-panel__bd\">\r\n                <div class=\"weui-cells_form form-box\">\r\n                    \r\n                    <div class=\"weui-cell\">\r\n                        <div class=\"weui-cell__hd\">\r\n                            <label class=\"weui-label\">用户昵称</label>\r\n                        </div>\r\n                        <div class=\"weui-cell__bd\">\r\n                            <input id=\"txtUserName\" name=\"txtUserName\" class=\"weui-input\" type=\"text\" placeholder=\"请输入昵称\" data-validate=\"s\" />\r\n                        </div>\r\n                    </div>\r\n                    \r\n                    <div class=\"weui-cell\">\r\n                        <div class=\"weui-cell__hd\">\r\n                            <label class=\"weui-label\">联系电话</label>\r\n                        </div>\r\n                        <div class=\"weui-cell__bd\">\r\n                            <input id=\"txtUserTel\" name=\"txtUserTel\" class=\"weui-input\" type=\"tel\" placeholder=\"联系电话，非必填\" />\r\n                        </div>\r\n                    </div>\r\n                    \r\n                    <div class=\"weui-cell\">\r\n                        <div class=\"weui-cell__hd\">\r\n                            <label class=\"weui-label\">QQ号码</label>\r\n                        </div>\r\n                        <div class=\"weui-cell__bd\">\r\n                            <input id=\"txtUserQQ\" name=\"txtUserQQ\" class=\"weui-input\" type=\"text\" placeholder=\"QQ号码，非必填\" />\r\n                        </div>\r\n                    </div>\r\n                    \r\n                    <div class=\"weui-cell\">\r\n                        <div class=\"weui-cell__hd\">\r\n                            <label class=\"weui-label\">电子邮箱</label>\r\n                        </div>\r\n                        <div class=\"weui-cell__bd\">\r\n                            <input id=\"txtUserEmail\" name=\"txtUserEmail\" class=\"weui-input\" type=\"text\" placeholder=\"邮箱地址，非必填\" />\r\n                        </div>\r\n                    </div>\r\n                    \r\n                    <div class=\"weui-cell\">\r\n                        <div class=\"weui-cell__hd\">\r\n                            <label class=\"weui-label\">留言标题</label>\r\n                        </div>\r\n                        <div class=\"weui-cell__bd\">\r\n                            <input id=\"txtTitle\" name=\"txtTitle\" class=\"weui-input\" type=\"text\" placeholder=\"请输入留言标题\" data-validate=\"s\" />\r\n                        </div>\r\n                    </div>\r\n                    \r\n                    <div class=\"weui-cell\">\r\n                        <div class=\"weui-cell__bd\">\r\n                            <textarea id=\"txtContent\" name=\"txtContent\" class=\"weui-textarea\" placeholder=\"请输入留言内容\" rows=\"3\" data-validate=\"comment\"></textarea>\r\n                        </div>\r\n                    </div>\r\n                    \r\n                    <div class=\"weui-cell\">\r\n                        <div class=\"weui-cell__hd\">\r\n                            <label class=\"weui-label\">验证码</label>\r\n                        </div>\r\n                        <div class=\"weui-cell__bd\">\r\n                            <input id=\"txtCode\" name=\"txtCode\" class=\"weui-input\" type=\"text\" placeholder=\"请输入验证码\" data-validate=\"code\" />\r\n                        </div>\r\n                        <div class=\"weui-cell__ft\">\r\n                            <a href=\"javascript:;\" onclick=\"ToggleCode(this, '");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/verify_code.ashx');return false;\">\r\n                            <img class=\"weui-vcode-img\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/verify_code.ashx\" style=\"width:82px;height:24px;\" />\r\n                            </a>\r\n                        </div>\r\n                    </div>\r\n                    \r\n                </div>\r\n                \r\n            </div>\r\n        </div>\r\n        <div class=\"weui-btn-area\">\r\n            <input id=\"btnSubmit\" name=\"btnSubmit\" type=\"submit\" class=\"weui-btn weui-btn_primary\" value=\"发表留言\" />\r\n        </div>\r\n        </form>\r\n        <!--/发表留言-->\r\n    \r\n        <!--版权信息-->\r\n        ");

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


	templateBuilder.Append("\r\n        <!--/底部导航-->\r\n    \r\n  </div>\r\n  <!--/页面内容-->\r\n\r\n</div>\r\n</body>\r\n</html>\r\n");
	Response.Write(templateBuilder.ToString());
}
</script>
