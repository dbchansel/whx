<%@ Page Language="C#" AutoEventWireup="true" Inherits="DTcms.Web.UI.Page.usercenter" ValidateRequest="false" %>
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

	templateBuilder.Append("<!DOCTYPE html>\r\n<!--HTML5 doctype-->\r\n<html>\r\n<head>\r\n<meta charset=\"utf-8\">\r\n<meta name=\"viewport\" content=\"width=device-width,initial-scale=1,user-scalable=0\">\r\n<title>会员中心 - ");
	templateBuilder.Append(Utils.ObjectToStr(site.name));
	templateBuilder.Append("</title>\r\n<meta name=\"keywords\" content=\"");
	templateBuilder.Append(Utils.ObjectToStr(site.seo_keyword));
	templateBuilder.Append("\" />\r\n<meta name=\"description\" content=\"");
	templateBuilder.Append(Utils.ObjectToStr(site.seo_description));
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
	templateBuilder.Append("script>\r\n</head>\r\n\r\n<body ontouchstart>\r\n<div class=\"page\">\r\n    \r\n    ");
	if (action=="index")
	{

	templateBuilder.Append("\r\n    <script type=\"text/javascript\">\r\n        $(function(){\r\n            //选中TAB样式\r\n            $(\".weui-tabbar a\").eq(3).addClass(\"weui-bar__item_on\");\r\n        });\r\n    </");
	templateBuilder.Append("script>\r\n    <!--会员中心-->\r\n    <div class=\"page__bd\">\r\n        <!--页面头部-->\r\n        <div class=\"head-box\">\r\n            <div class=\"img-box\">\r\n                ");
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

	templateBuilder.Append("\r\n            </div>\r\n            <div class=\"tit-box\">\r\n                <h3>");
	templateBuilder.Append(Utils.ObjectToStr(userModel.user_name));
	templateBuilder.Append("</h3>\r\n                <p>会员等级：");
	templateBuilder.Append(Utils.ObjectToStr(groupModel.title));
	templateBuilder.Append("</p>\r\n                <p>个人成长值：");
	templateBuilder.Append(Utils.ObjectToStr(userModel.exp));
	templateBuilder.Append("点</p>\r\n            </div>\r\n        </div>\r\n        <!--/页面头部-->\r\n        <!--菜单选项-->\r\n        <div class=\"weui-cells icon-list\">\r\n            <a class=\"weui-cell weui-cell_access\" href=\"");
	templateBuilder.Append(linkurl("userorder","list"));

	templateBuilder.Append("\">\r\n                <div class=\"weui-cell__hd\">\r\n                    <i class=\"iconfont icon-order\"></i>\r\n                </div>\r\n                <div class=\"weui-cell__bd\">\r\n                    <p>我的订单</p>\r\n                </div>\r\n                <div class=\"weui-cell__ft\">");
	templateBuilder.Append(get_user_order_count("status<3 and user_id="+userModel.id).ToString());

	templateBuilder.Append(" 笔</div>\r\n            </a>\r\n            <a class=\"weui-cell weui-cell_access\" href=\"");
	templateBuilder.Append(linkurl("useraddress"));

	templateBuilder.Append("\">\r\n                <div class=\"weui-cell__hd\">\r\n                    <i class=\"iconfont icon-address\"></i>\r\n                </div>\r\n                <div class=\"weui-cell__bd\">\r\n                    <p>收货地址</p>\r\n                </div>\r\n                <div class=\"weui-cell__ft\"></div>\r\n            </a>\r\n        </div>\r\n        \r\n        <div class=\"weui-cells icon-list\">\r\n            <a class=\"weui-cell weui-cell_access\" href=\"");
	templateBuilder.Append(linkurl("useramount","recharge"));

	templateBuilder.Append("\">\r\n                <div class=\"weui-cell__hd\">\r\n                    <i class=\"iconfont icon-amount\"></i>\r\n                </div>\r\n                <div class=\"weui-cell__bd\">\r\n                    <p>账户余额</p>\r\n                </div>\r\n                <div class=\"weui-cell__ft\">￥");
	templateBuilder.Append(Utils.ObjectToStr(userModel.amount));
	templateBuilder.Append(" 元</div>\r\n            </a>\r\n            <a class=\"weui-cell weui-cell_access\" href=\"");
	templateBuilder.Append(linkurl("userpoint","convert"));

	templateBuilder.Append("\">\r\n                <div class=\"weui-cell__hd\">\r\n                    <i class=\"iconfont icon-point\"></i>\r\n                </div>\r\n                <div class=\"weui-cell__bd\">\r\n                    <p>我的积分</p>\r\n                </div>\r\n                <div class=\"weui-cell__ft\">");
	templateBuilder.Append(Utils.ObjectToStr(userModel.point));
	templateBuilder.Append(" 分</div>\r\n            </a>\r\n            <a class=\"weui-cell weui-cell_access\" href=\"");
	templateBuilder.Append(linkurl("usermessage","accept"));

	templateBuilder.Append("\">\r\n                <div class=\"weui-cell__hd\">\r\n                    <i class=\"iconfont icon-msg\"></i>\r\n                </div>\r\n                <div class=\"weui-cell__bd\">\r\n                    <p>站内短信</p>\r\n                </div>\r\n                <div class=\"weui-cell__ft\">");
	templateBuilder.Append(get_user_message_count("accept_user_name='"+userModel.user_name+"' and is_read=0").ToString());

	templateBuilder.Append(" 条</div>\r\n            </a>\r\n        </div>\r\n        \r\n        <div class=\"weui-cells icon-list\">\r\n            <a class=\"weui-cell weui-cell_access\" href=\"");
	templateBuilder.Append(linkurl("usercenter","proinfo"));

	templateBuilder.Append("\">\r\n                <div class=\"weui-cell__hd\">\r\n                    <i class=\"iconfont icon-info\"></i>\r\n                </div>\r\n                <div class=\"weui-cell__bd\">\r\n                    <p>个人资料</p>\r\n                </div>\r\n                <div class=\"weui-cell__ft\"></div>\r\n            </a>\r\n            <a class=\"weui-cell weui-cell_access\" href=\"");
	templateBuilder.Append(linkurl("usercenter","password"));

	templateBuilder.Append("\">\r\n                <div class=\"weui-cell__hd\">\r\n                    <i class=\"iconfont icon-pwd\"></i>\r\n                </div>\r\n                <div class=\"weui-cell__bd\">\r\n                    <p>修改密码</p>\r\n                </div>\r\n                <div class=\"weui-cell__ft\"></div>\r\n            </a>\r\n            <a class=\"weui-cell weui-cell_access\" href=\"");
	templateBuilder.Append(linkurl("usercenter","exit"));

	templateBuilder.Append("\">\r\n                <div class=\"weui-cell__hd\">\r\n                    <i class=\"iconfont icon-exit\"></i>\r\n                </div>\r\n                <div class=\"weui-cell__bd\">\r\n                    <p>退出登录</p>\r\n                </div>\r\n                <div class=\"weui-cell__ft\"></div>\r\n            </a>\r\n        </div>\r\n        <!--/菜单选项-->\r\n    </div>\r\n    <!--版权信息-->\r\n    ");

	templateBuilder.Append("        <div class=\"weui-footer footer\">\r\n            <p class=\"weui-footer__links\">\r\n                <a href=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.weburl));
	templateBuilder.Append("?m2w\" class=\"weui-footer__link\">触屏版</a>\r\n                <a href=\"");
	templateBuilder.Append(linkurl("index"));

	templateBuilder.Append("\" class=\"weui-footer__link\">电脑版</a>\r\n            </p>\r\n            <p class=\"weui-footer__text\">");
	templateBuilder.Append(Utils.ObjectToStr(site.copyright));
	templateBuilder.Append("</p>\r\n        </div>");


	templateBuilder.Append("\r\n    <!--/版权信息-->\r\n\r\n    <!--底部导航-->\r\n    ");

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


	templateBuilder.Append("\r\n    <!--/底部导航-->\r\n    <!--会员中心-->\r\n    \r\n    ");
	}
	else if (action=="password")
	{

	templateBuilder.Append("\r\n    <!--修改密码-->\r\n    <link rel=\"stylesheet\" type=\"text/css\" href=\"");
	templateBuilder.Append("/templates/mobile");
	templateBuilder.Append("/css/validate.css\" />\r\n    <script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append("/templates/mobile");
	templateBuilder.Append("/js/mvalidate.js\"></");
	templateBuilder.Append("script>\r\n    <script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append("/templates/mobile");
	templateBuilder.Append("/js/mvalidate-extend.js\"></");
	templateBuilder.Append("script>\r\n    <script type=\"text/javascript\">\r\n        $(function(){\r\n            //初始化表单\r\n            AjaxInitForm('#pwdForm', '#btnSubmit', 1);\r\n            //选中TAB样式\r\n            $(\".weui-tabbar a\").eq(2).addClass(\"weui-bar__item_on\");\r\n        });\r\n    </");
	templateBuilder.Append("script>\r\n    <div class=\"page__bd\">\r\n        <!--页面头部-->\r\n        <div class=\"header\">\r\n            <a class=\"back\" href=\"javascript:history.back();\">\r\n                <i class=\"iconfont icon-arrow-left\"></i>\r\n            </a>\r\n            <h3>修改密码</h3>\r\n            <div class=\"right\"> \r\n                <a class=\"weui-cell_access weui-cell_link\" href=\"");
	templateBuilder.Append(linkurl("usercenter","index"));

	templateBuilder.Append("\">\r\n                    <i class=\"iconfont icon-user\"></i>\r\n                </a>\r\n            </div>\r\n        </div>\r\n        <!--/页面头部-->\r\n        \r\n        <form name=\"pwdForm\" id=\"pwdForm\" class=\"form-box\" url=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/submit_ajax.ashx?action=user_password_edit\">\r\n        <div class=\"weui-panel weui-panel_access\" style=\"margin-top:10px;\">\r\n            <div class=\"weui-panel__hd\">修改密码</div>\r\n            <div class=\"weui-panel__bd\">\r\n                <div class=\"weui-cells_form form-box\">\r\n                    <div class=\"weui-cell\">\r\n                        <div class=\"weui-cell__hd\">\r\n                            <label class=\"weui-label\">旧密码</label>\r\n                        </div>\r\n                        <div class=\"weui-cell__bd\">\r\n                            <input id=\"txtOldPassword\" name=\"txtOldPassword\" type=\"password\" class=\"weui-input\" placeholder=\"请输入旧密码\" data-validate=\"password\" />\r\n                        </div>\r\n                    </div>\r\n                    \r\n                    <div class=\"weui-cell\">\r\n                        <div class=\"weui-cell__hd\">\r\n                            <label class=\"weui-label\">新密码</label>\r\n                        </div>\r\n                        <div class=\"weui-cell__bd\">\r\n                            <input id=\"txtPassword\" name=\"txtPassword\" type=\"password\" class=\"weui-input\" placeholder=\"请输入新密码\" data-validate=\"password\" />\r\n                        </div>\r\n                    </div>\r\n                    \r\n                    <div class=\"weui-cell\">\r\n                        <div class=\"weui-cell__hd\">\r\n                            <label class=\"weui-label\">确认密码</label>\r\n                        </div>\r\n                        <div class=\"weui-cell__bd\">\r\n                            <input id=\"txtPassword1\" name=\"txtPassword1\" type=\"password\" class=\"weui-input\" placeholder=\"请再输入一次新密码\" data-required=\"true\" data-descriptions=\"confirmpassword\" data-conditional=\"confirmpwd\" />\r\n                        </div>\r\n                    </div>\r\n                    \r\n                </div>\r\n            </div>\r\n        </div>\r\n        <div class=\"weui-btn-area\">\r\n            <input id=\"btnSubmit\" name=\"btnSubmit\" type=\"submit\" class=\"weui-btn weui-btn_primary\" value=\"确认修改\" />\r\n        </div>\r\n        </form>\r\n    </div>\r\n    <!--版权信息-->\r\n    ");

	templateBuilder.Append("        <div class=\"weui-footer footer\">\r\n            <p class=\"weui-footer__links\">\r\n                <a href=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.weburl));
	templateBuilder.Append("?m2w\" class=\"weui-footer__link\">触屏版</a>\r\n                <a href=\"");
	templateBuilder.Append(linkurl("index"));

	templateBuilder.Append("\" class=\"weui-footer__link\">电脑版</a>\r\n            </p>\r\n            <p class=\"weui-footer__text\">");
	templateBuilder.Append(Utils.ObjectToStr(site.copyright));
	templateBuilder.Append("</p>\r\n        </div>");


	templateBuilder.Append("\r\n    <!--/版权信息-->\r\n\r\n    <!--底部导航-->\r\n    <div class=\"weui-tab foot-nav\">\r\n        <div class=\"weui-tab__panel\">\r\n\r\n        </div>\r\n        <div class=\"weui-tabbar\">\r\n            <a href=\"");
	templateBuilder.Append(linkurl("index"));

	templateBuilder.Append("\" class=\"weui-tabbar__item\">\r\n                <i class=\"iconfont icon-home weui-tabbar__icon\"></i>\r\n                <p class=\"weui-tabbar__label\">首页</p>\r\n            </a>\r\n            <a href=\"");
	templateBuilder.Append(linkurl("usercenter","proinfo"));

	templateBuilder.Append("\" class=\"weui-tabbar__item\">\r\n                <i class=\"iconfont icon-info weui-tabbar__icon\"></i>\r\n                <p class=\"weui-tabbar__label\">个人资料</p>\r\n            </a>\r\n            <a href=\"");
	templateBuilder.Append(linkurl("usercenter","password"));

	templateBuilder.Append("\" class=\"weui-tabbar__item\">\r\n                <i class=\"iconfont icon-pwd weui-tabbar__icon\"></i>\r\n                <p class=\"weui-tabbar__label\">修改密码</p>\r\n            </a>\r\n            <a href=\"");
	templateBuilder.Append(linkurl("usercenter","invite"));

	templateBuilder.Append("\" class=\"weui-tabbar__item\">\r\n                <i class=\"iconfont icon-invite weui-tabbar__icon\"></i>\r\n                <p class=\"weui-tabbar__label\">邀请注册</p>\r\n            </a>\r\n        </div>\r\n    </div>\r\n    <!--/底部导航-->\r\n    <!--/修改密码-->\r\n        \r\n    ");
	}
	else if (action=="proinfo")
	{

	templateBuilder.Append("\r\n    <!--修改资料-->\r\n    <link rel=\"stylesheet\" type=\"text/css\" href=\"");
	templateBuilder.Append("/templates/mobile");
	templateBuilder.Append("/css/validate.css\" />\r\n    <script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append("/templates/mobile");
	templateBuilder.Append("/js/mvalidate.js\"></");
	templateBuilder.Append("script>\r\n    <script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append("/templates/mobile");
	templateBuilder.Append("/js/mvalidate-extend.js\"></");
	templateBuilder.Append("script>\r\n    <script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("scripts/jquery/PCASClass.js\"></");
	templateBuilder.Append("script>\r\n    <script type=\"text/javascript\">\r\n        $(function(){\r\n            //初始化表单\r\n            AjaxInitForm('#infoForm', '#btnSubmit', 1);\r\n            //初始化地区\r\n            var mypcas = new PCAS(\"txtProvince,所属省份\", \"txtCity,所属城市\", \"txtArea,所属地区\");\r\n            var areaArr = (\"");
	templateBuilder.Append(Utils.ObjectToStr(userModel.area));
	templateBuilder.Append("\").split(\",\");\r\n            if (areaArr.length == 3) {\r\n              mypcas.SetValue(areaArr[0], areaArr[1], areaArr[2]);\r\n            }\r\n            //初始化日期\r\n            $(\"#txtBirthday\").on('focus', function(){\r\n                weui.datePicker({\r\n                    start: 1920,\r\n                    end: 2080,\r\n                    defaultValue: [1980,1,1],\r\n                    onChange: function(result){\r\n                    },\r\n                    onConfirm: function(result){\r\n                        $(\"#txtBirthday\").val(result);\r\n                    },\r\n                    id: 'datePicker'\r\n                });\r\n            });\r\n            //选中TAB样式\r\n            $(\".weui-tabbar a\").eq(1).addClass(\"weui-bar__item_on\");\r\n        });\r\n    </");
	templateBuilder.Append("script>\r\n    <div class=\"page__bd\">\r\n        <!--页面头部-->\r\n        <div class=\"header\">\r\n            <a class=\"back\" href=\"javascript:history.back();\">\r\n                <i class=\"iconfont icon-arrow-left\"></i>\r\n            </a>\r\n            <h3>账户资料</h3>\r\n            <div class=\"right\"> \r\n                <a class=\"weui-cell_access weui-cell_link\" href=\"");
	templateBuilder.Append(linkurl("usercenter","index"));

	templateBuilder.Append("\">\r\n                    <i class=\"iconfont icon-user\"></i>\r\n                </a>\r\n            </div>\r\n        </div>\r\n        <!--/页面头部-->\r\n        \r\n        <form name=\"infoForm\" id=\"infoForm\" class=\"form-box\" url=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/submit_ajax.ashx?action=user_info_edit\">\r\n        <div class=\"weui-panel weui-panel_access\" style=\"margin-top:10px;\">\r\n            <div class=\"weui-panel__hd\">个人资料</div>\r\n            <div class=\"weui-panel__bd\">\r\n                <div class=\"weui-cells_form form-box\">\r\n                    <div class=\"weui-cell\">\r\n                        <div class=\"weui-cell__hd\">\r\n                            <label class=\"weui-label\">用户昵称</label>\r\n                        </div>\r\n                        <div class=\"weui-cell__bd\">\r\n                            <input id=\"txtNickName\" name=\"txtNickName\" class=\"weui-input\" type=\"text\" value=\"");
	templateBuilder.Append(Utils.ObjectToStr(userModel.nick_name));
	templateBuilder.Append("\" placeholder=\"用户昵称\" data-validate=\"s\" />\r\n                        </div>\r\n                    </div>\r\n                    \r\n                    <div class=\"weui-cell\">\r\n                        <div class=\"weui-cell__hd\">\r\n                            <label class=\"weui-label\">性别</label>\r\n                        </div>\r\n                        <div class=\"weui-cell__bd\">\r\n                            ");
	if (userModel.sex=="男")
	{

	templateBuilder.Append("\r\n                            <label style=\"margin-right:10px;\"><input name=\"rblSex\" type=\"radio\" value=\"男\" checked=\"checked\" />男</label>\r\n                            <label style=\"margin-right:10px;\"><input name=\"rblSex\" type=\"radio\" value=\"女\" />女</label>\r\n                            <label><input id=\"sex-3\" name=\"rblSex\" type=\"radio\" value=\"保密\" />保密</label>\r\n                            ");
	}
	else if (userModel.sex=="女")
	{

	templateBuilder.Append("\r\n                            <label style=\"margin-right:10px;\"><input name=\"rblSex\" type=\"radio\" value=\"男\" />男</label>\r\n                            <label style=\"margin-right:10px;\"><input name=\"rblSex\" type=\"radio\" value=\"女\" checked=\"checked\" />女</label>\r\n                            <label><input id=\"sex-3\" name=\"rblSex\" type=\"radio\" value=\"保密\" />保密</label>\r\n                            ");
	}
	else
	{

	templateBuilder.Append("\r\n                            <label style=\"margin-right:10px;\"><input name=\"rblSex\" type=\"radio\" value=\"男\" />男</label>\r\n                            <label style=\"margin-right:10px;\"><input name=\"rblSex\" type=\"radio\" value=\"女\" />女</label>\r\n                            <label><input id=\"sex-3\" name=\"rblSex\" type=\"radio\" value=\"保密\" checked=\"checked\" />保密</label>\r\n                            ");
	}	//end for if

	templateBuilder.Append("\r\n                        </div>\r\n                    </div>\r\n                    \r\n                    <div class=\"weui-cell\">\r\n                        <div class=\"weui-cell__hd\">\r\n                            <label class=\"weui-label\">生日</label>\r\n                        </div>\r\n                        <div class=\"weui-cell__bd\">\r\n                            ");
	if (userModel.birthday==null)
	{

	templateBuilder.Append("\r\n                                <input name=\"txtBirthday\" id=\"txtBirthday\" type=\"text\" class=\"weui-input\" placeholder=\"请选择日期\" />\r\n                            ");
	}
	else
	{

	templateBuilder.Append("\r\n                                <input name=\"txtBirthday\" id=\"txtBirthday\" type=\"text\" class=\"weui-input\" value=\"");	templateBuilder.Append(Utils.ObjectToDateTime(userModel.birthday).ToString("yyyy-M-d"));

	templateBuilder.Append("\" placeholder=\"请选择日期\" />\r\n                            ");
	}	//end for if

	templateBuilder.Append("\r\n                        </div>\r\n                    </div>\r\n                    \r\n                    <div class=\"weui-cell\">\r\n                        <div class=\"weui-cell__hd\">\r\n                            <label class=\"weui-label\">邮箱</label>\r\n                        </div>\r\n                        <div class=\"weui-cell__bd\">\r\n                            <input id=\"txtEmail\" name=\"txtEmail\" type=\"text\" value=\"");
	templateBuilder.Append(Utils.ObjectToStr(userModel.email));
	templateBuilder.Append("\" class=\"weui-input\" placeholder=\"电子邮箱地址\" data-validate=\"e\" />\r\n                        </div>\r\n                    </div>\r\n                    \r\n                    <div class=\"weui-cell\">\r\n                        <div class=\"weui-cell__hd\">\r\n                            <label class=\"weui-label\">手机号</label>\r\n                        </div>\r\n                        <div class=\"weui-cell__bd\">\r\n                            <input id=\"txtMobile\" name=\"txtMobile\" type=\"tel\" value=\"");
	templateBuilder.Append(Utils.ObjectToStr(userModel.mobile));
	templateBuilder.Append("\" class=\"weui-input\" placeholder=\"请输入手机号\" data-validate=\"m\" />\r\n                        </div>\r\n                    </div>\r\n                    \r\n                    <div class=\"weui-cell\">\r\n                        <div class=\"weui-cell__hd\">\r\n                            <label class=\"weui-label\">电话</label>\r\n                        </div>\r\n                        <div class=\"weui-cell__bd\">\r\n                            <input id=\"txtTelphone\" name=\"txtTelphone\" type=\"text\" value=\"");
	templateBuilder.Append(Utils.ObjectToStr(userModel.telphone));
	templateBuilder.Append("\" class=\"weui-input\" placeholder=\"固定电话号码\" />\r\n                        </div>\r\n                    </div>\r\n                    \r\n                    <div class=\"weui-cell\">\r\n                        <div class=\"weui-cell__hd\">\r\n                            <label class=\"weui-label\">所属地区</label>\r\n                        </div>\r\n                        <div class=\"weui-cell__bd\">\r\n                            <select id=\"txtProvince\" name=\"txtProvince\" class=\"select\"></select>\r\n                            <select id=\"txtCity\" name=\"txtCity\" class=\"select\"></select>\r\n                            <select id=\"txtArea\" name=\"txtArea\" class=\"select\"></select>\r\n                        </div>\r\n                    </div>\r\n                    \r\n                    <div class=\"weui-cell\">\r\n                        <div class=\"weui-cell__hd\">\r\n                            <label class=\"weui-label\">详细地址</label>\r\n                        </div>\r\n                        <div class=\"weui-cell__bd\">\r\n                            <input id=\"txtAddress\" name=\"txtAddress\" class=\"weui-input\" type=\"text\" placeholder=\"详细地址\" value=\"");
	templateBuilder.Append(Utils.ObjectToStr(userModel.address));
	templateBuilder.Append("\" />\r\n                        </div>\r\n                    </div>\r\n                    \r\n                    <div class=\"weui-cell\">\r\n                        <div class=\"weui-cell__hd\">\r\n                            <label class=\"weui-label\">QQ号码</label>\r\n                        </div>\r\n                        <div class=\"weui-cell__bd\">\r\n                            <input id=\"txtQQ\" name=\"txtQQ\" class=\"weui-input\" type=\"text\" placeholder=\"腾讯QQ号码\" value=\"");
	templateBuilder.Append(Utils.ObjectToStr(userModel.qq));
	templateBuilder.Append("\" />\r\n                        </div>\r\n                    </div>\r\n                    \r\n                </div>\r\n            </div>\r\n        </div>\r\n        <div class=\"weui-btn-area\">\r\n            <input id=\"btnSubmit\" name=\"btnSubmit\" type=\"submit\" class=\"weui-btn weui-btn_primary\" value=\"确认修改\" />\r\n        </div>\r\n        </form>\r\n    </div>\r\n    <!--版权信息-->\r\n    ");

	templateBuilder.Append("        <div class=\"weui-footer footer\">\r\n            <p class=\"weui-footer__links\">\r\n                <a href=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.weburl));
	templateBuilder.Append("?m2w\" class=\"weui-footer__link\">触屏版</a>\r\n                <a href=\"");
	templateBuilder.Append(linkurl("index"));

	templateBuilder.Append("\" class=\"weui-footer__link\">电脑版</a>\r\n            </p>\r\n            <p class=\"weui-footer__text\">");
	templateBuilder.Append(Utils.ObjectToStr(site.copyright));
	templateBuilder.Append("</p>\r\n        </div>");


	templateBuilder.Append("\r\n    <!--/版权信息-->\r\n\r\n    <!--底部导航-->\r\n    <div class=\"weui-tab foot-nav\">\r\n        <div class=\"weui-tab__panel\">\r\n\r\n        </div>\r\n        <div class=\"weui-tabbar\">\r\n            <a href=\"");
	templateBuilder.Append(linkurl("index"));

	templateBuilder.Append("\" class=\"weui-tabbar__item\">\r\n                <i class=\"iconfont icon-home weui-tabbar__icon\"></i>\r\n                <p class=\"weui-tabbar__label\">首页</p>\r\n            </a>\r\n            <a href=\"");
	templateBuilder.Append(linkurl("usercenter","proinfo"));

	templateBuilder.Append("\" class=\"weui-tabbar__item\">\r\n                <i class=\"iconfont icon-info weui-tabbar__icon\"></i>\r\n                <p class=\"weui-tabbar__label\">个人资料</p>\r\n            </a>\r\n            <a href=\"");
	templateBuilder.Append(linkurl("usercenter","password"));

	templateBuilder.Append("\" class=\"weui-tabbar__item\">\r\n                <i class=\"iconfont icon-pwd weui-tabbar__icon\"></i>\r\n                <p class=\"weui-tabbar__label\">修改密码</p>\r\n            </a>\r\n            <a href=\"");
	templateBuilder.Append(linkurl("usercenter","invite"));

	templateBuilder.Append("\" class=\"weui-tabbar__item\">\r\n                <i class=\"iconfont icon-invite weui-tabbar__icon\"></i>\r\n                <p class=\"weui-tabbar__label\">邀请注册</p>\r\n            </a>\r\n        </div>\r\n    </div>\r\n    <!--/底部导航-->\r\n    <!--/修改资料-->\r\n    \r\n    ");
	}
	else if (action=="invite")
	{

	templateBuilder.Append("\r\n    <!--邀请码-->\r\n    <script type=\"text/javascript\">\r\n        $(function(){\r\n            //选中TAB样式\r\n            $(\".weui-tabbar a\").eq(3).addClass(\"weui-bar__item_on\");\r\n        });\r\n    </");
	templateBuilder.Append("script>\r\n    <div class=\"page__bd\">\r\n        <!--页面头部-->\r\n        <div class=\"header\">\r\n            <a class=\"back\" href=\"javascript:history.back();\">\r\n                <i class=\"iconfont icon-arrow-left\"></i>\r\n            </a>\r\n            <h3>邀请码</h3>\r\n            <div class=\"right\"> \r\n                <a class=\"weui-cell_access weui-cell_link\" href=\"javascript:;\" onclick=\"clickSubmit('");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/submit_ajax.ashx?action=user_invite_code');\">\r\n                    <i class=\"iconfont icon-edit\"></i>\r\n                </a>\r\n            </div>\r\n        </div>\r\n        <!--/页面头部-->\r\n        \r\n        <div class=\"detail-list\">\r\n            <ul>\r\n                ");
	DataTable inviteList = get_user_invite_list(0, "user_name='"+userModel.user_name+"'");

	foreach(DataRow dr in inviteList.Rows)
	{

	templateBuilder.Append("\r\n                <li>\r\n                    <div class=\"detail-hd\">\r\n                        <span class=\"fr\">\r\n                            ");
	if (get_invite_status(Utils.ObjectToStr(dr["str_code"])))
	{

	templateBuilder.Append("\r\n                                有效\r\n                            ");
	}
	else
	{

	templateBuilder.Append("\r\n                                已失效\r\n                            ");
	}	//end for if

	templateBuilder.Append("\r\n                        </span>\r\n                        <span>已使用 " + Utils.ObjectToStr(dr["count"]) + " 次</span>\r\n                    </div>\r\n                    <div class=\"detail-bd\">\r\n                        <div class=\"list-box\">\r\n                            <div class=\"txt-box\">\r\n                                <h2>邀请码：" + Utils.ObjectToStr(dr["str_code"]) + "</h2>\r\n                                <p>有效期：" + Utils.ObjectToStr(dr["add_time"]) + " - " + Utils.ObjectToStr(dr["eff_time"]) + "</p>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                </li>\r\n                ");
	}	//end for if

	if (inviteList.Rows.Count==0)
	{

	templateBuilder.Append("\r\n                <div class=\"nodata\">暂无邀请码...</div>\r\n                ");
	}	//end for if

	templateBuilder.Append("\r\n            </ul>\r\n        </div>\r\n        \r\n    </div>\r\n    <!--版权信息-->\r\n    ");

	templateBuilder.Append("        <div class=\"weui-footer footer\">\r\n            <p class=\"weui-footer__links\">\r\n                <a href=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.weburl));
	templateBuilder.Append("?m2w\" class=\"weui-footer__link\">触屏版</a>\r\n                <a href=\"");
	templateBuilder.Append(linkurl("index"));

	templateBuilder.Append("\" class=\"weui-footer__link\">电脑版</a>\r\n            </p>\r\n            <p class=\"weui-footer__text\">");
	templateBuilder.Append(Utils.ObjectToStr(site.copyright));
	templateBuilder.Append("</p>\r\n        </div>");


	templateBuilder.Append("\r\n    <!--/版权信息-->\r\n\r\n    <!--底部导航-->\r\n    <div class=\"weui-tab foot-nav\">\r\n        <div class=\"weui-tab__panel\">\r\n\r\n        </div>\r\n        <div class=\"weui-tabbar\">\r\n            <a href=\"");
	templateBuilder.Append(linkurl("index"));

	templateBuilder.Append("\" class=\"weui-tabbar__item\">\r\n                <i class=\"iconfont icon-home weui-tabbar__icon\"></i>\r\n                <p class=\"weui-tabbar__label\">首页</p>\r\n            </a>\r\n            <a href=\"");
	templateBuilder.Append(linkurl("usercenter","proinfo"));

	templateBuilder.Append("\" class=\"weui-tabbar__item\">\r\n                <i class=\"iconfont icon-info weui-tabbar__icon\"></i>\r\n                <p class=\"weui-tabbar__label\">个人资料</p>\r\n            </a>\r\n            <a href=\"");
	templateBuilder.Append(linkurl("usercenter","password"));

	templateBuilder.Append("\" class=\"weui-tabbar__item\">\r\n                <i class=\"iconfont icon-pwd weui-tabbar__icon\"></i>\r\n                <p class=\"weui-tabbar__label\">修改密码</p>\r\n            </a>\r\n            <a href=\"");
	templateBuilder.Append(linkurl("usercenter","invite"));

	templateBuilder.Append("\" class=\"weui-tabbar__item\">\r\n                <i class=\"iconfont icon-invite weui-tabbar__icon\"></i>\r\n                <p class=\"weui-tabbar__label\">邀请注册</p>\r\n            </a>\r\n        </div>\r\n    </div>\r\n    <!--/底部导航-->\r\n    <!--/邀请码-->\r\n    ");
	}	//end for if

	templateBuilder.Append("\r\n    \r\n    \r\n    \r\n</div>\r\n</body>\r\n</html>\r\n");
	Response.Write(templateBuilder.ToString());
}
</script>
