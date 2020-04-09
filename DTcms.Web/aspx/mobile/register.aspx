<%@ Page Language="C#" AutoEventWireup="true" Inherits="DTcms.Web.UI.Page.register" ValidateRequest="false" %>
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

	templateBuilder.Append("<!DOCTYPE html>\r\n<!--HTML5 doctype-->\r\n<html>\r\n<head>\r\n<meta charset=\"utf-8\">\r\n<meta name=\"viewport\" content=\"width=device-width,initial-scale=1,user-scalable=0\">\r\n<title>会员注册 - ");
	templateBuilder.Append(Utils.ObjectToStr(site.name));
	templateBuilder.Append("</title>\r\n<link rel=\"stylesheet\" type=\"text/css\" href=\"");
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
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append("/templates/mobile");
	templateBuilder.Append("/js/register-validate.js\"></");
	templateBuilder.Append("script>\r\n</head>\r\n\r\n<body ontouchstart>\r\n<div class=\"page\">\r\n    <!--页面头部-->\r\n    <div class=\"header\">\r\n        <a class=\"back\" href=\"javascript:history.back();\">\r\n            <i class=\"iconfont icon-arrow-left\"></i>\r\n        </a>\r\n        <h3>会员注册</h3>\r\n        <div class=\"right\"> \r\n            <a class=\"weui-cell_access weui-cell_link\" href=\"");
	templateBuilder.Append(linkurl("index"));

	templateBuilder.Append("\">\r\n                <i class=\"iconfont icon-home\"></i>\r\n            </a>\r\n        </div>\r\n    </div>\r\n    <!--/页面头部-->\r\n\r\n    <!--页面内容-->\r\n    <div class=\"page__bd\">\r\n        \r\n        ");
	if (action=="")
	{

	templateBuilder.Append("\r\n        <!--会员注册-->\r\n        <form id=\"regForm\" name=\"regForm\" class=\"form-box\" url=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/submit_ajax.ashx?action=user_register&site_id=");
	templateBuilder.Append(Utils.ObjectToStr(site.id));
	templateBuilder.Append("\">\r\n            <div class=\"weui-cells weui-cells_form\">\r\n                <div class=\"weui-cell\">\r\n                    <div class=\"weui-cell__hd\">\r\n                        <label class=\"weui-label\">账户名</label>\r\n                    </div>\r\n                    <div class=\"weui-cell__bd\">\r\n                        <input id=\"txtUserName\" name=\"txtUserName\" type=\"text\" class=\"weui-input\" placeholder=\"输入登录用户名\" data-validate=\"username\" />\r\n                    </div>\r\n                </div>\r\n                <div class=\"weui-cell\">\r\n                    <div class=\"weui-cell__hd\">\r\n                        <label class=\"weui-label\">密码</label>\r\n                    </div>\r\n                    <div class=\"weui-cell__bd\">\r\n                        <input id=\"txtPassword\" name=\"txtPassword\" type=\"password\" class=\"weui-input\" placeholder=\"请输入密码\" data-validate=\"password\" />\r\n                    </div>\r\n                </div>\r\n                <div class=\"weui-cell\">\r\n                    <div class=\"weui-cell__hd\">\r\n                        <label class=\"weui-label\">确认密码</label>\r\n                    </div>\r\n                    <div class=\"weui-cell__bd\">\r\n                        <input id=\"txtPassword1\" name=\"txtPassword1\" type=\"password\" class=\"weui-input\" placeholder=\"请再次输入密码\" data-required=\"true\" data-descriptions=\"confirmpassword\" data-conditional=\"confirmpwd\" />\r\n                    </div>\r\n                </div>\r\n                \r\n                ");
	if (uconfig.regstatus==1||uconfig.regstatus==3||uconfig.regstatus==4)
	{

	templateBuilder.Append("\r\n                <!--开放注册及邮箱邀请注册-->\r\n                <div class=\"weui-cell\">\r\n                    <div class=\"weui-cell__hd\">\r\n                        <label class=\"weui-label\">邮箱</label>\r\n                    </div>\r\n                    <div class=\"weui-cell__bd\">\r\n                        <input id=\"txtEmail\" name=\"txtEmail\" type=\"text\" class=\"weui-input\" placeholder=\"输入邮箱账号\" data-validate=\"e\" />\r\n                    </div>\r\n                </div>\r\n                <!--/开放注册及邮箱邀请注册-->\r\n                ");
	}	//end for if

	if (uconfig.regstatus==1||uconfig.regstatus==2)
	{

	templateBuilder.Append("\r\n                <!--开放注册及手机注册-->\r\n                <div class=\"weui-cell vcode\">\r\n                    <div class=\"weui-cell__hd\">\r\n                        <label class=\"weui-label\">手机号</label>\r\n                    </div>\r\n                    <div class=\"weui-cell__bd\">\r\n                        <input id=\"txtMobile\" name=\"txtMobile\" class=\"weui-input\" type=\"tel\" placeholder=\"请输入手机号\" data-validate=\"m\" />\r\n                    </div>\r\n                    ");
	if (uconfig.regstatus==2)
	{

	templateBuilder.Append("\r\n                    <!--开启手机注册-->\r\n                    <div class=\"weui-cell__ft\">\r\n                        <a class=\"weui-vcode-btn\" href=\"javascript:;\" onclick=\"sendSMS(this,'#txtMobile','");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/submit_ajax.ashx?action=user_verify_smscode&site=");
	templateBuilder.Append(Utils.ObjectToStr(site.build_path));
	templateBuilder.Append("');\">获取验证码</a>\r\n                    </div>\r\n                    <!--/开启手机注册-->\r\n                    ");
	}	//end for if

	templateBuilder.Append("\r\n                </div>\r\n                <!--/开放注册及手机注册-->\r\n                ");
	}	//end for if

	if (uconfig.regstatus==2)
	{

	templateBuilder.Append("\r\n                <!--开启手机注册-->\r\n                <div class=\"weui-cell\">\r\n                    <div class=\"weui-cell__hd\">\r\n                        <label class=\"weui-label\">验证码</label>\r\n                    </div>\r\n                    <div class=\"weui-cell__bd\">\r\n                        <input id=\"txtCode\" name=\"txtCode\" class=\"weui-input\" type=\"text\" placeholder=\"请输入手机收到验证码\" data-validate=\"code\" />\r\n                    </div>\r\n                </div>\r\n                <!--/开启手机注册-->\r\n                ");
	}	//end for if

	if (uconfig.regstatus==4)
	{

	templateBuilder.Append("\r\n                <!--开启邀请注册-->\r\n                <div class=\"weui-cell\">\r\n                    <div class=\"weui-cell__hd\">\r\n                        <label class=\"weui-label\">邀请码</label>\r\n                    </div>\r\n                    <div class=\"weui-cell__bd\">\r\n                        <input id=\"txtCode\" name=\"txtCode\" class=\"weui-input\" type=\"text\" placeholder=\"请输入注册邀请码\" data-validate=\"code\" />\r\n                    </div>\r\n                </div>\r\n                <!--/开启邀请注册-->\r\n                ");
	}	//end for if

	if (uconfig.regstatus==1)
	{

	templateBuilder.Append("\r\n                <!--开放注册-->\r\n                <div class=\"weui-cell\">\r\n                    <div class=\"weui-cell__hd\">\r\n                        <label class=\"weui-label\">验证码</label>\r\n                    </div>\r\n                    <div class=\"weui-cell__bd\">\r\n                        <input id=\"txtCode\" name=\"txtCode\" class=\"weui-input\" type=\"text\" placeholder=\"请输入验证码\" data-validate=\"code\" />\r\n                    </div>\r\n                    <div class=\"weui-cell__ft\">\r\n                        <a href=\"javascript:;\" onclick=\"ToggleCode(this, '");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/verify_code.ashx');return false;\">\r\n                        <img class=\"weui-vcode-img\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/verify_code.ashx\" style=\"width:82px;height:24px;\" />\r\n                        </a>\r\n                    </div>\r\n                </div>\r\n                <!--/开放注册-->\r\n                ");
	}	//end for if

	templateBuilder.Append("\r\n                \r\n            </div>\r\n            \r\n            ");
	if (uconfig.regrules==1)
	{

	templateBuilder.Append("\r\n            <!--开启注册协议-->\r\n            <label for=\"chkAgree\" class=\"weui-agree\">\r\n                <input id=\"chkAgree\" name=\"chkAgree\" type=\"checkbox\" class=\"weui-agree__checkbox\" />\r\n                <span class=\"weui-agree__text\">\r\n                    我已阅读并接受<a href=\"javascript:;\" onclick=\"showWindow('#regrules');\">《注册许可协议》</a>\r\n                    <div id=\"regrules\" title=\"注册许可协议\" style=\"display:none;\">");
	templateBuilder.Append(Utils.ObjectToStr(uconfig.regrulestxt));
	templateBuilder.Append("</div>\r\n                </span>\r\n            </label>\r\n            <!--/开启注册协议-->\r\n            ");
	}	//end for if

	templateBuilder.Append("\r\n            \r\n            <div class=\"weui-btn-area\">\r\n                <input id=\"btnSubmit\" name=\"btnSubmit\" type=\"submit\" class=\"weui-btn weui-btn_primary\" value=\"立即注册\" />\r\n            </div>\r\n        </form>\r\n        <!--/会员注册-->\r\n        ");
	}	//end for if

	if (action=="close")
	{

	templateBuilder.Append("\r\n        <!--关闭会员注册-->\r\n        <div class=\"weui-msg msg-box\">\r\n            <div class=\"weui-msg__icon-area\">\r\n                <i class=\"weui-icon-warn weui-icon_msg-primary\"></i>\r\n            </div>\r\n            <div class=\"weui-msg__text-area\">\r\n                <h2 class=\"weui-msg__title\">系统暂停会员注册</h2>\r\n                <p class=\"weui-msg__desc\">\r\n                    系统暂停注册会员，如对您造成不便，我们深感遗憾！\r\n                </p>\r\n            </div>\r\n            <div class=\"weui-msg__opr-area\">\r\n                <p class=\"weui-btn-area\">\r\n                    <a class=\"weui-btn weui-btn_primary\" href=\"");
	templateBuilder.Append(linkurl("index"));

	templateBuilder.Append("\">返回首页</a>\r\n                </p>\r\n            </div>\r\n        </div>\r\n        <!--/关闭会员注册-->\r\n        ");
	}	//end for if

	if (action=="sendmail")
	{

	templateBuilder.Append("\r\n        <!--发送邮箱验证-->\r\n        <div class=\"weui-msg msg-box\">\r\n            <div class=\"weui-msg__icon-area\">\r\n                <i class=\"weui-icon-info weui-icon_msg\"></i>\r\n            </div>\r\n            <div class=\"weui-msg__text-area\">\r\n                <h2 class=\"weui-msg__title\">需验证邮箱激活账户</h2>\r\n                <p class=\"weui-msg__desc\">\r\n                    目前处于未验证状态，系统已经自动为您发送了一封验证邮件，如果您长时间未收到邮件，请点击下方的重新发送邮件按钮。\r\n                </p>\r\n            </div>\r\n            <div class=\"weui-msg__opr-area\">\r\n                <p class=\"weui-btn-area\">\r\n                    <a class=\"weui-btn weui-btn_primary\" href=\"javascript:;\" onclick=\"sendEmail('");
	templateBuilder.Append(Utils.ObjectToStr(username));
	templateBuilder.Append("', '");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/submit_ajax.ashx?action=user_verify_email&site=");
	templateBuilder.Append(Utils.ObjectToStr(site.build_path));
	templateBuilder.Append("');\">重新发送邮件</a>\r\n                    <a class=\"weui-btn weui-btn_default\" href=\"");
	templateBuilder.Append(linkurl("index"));

	templateBuilder.Append("\">返回首页</a>\r\n                </p>\r\n            </div>\r\n        </div>\r\n        <!--/发送邮箱验证-->\r\n        ");
	}	//end for if

	if (action=="checkmail")
	{

	templateBuilder.Append("\r\n        <!--邮箱验证成功-->\r\n        <div class=\"weui-msg msg-box\">\r\n            <div class=\"weui-msg__icon-area\">\r\n                <i class=\"weui-icon-success weui-icon_msg\"></i>\r\n            </div>\r\n            <div class=\"weui-msg__text-area\">\r\n                <h2 class=\"weui-msg__title\">邮箱验证成功</h2>\r\n                <p class=\"weui-msg__desc\">\r\n                    恭喜您");
	templateBuilder.Append(Utils.ObjectToStr(username));
	templateBuilder.Append("，已通过邮件激活会员账户，赶快享受更多的会员服务吧。\r\n                </p>\r\n            </div>\r\n            <div class=\"weui-msg__opr-area\">\r\n                <p class=\"weui-btn-area\">\r\n                    <a class=\"weui-btn weui-btn_primary\" href=\"");
	templateBuilder.Append(linkurl("usercenter","index"));

	templateBuilder.Append("\">会员中心</a>\r\n                    <a class=\"weui-btn weui-btn_default\" href=\"");
	templateBuilder.Append(linkurl("index"));

	templateBuilder.Append("\">返回首页</a>\r\n                </p>\r\n            </div>\r\n        </div>\r\n        <!--/邮箱验证成功-->\r\n        ");
	}	//end for if

	if (action=="checkerror")
	{

	templateBuilder.Append("\r\n        <!--注册验证失败-->\r\n        <div class=\"weui-msg msg-box\">\r\n            <div class=\"weui-msg__icon-area\">\r\n                <i class=\"weui-icon-warn weui-icon_msg\"></i>\r\n            </div>\r\n            <div class=\"weui-msg__text-area\">\r\n                <h2 class=\"weui-msg__title\">注册验证失败</h2>\r\n                <p class=\"weui-msg__desc\">\r\n                    无法验证你的账户，可能是你的用户名不存在或者验证码已经过期！\r\n                </p>\r\n            </div>\r\n            <div class=\"weui-msg__opr-area\">\r\n                <p class=\"weui-btn-area\">\r\n                    <a class=\"weui-btn weui-btn_primary\" href=\"");
	templateBuilder.Append(linkurl("index"));

	templateBuilder.Append("\">返回首页</a>\r\n                </p>\r\n            </div>\r\n        </div>\r\n        <!--/注册验证失败-->\r\n        ");
	}	//end for if

	if (action=="verify")
	{

	templateBuilder.Append("\r\n        <!--人工审核-->\r\n        <div class=\"weui-msg msg-box\">\r\n            <div class=\"weui-msg__icon-area\">\r\n                <i class=\"weui-icon-info weui-icon_msg\"></i>\r\n            </div>\r\n            <div class=\"weui-msg__text-area\">\r\n                <h2 class=\"weui-msg__title\">等待人工审核通过</h2>\r\n                <p class=\"weui-msg__desc\">\r\n                    本站已开启人工审核，请等待人工审核通过。\r\n                </p>\r\n            </div>\r\n            <div class=\"weui-msg__opr-area\">\r\n                <p class=\"weui-btn-area\">\r\n                    <a class=\"weui-btn weui-btn_primary\" href=\"");
	templateBuilder.Append(linkurl("index"));

	templateBuilder.Append("\">返回首页</a>\r\n                </p>\r\n            </div>\r\n        </div>\r\n        <!--/人工审核-->\r\n        ");
	}	//end for if

	templateBuilder.Append("\r\n    \r\n        <!--版权信息-->\r\n        ");

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
