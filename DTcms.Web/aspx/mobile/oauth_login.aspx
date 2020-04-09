<%@ Page Language="C#" AutoEventWireup="true" Inherits="DTcms.Web.UI.Page.oauth_login" ValidateRequest="false" %>
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

	templateBuilder.Append("<!DOCTYPE html>\r\n<!--HTML5 doctype-->\r\n<html>\r\n<head>\r\n<meta charset=\"utf-8\">\r\n<meta name=\"viewport\" content=\"width=device-width,initial-scale=1,user-scalable=0\">\r\n<title>第三方账号登录 - ");
	templateBuilder.Append(Utils.ObjectToStr(site.name));
	templateBuilder.Append("</title>\r\n<meta name=\"keywords\" content=\"");
	templateBuilder.Append(Utils.ObjectToStr(site.seo_keyword));
	templateBuilder.Append("\" />\r\n<meta name=\"description\" content=\"");
	templateBuilder.Append(Utils.ObjectToStr(site.seo_description));
	templateBuilder.Append("\" />\r\n<link rel=\"stylesheet\" type=\"text/css\" href=\"");
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
	templateBuilder.Append("/js/mvalidate.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append("/templates/mobile");
	templateBuilder.Append("/js/mvalidate-extend.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\">\r\n    $(function(){\r\n        //初始化TAB选项卡\r\n        weui.tab('#tab',{\r\n            defaultIndex: 0,\r\n            onChange:function(index){\r\n                //console.log(index);\r\n            }\r\n        });\r\n        //初始化表单1\r\n        AjaxInitForm('#bindForm', '#btnSubmit1', 0, '#turl');\r\n        //初始化表单2\r\n        AjaxInitForm('#oauthForm', '#btnSubmit2', 0, '#turl');\r\n    });\r\n</");
	templateBuilder.Append("script>\r\n</head>\r\n\r\n<body ontouchstart>\r\n<div class=\"page\">\r\n    <!--页面头部-->\r\n    <div class=\"header\">\r\n        <a class=\"back\" href=\"");
	templateBuilder.Append(linkurl("register"));

	templateBuilder.Append("\">\r\n            <i class=\"iconfont icon-arrow-left\"></i>\r\n        </a>\r\n        <h3>第三方账号登录</h3>\r\n        <div class=\"right\"> \r\n            <a class=\"weui-cell_access weui-cell_link\" href=\"");
	templateBuilder.Append(linkurl("index"));

	templateBuilder.Append("\">\r\n                <i class=\"iconfont icon-home\"></i>\r\n            </a>\r\n        </div>\r\n    </div>\r\n    <!--/页面头部-->\r\n    \r\n    <div class=\"page__bd\">\r\n        <!--跳转的地址-->\r\n        <input id=\"turl\" name=\"turl\" type=\"hidden\" value=\"");
	templateBuilder.Append(Utils.ObjectToStr(turl));
	templateBuilder.Append("\" />\r\n        \r\n        <!--Tab选项-->\r\n        <div id=\"tab\" class=\"weui-tab\">\r\n            <div class=\"weui-navbar\">\r\n                <div class=\"weui-navbar__item weui-bar__item_on\">绑定已有的账号</div>\r\n                <div class=\"weui-navbar__item\">创建新的账号</div>\r\n            </div>\r\n            \r\n            <div class=\"weui-tab__panel\">\r\n                <!--绑定已有的账号-->\r\n                <div class=\"weui-tab__content\">\r\n                    <form id=\"bindForm\" name=\"bindForm\" class=\"form-box\" url=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/submit_ajax.ashx?action=user_oauth_bind\">\r\n                        <div class=\"weui-panel weui-panel_access\">\r\n                            <div class=\"weui-panel__hd\">绑定已有的账号</div>\r\n                            <div class=\"weui-panel__bd\">\r\n                                <div class=\"weui-cells_form\">\r\n                                    \r\n                                    <div class=\"weui-cell\">\r\n                                        <div class=\"weui-cell__hd\">\r\n                                            <label class=\"weui-label\">用户名</label>\r\n                                        </div>\r\n                                        <div class=\"weui-cell__bd\">\r\n                                            <input id=\"txtUserName\" name=\"txtUserName\" type=\"text\" class=\"weui-input\" placeholder=\"请输入用户名\" data-validate=\"username\" />\r\n                                        </div>\r\n                                    </div>\r\n                                    <div class=\"weui-cell\">\r\n                                        <div class=\"weui-cell__hd\">\r\n                                            <label class=\"weui-label\">密码</label>\r\n                                        </div>\r\n                                        <div class=\"weui-cell__bd\">\r\n                                            <input id=\"txtPassword\" name=\"txtPassword\" type=\"password\" class=\"weui-input\" placeholder=\"请输入密码\" data-validate=\"password\" />\r\n                                        </div>\r\n                                    </div>\r\n                                    \r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                        \r\n                        <div class=\"weui-btn-area\">\r\n                            <input id=\"btnSubmit1\" name=\"btnSubmit1\" type=\"submit\" class=\"weui-btn weui-btn_primary\" value=\"立即绑定\" />\r\n                        </div>\r\n                    </form>\r\n                </div>\r\n                <!--/绑定已有的账号-->\r\n                \r\n                <!--创建新的账号-->\r\n                <div class=\"weui-tab__content\">\r\n                    <form id=\"oauthForm\" name=\"oauthForm\" class=\"form-box\" url=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/submit_ajax.ashx?action=user_oauth_register&site_id=");
	templateBuilder.Append(Utils.ObjectToStr(site.id));
	templateBuilder.Append("\">\r\n                        <div class=\"weui-panel weui-panel_access\">\r\n                            <div class=\"weui-panel__hd\">创建新的账号</div>\r\n                            <div class=\"weui-panel__bd\">\r\n                                <div class=\"weui-cells_form\">\r\n                                    \r\n                                    <div class=\"weui-cell\">\r\n                                        <div class=\"weui-cell__hd\">\r\n                                            <label class=\"weui-label\">电子邮箱</label>\r\n                                        </div>\r\n                                        <div class=\"weui-cell__bd\">\r\n                                            <input id=\"txtEmail\" name=\"txtEmail\" type=\"text\" class=\"weui-input\" placeholder=\"请输入邮箱账号\" />\r\n                                        </div>\r\n                                    </div>\r\n                                    <div class=\"weui-cell\">\r\n                                        <div class=\"weui-cell__hd\">\r\n                                            <label class=\"weui-label\">手机号码</label>\r\n                                        </div>\r\n                                        <div class=\"weui-cell__bd\">\r\n                                            <input id=\"txtMobile\" name=\"txtMobile\" class=\"weui-input\" type=\"tel\" placeholder=\"请输入手机号\" data-validate=\"m\" />\r\n                                        </div>\r\n                                    </div>\r\n                                    <div class=\"weui-cell\">\r\n                                        <div class=\"weui-cell__hd\">\r\n                                            <label class=\"weui-label\">登录密码</label>\r\n                                        </div>\r\n                                        <div class=\"weui-cell__bd\">\r\n                                            <input id=\"txtPassword\" name=\"txtPassword\" type=\"password\" class=\"weui-input\" placeholder=\"请设置密码\" data-validate=\"password\" />\r\n                                        </div>\r\n                                    </div>\r\n                                    \r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                        \r\n                        <div class=\"weui-btn-area\">\r\n                            <input id=\"btnSubmit2\" name=\"btnSubmit2\" type=\"submit\" class=\"weui-btn weui-btn_primary\" value=\"创建新账户\" />\r\n                        </div>\r\n                    </form>\r\n                </div>\r\n                <!--创建新的账号-->\r\n            </div>\r\n        </div>\r\n        <!--/Tab选项-->\r\n        \r\n    </div>\r\n    \r\n    <div class=\"page__ft\">\r\n        <!--版权信息-->\r\n        ");

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


	templateBuilder.Append("\r\n        <!--/底部导航-->\r\n    </div>\r\n    \r\n</div>  \r\n</body>\r\n</html>\r\n");
	Response.Write(templateBuilder.ToString());
}
</script>
