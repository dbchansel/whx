<%@ Page Language="C#" AutoEventWireup="true" Inherits="DTcms.Web.UI.Page.useraddress_edit" ValidateRequest="false" %>
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

	templateBuilder.Append("<!DOCTYPE html>\r\n<!--HTML5 doctype-->\r\n<html>\r\n<head>\r\n<meta charset=\"utf-8\">\r\n<meta name=\"viewport\" content=\"width=device-width,initial-scale=1,user-scalable=0\">\r\n<title>收货地址 - ");
	templateBuilder.Append(Utils.ObjectToStr(site.name));
	templateBuilder.Append("</title>\r\n<meta name=\"keywords\" content=\"");
	templateBuilder.Append(Utils.ObjectToStr(site.seo_keyword));
	templateBuilder.Append("\" />\r\n<meta name=\"description\" content=\"");
	templateBuilder.Append(Utils.ObjectToStr(site.seo_description));
	templateBuilder.Append("\" />\r\n<link rel=\"stylesheet\" type=\"text/css\" href=\"");
	templateBuilder.Append("/templates/mobile");
	templateBuilder.Append("/css/style.css\" />\r\n<link rel=\"stylesheet\" type=\"text/css\" href=\"");
	templateBuilder.Append("/templates/mobile");
	templateBuilder.Append("/css/validate.css\" />\r\n<script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append("/templates/mobile");
	templateBuilder.Append("/js/zepto.min.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append("/templates/mobile");
	templateBuilder.Append("/js/weui.min.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append("/templates/mobile");
	templateBuilder.Append("/js/common.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("scripts/jquery/PCASClass.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append("/templates/mobile");
	templateBuilder.Append("/js/mvalidate.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append("/templates/mobile");
	templateBuilder.Append("/js/mvalidate-extend.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\">\r\n    $(function(){\r\n        //初始化表单\r\n        AjaxInitForm('#editForm', '#btnSubmit', 1, '#turl');\r\n    });\r\n</");
	templateBuilder.Append("script>\r\n</head>\r\n\r\n<body ontouchstart>\r\n<div class=\"page\">\r\n    <!--页面头部-->\r\n    <div class=\"header\">\r\n        <a class=\"back\" href=\"javascript:history.back();\">\r\n            <i class=\"iconfont icon-arrow-left\"></i>\r\n        </a>\r\n        <h3>编辑地址簿</h3>\r\n        <div class=\"right\"> \r\n            <a class=\"weui-cell_access weui-cell_link\" href=\"");
	templateBuilder.Append(linkurl("usercenter","index"));

	templateBuilder.Append("\">\r\n                <i class=\"iconfont icon-user\"></i>\r\n            </a>\r\n        </div>\r\n    </div>\r\n    <!--/页面头部-->\r\n  \r\n    <!--页面内容-->\r\n    <div class=\"page__bd\">\r\n        ");
	if (action=="edit")
	{

	templateBuilder.Append("\r\n        <!--编辑地址-->\r\n        <script type=\"text/javascript\">\r\n            $(function(){\r\n                //初始化地区\r\n                var mypcas = new PCAS(\"txtProvince,所属省份\", \"txtCity,所属城市\", \"txtArea,所属地区\");\r\n                var areaArr = (\"");
	templateBuilder.Append(Utils.ObjectToStr(model.area));
	templateBuilder.Append("\").split(\",\");\r\n                if (areaArr.length == 3) {\r\n                    mypcas.SetValue(areaArr[0], areaArr[1], areaArr[2]);\r\n                }\r\n            });\r\n        </");
	templateBuilder.Append("script>\r\n        <form id=\"editForm\" name=\"editForm\" class=\"form-box\" url=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/submit_ajax.ashx?action=user_address_edit&id=");
	templateBuilder.Append(Utils.ObjectToStr(model.id));
	templateBuilder.Append("\">\r\n        <div class=\"weui-panel weui-panel_access\" style=\"margin-top:10px;\">\r\n            <div class=\"weui-panel__hd\">编辑地址</div>\r\n            <div class=\"weui-panel__bd\">\r\n                <div class=\"weui-cells_form form-box\">\r\n                    <div class=\"weui-cell\">\r\n                        <div class=\"weui-cell__hd\">\r\n                            <label class=\"weui-label\">收件人</label>\r\n                        </div>\r\n                        <div class=\"weui-cell__bd\">\r\n                            <input id=\"txtAcceptName\" name=\"txtAcceptName\" class=\"weui-input\" type=\"text\" value=\"");
	templateBuilder.Append(Utils.ObjectToStr(model.accept_name));
	templateBuilder.Append("\" placeholder=\"收件人名称\" data-validate=\"s\" />\r\n                        </div>\r\n                    </div>\r\n                    \r\n                    <div class=\"weui-cell\">\r\n                        <div class=\"weui-cell__hd\">\r\n                            <label class=\"weui-label\">所属地区</label>\r\n                        </div>\r\n                        <div class=\"weui-cell__bd\">\r\n                            <select id=\"txtProvince\" name=\"txtProvince\" class=\"select\"></select>\r\n                            <select id=\"txtCity\" name=\"txtCity\" class=\"select\"></select>\r\n                            <select id=\"txtArea\" name=\"txtArea\" class=\"select\" data-validate=\"select\"></select>\r\n                        </div>\r\n                    </div>\r\n                    \r\n                    <div class=\"weui-cell\">\r\n                        <div class=\"weui-cell__hd\">\r\n                            <label class=\"weui-label\">详细地址</label>\r\n                        </div>\r\n                        <div class=\"weui-cell__bd\">\r\n                            <input id=\"txtAddress\" name=\"txtAddress\" class=\"weui-input\" type=\"text\" value=\"");
	templateBuilder.Append(Utils.ObjectToStr(model.address));
	templateBuilder.Append("\" placeholder=\"详细地址\" data-validate=\"s\" />\r\n                        </div>\r\n                    </div>\r\n                    \r\n                    <div class=\"weui-cell\">\r\n                        <div class=\"weui-cell__hd\">\r\n                            <label class=\"weui-label\">手机号</label>\r\n                        </div>\r\n                        <div class=\"weui-cell__bd\">\r\n                            <input id=\"txtMobile\" name=\"txtMobile\" class=\"weui-input\" type=\"tel\" value=\"");
	templateBuilder.Append(Utils.ObjectToStr(model.mobile));
	templateBuilder.Append("\" placeholder=\"请输入手机号\" data-validate=\"m\" />\r\n                        </div>\r\n                    </div>\r\n                    \r\n                    <div class=\"weui-cell\">\r\n                        <div class=\"weui-cell__hd\">\r\n                            <label class=\"weui-label\">电话</label>\r\n                        </div>\r\n                        <div class=\"weui-cell__bd\">\r\n                            <input id=\"txtTelphone\" name=\"txtTelphone\" class=\"weui-input\" type=\"text\" value=\"");
	templateBuilder.Append(Utils.ObjectToStr(model.telphone));
	templateBuilder.Append("\" placeholder=\"电话号码，非必填\" />\r\n                        </div>\r\n                    </div>\r\n                    \r\n                    <div class=\"weui-cell\">\r\n                        <div class=\"weui-cell__hd\">\r\n                            <label class=\"weui-label\">邮箱</label>\r\n                        </div>\r\n                        <div class=\"weui-cell__bd\">\r\n                            <input id=\"txtEmail\" name=\"txtEmail\" class=\"weui-input\" type=\"text\" value=\"");
	templateBuilder.Append(Utils.ObjectToStr(model.email));
	templateBuilder.Append("\" placeholder=\"方便通知，非必填\" />\r\n                        </div>\r\n                    </div>\r\n                    \r\n                    <div class=\"weui-cell\">\r\n                        <div class=\"weui-cell__hd\">\r\n                            <label class=\"weui-label\">邮政编码</label>\r\n                        </div>\r\n                        <div class=\"weui-cell__bd\">\r\n                            <input id=\"txtPostCode\" name=\"txtPostCode\" class=\"weui-input\" type=\"text\" value=\"");
	templateBuilder.Append(Utils.ObjectToStr(model.post_code));
	templateBuilder.Append("\" placeholder=\"邮政编码，非必填\" />\r\n                        </div>\r\n                    </div>\r\n                    <div class=\"weui-cell\">\r\n                        <div class=\"weui-cell__hd\">\r\n                            <label class=\"weui-label\">验证码</label>\r\n                        </div>\r\n                        <div class=\"weui-cell__bd\">\r\n                            <input id=\"txtCode\" name=\"txtCode\" class=\"weui-input\" type=\"text\" placeholder=\"请输入验证码\" data-validate=\"code\" />\r\n                        </div>\r\n                        <div class=\"weui-cell__ft\">\r\n                            <a href=\"javascript:;\" onclick=\"ToggleCode(this, '");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/verify_code.ashx');return false;\">\r\n                            <img class=\"weui-vcode-img\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/verify_code.ashx\" style=\"width:82px;height:24px;\" />\r\n                            </a>\r\n                        </div>\r\n                    </div>\r\n                </div>\r\n                \r\n            </div>\r\n        </div>\r\n        \r\n        <div class=\"weui-btn-area\">\r\n            <input id=\"btnSubmit\" name=\"btnSubmit\" type=\"submit\" class=\"weui-btn weui-btn_primary\" value=\"确认提交\" />\r\n        </div>\r\n        </form>\r\n        <!--/编辑地址-->\r\n        \r\n        ");
	}
	else
	{

	templateBuilder.Append("\r\n        <!--新增地址-->\r\n        <script type=\"text/javascript\">\r\n            $(function(){\r\n                //初始化地区\r\n                var mypcas = new PCAS(\"txtProvince,所属省份\", \"txtCity,所属城市\", \"txtArea,所属地区\");\r\n            });\r\n        </");
	templateBuilder.Append("script>\r\n        <form id=\"editForm\" name=\"editForm\" class=\"form-box\" url=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/submit_ajax.ashx?action=user_address_edit\">\r\n        <div class=\"weui-panel weui-panel_access\" style=\"margin-top:10px;\">\r\n            <div class=\"weui-panel__hd\">新增地址</div>\r\n            <div class=\"weui-panel__bd\">\r\n                <div class=\"weui-cells_form form-box\">\r\n                    <div class=\"weui-cell\">\r\n                        <div class=\"weui-cell__hd\">\r\n                            <label class=\"weui-label\">收件人</label>\r\n                        </div>\r\n                        <div class=\"weui-cell__bd\">\r\n                            <input id=\"txtAcceptName\" name=\"txtAcceptName\" class=\"weui-input\" type=\"text\" placeholder=\"收件人名称\" data-validate=\"s\" />\r\n                        </div>\r\n                    </div>\r\n                    \r\n                    <div class=\"weui-cell\">\r\n                        <div class=\"weui-cell__hd\">\r\n                            <label class=\"weui-label\">所属地区</label>\r\n                        </div>\r\n                        <div class=\"weui-cell__bd\">\r\n                            <select id=\"txtProvince\" name=\"txtProvince\" class=\"select\"></select>\r\n                            <select id=\"txtCity\" name=\"txtCity\" class=\"select\"></select>\r\n                            <select id=\"txtArea\" name=\"txtArea\" class=\"select\" data-validate=\"select\"></select>\r\n                        </div>\r\n                    </div>\r\n                    \r\n                    <div class=\"weui-cell\">\r\n                        <div class=\"weui-cell__hd\">\r\n                            <label class=\"weui-label\">详细地址</label>\r\n                        </div>\r\n                        <div class=\"weui-cell__bd\">\r\n                            <input id=\"txtAddress\" name=\"txtAddress\" class=\"weui-input\" type=\"text\" placeholder=\"详细地址\" data-validate=\"s\" />\r\n                        </div>\r\n                    </div>\r\n                    \r\n                    <div class=\"weui-cell\">\r\n                        <div class=\"weui-cell__hd\">\r\n                            <label class=\"weui-label\">手机号</label>\r\n                        </div>\r\n                        <div class=\"weui-cell__bd\">\r\n                            <input id=\"txtMobile\" name=\"txtMobile\" class=\"weui-input\" type=\"tel\" placeholder=\"请输入手机号\" data-validate=\"m\" />\r\n                        </div>\r\n                    </div>\r\n                    \r\n                    <div class=\"weui-cell\">\r\n                        <div class=\"weui-cell__hd\">\r\n                            <label class=\"weui-label\">电话</label>\r\n                        </div>\r\n                        <div class=\"weui-cell__bd\">\r\n                            <input id=\"txtTelphone\" name=\"txtTelphone\" class=\"weui-input\" type=\"text\" placeholder=\"电话号码，非必填\" />\r\n                        </div>\r\n                    </div>\r\n                    \r\n                    <div class=\"weui-cell\">\r\n                        <div class=\"weui-cell__hd\">\r\n                            <label class=\"weui-label\">邮箱</label>\r\n                        </div>\r\n                        <div class=\"weui-cell__bd\">\r\n                            <input id=\"txtEmail\" name=\"txtEmail\" class=\"weui-input\" type=\"text\" placeholder=\"方便通知，非必填\" />\r\n                        </div>\r\n                    </div>\r\n                    \r\n                    <div class=\"weui-cell\">\r\n                        <div class=\"weui-cell__hd\">\r\n                            <label class=\"weui-label\">邮政编码</label>\r\n                        </div>\r\n                        <div class=\"weui-cell__bd\">\r\n                            <input id=\"txtPostCode\" name=\"txtPostCode\" class=\"weui-input\" type=\"text\" placeholder=\"邮政编码，非必填\" />\r\n                        </div>\r\n                    </div>\r\n                    <div class=\"weui-cell\">\r\n                        <div class=\"weui-cell__hd\">\r\n                            <label class=\"weui-label\">验证码</label>\r\n                        </div>\r\n                        <div class=\"weui-cell__bd\">\r\n                            <input id=\"txtCode\" name=\"txtCode\" class=\"weui-input\" type=\"text\" placeholder=\"请输入验证码\" data-validate=\"code\" />\r\n                        </div>\r\n                        <div class=\"weui-cell__ft\">\r\n                            <a href=\"javascript:;\" onclick=\"ToggleCode(this, '");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/verify_code.ashx');return false;\">\r\n                            <img class=\"weui-vcode-img\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/verify_code.ashx\" style=\"width:82px;height:24px;\" />\r\n                            </a>\r\n                        </div>\r\n                    </div>\r\n                </div>\r\n            </div>\r\n        </div>\r\n        \r\n        <div class=\"weui-btn-area\">\r\n            <input id=\"btnSubmit\" name=\"btnSubmit\" type=\"submit\" class=\"weui-btn weui-btn_primary\" value=\"确认提交\" />\r\n        </div>\r\n        </form>\r\n        <!--/新增地址-->\r\n        ");
	}	//end for if

	templateBuilder.Append("\r\n        \r\n        <input id=\"turl\" type=\"hidden\" value=\"");
	templateBuilder.Append(linkurl("useraddress"));

	templateBuilder.Append("\" /><!--存在跳转的URL值-->\r\n        \r\n        <!--版权信息-->\r\n        ");

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
