<%@ Page Language="C#" AutoEventWireup="true" Inherits="DTcms.Web.UI.Page.payment" ValidateRequest="false" %>
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

	templateBuilder.Append("<!DOCTYPE html>\r\n<!--HTML5 doctype-->\r\n<html>\r\n<head>\r\n<meta charset=\"utf-8\">\r\n<meta name=\"viewport\" content=\"width=device-width,initial-scale=1,user-scalable=0\">\r\n<title>支付中心－");
	templateBuilder.Append(Utils.ObjectToStr(config.webname));
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
	templateBuilder.Append("script>\r\n</head>\r\n\r\n<body ontouchstart>\r\n<div class=\"page\">\r\n    <!--页面头部-->\r\n    <div class=\"header\">\r\n        <a class=\"back\" href=\"javascript:history.back();\">\r\n            <i class=\"iconfont icon-arrow-left\"></i>\r\n        </a>\r\n        <h3>支付中心</h3>\r\n        <div class=\"right\"> \r\n            <a class=\"weui-cell_access weui-cell_link\" href=\"");
	templateBuilder.Append(linkurl("index"));

	templateBuilder.Append("\">\r\n                <i class=\"iconfont icon-home\"></i>\r\n            </a>\r\n        </div>\r\n    </div>\r\n    <!--/页面头部-->\r\n  \r\n    <!--页面内容-->\r\n    <div class=\"page__bd\">\r\n        ");
	if (action=="confirm")
	{

	templateBuilder.Append("\r\n        <form id=\"payForm\" name=\"payForm\" method=\"post\" action=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("api/payment/");
	templateBuilder.Append(Utils.ObjectToStr(payModel.api_path));
	templateBuilder.Append("/index.aspx\">\r\n            <input id=\"pay_order_no\" name=\"pay_order_no\" type=\"hidden\" value=\"");
	templateBuilder.Append(Utils.ObjectToStr(order_no));
	templateBuilder.Append("\" />\r\n            <input id=\"pay_order_amount\" name=\"pay_order_amount\" type=\"hidden\" value=\"");
	templateBuilder.Append(Utils.ObjectToStr(order_amount));
	templateBuilder.Append("\" />\r\n            <input id=\"pay_user_name\" name=\"pay_user_name\" type=\"hidden\" value=\"");
	templateBuilder.Append(Utils.ObjectToStr(userModel.user_name));
	templateBuilder.Append("\" />\r\n            \r\n            ");
	if (order_type=="recharge")
	{

	templateBuilder.Append("\r\n            <!--充值确认-->\r\n            <input id=\"pay_subject\" name=\"pay_subject\" type=\"hidden\" value=\"账户充值\" />\r\n            <div class=\"weui-form-preview form-preview\" style=\"margin-top:10px;\">\r\n                <div class=\"weui-form-preview__hd\">\r\n                    <div class=\"weui-form-preview__item\">\r\n                        <label class=\"weui-form-preview__label\">充值金额</label>\r\n                        <em class=\"weui-form-preview__value\">¥");
	templateBuilder.Append(Utils.ObjectToStr(order_amount));
	templateBuilder.Append("</em>\r\n                    </div>\r\n                </div>\r\n                <div class=\"weui-form-preview__bd\">\r\n                    <div class=\"weui-form-preview__item\">\r\n                        <label class=\"weui-form-preview__label\">订单号</label>\r\n                        <span class=\"weui-form-preview__value\">");
	templateBuilder.Append(Utils.ObjectToStr(order_no));
	templateBuilder.Append("</span>\r\n                    </div>\r\n                    <div class=\"weui-form-preview__item\">\r\n                        <label class=\"weui-form-preview__label\">支付方式</label>\r\n                        <span class=\"weui-form-preview__value\">");
	templateBuilder.Append(Utils.ObjectToStr(payModel.title));
	templateBuilder.Append("</span>\r\n                    </div>\r\n                </div>\r\n                <div class=\"weui-form-preview__ft\">\r\n                    <button id=\"btnSubmit\" type=\"submit\" class=\"weui-form-preview__btn weui-form-preview__btn_primary\">确认付款</button>\r\n                </div>\r\n            </div>\r\n            <!--充值确认-->\r\n            ");
	}
	else if (order_type=="buygoods")
	{

	templateBuilder.Append("\r\n            <!--商品订单-->\r\n            <input id=\"pay_subject\" name=\"pay_subject\" type=\"hidden\" value=\"购买商品\" />\r\n            <div class=\"weui-form-preview form-preview\" style=\"margin-top:10px;\">\r\n                <div class=\"weui-form-preview__hd\">\r\n                    <div class=\"weui-form-preview__item\">\r\n                        <label class=\"weui-form-preview__label\">支付金额</label>\r\n                        <em class=\"weui-form-preview__value\">¥");
	templateBuilder.Append(Utils.ObjectToStr(order_amount));
	templateBuilder.Append("</em>\r\n                    </div>\r\n                </div>\r\n                <div class=\"weui-form-preview__bd\">\r\n                    <div class=\"weui-form-preview__item\">\r\n                        <label class=\"weui-form-preview__label\">订单号</label>\r\n                        <span class=\"weui-form-preview__value\">");
	templateBuilder.Append(Utils.ObjectToStr(order_no));
	templateBuilder.Append("</span>\r\n                    </div>\r\n                    <div class=\"weui-form-preview__item\">\r\n                        <label class=\"weui-form-preview__label\">支付方式</label>\r\n                        <span class=\"weui-form-preview__value\">");
	templateBuilder.Append(Utils.ObjectToStr(payModel.title));
	templateBuilder.Append("</span>\r\n                    </div>\r\n                    <div class=\"weui-form-preview__item\">\r\n                        <label class=\"weui-form-preview__label\">收件人</label>\r\n                        <span class=\"weui-form-preview__value\">");
	templateBuilder.Append(Utils.ObjectToStr(orderModel.accept_name));
	templateBuilder.Append("</span>\r\n                    </div>\r\n                    <div class=\"weui-form-preview__item\">\r\n                        <label class=\"weui-form-preview__label\">送货地址</label>\r\n                        <span class=\"weui-form-preview__value\">");
	templateBuilder.Append(Utils.ObjectToStr(orderModel.area));
	templateBuilder.Append(Utils.ObjectToStr(orderModel.address));
	templateBuilder.Append("</span>\r\n                    </div>\r\n                    <div class=\"weui-form-preview__item\">\r\n                        <label class=\"weui-form-preview__label\">手机号码</label>\r\n                        <span class=\"weui-form-preview__value\">");
	templateBuilder.Append(Utils.ObjectToStr(orderModel.mobile));
	templateBuilder.Append("</span>\r\n                    </div>\r\n                    <div class=\"weui-form-preview__item\">\r\n                        <label class=\"weui-form-preview__label\">固定电话</label>\r\n                        <span class=\"weui-form-preview__value\">");
	templateBuilder.Append(Utils.ObjectToStr(orderModel.telphone));
	templateBuilder.Append("</span>\r\n                    </div>\r\n                    <div class=\"weui-form-preview__item\">\r\n                        <label class=\"weui-form-preview__label\">订单备注</label>\r\n                        <span class=\"weui-form-preview__value\">");
	templateBuilder.Append(Utils.ObjectToStr(orderModel.message));
	templateBuilder.Append("</span>\r\n                    </div>\r\n                </div>\r\n                <div class=\"weui-form-preview__ft\">\r\n                    <button id=\"btnSubmit\" type=\"submit\" class=\"weui-form-preview__btn weui-form-preview__btn_primary\">确认付款</button>\r\n                </div>\r\n            </div>\r\n            <!--/商品订单-->\r\n            ");
	}	//end for if

	templateBuilder.Append("\r\n        </form>\r\n        ");
	}	//end for if

	if (action=="succeed")
	{

	templateBuilder.Append("\r\n        <!--支付成功-->\r\n        <div class=\"weui-msg msg-box\">\r\n            <div class=\"weui-msg__icon-area\">\r\n                <i class=\"weui-icon-success weui-icon_msg\"></i>\r\n            </div>\r\n            <div class=\"weui-msg__text-area\">\r\n                <h2 class=\"weui-msg__title\">支付成功</h2>\r\n                <p class=\"weui-msg__desc\">\r\n                    支付已经成功，可以点击下方按钮进入会员中心查看订单。\r\n                </p>\r\n            </div>\r\n            <div class=\"weui-msg__opr-area\">\r\n                <p class=\"weui-btn-area\">\r\n                    <a class=\"weui-btn weui-btn_primary\" href=\"");
	templateBuilder.Append(linkurl("usercenter","index"));

	templateBuilder.Append("\">会员中心</a>\r\n                    <a class=\"weui-btn weui-btn_default\" href=\"");
	templateBuilder.Append(linkurl("index"));

	templateBuilder.Append("\">返回首页</a>\r\n                </p>\r\n            </div>\r\n            \r\n        </div>\r\n        <!--/支付成功-->\r\n        ");
	}	//end for if

	if (action=="error")
	{

	templateBuilder.Append("\r\n        <!--支付失败-->\r\n        <div class=\"weui-msg msg-box\">\r\n            <div class=\"weui-msg__icon-area\">\r\n                <i class=\"weui-icon-warn weui-icon_msg\"></i>\r\n            </div>\r\n            <div class=\"weui-msg__text-area\">\r\n                <h2 class=\"weui-msg__title\">支付失败</h2>\r\n                <p class=\"weui-msg__desc\">\r\n                    支付失败，可以点击下方按钮进入会员中心查看订单，如您确实已支付，请与我们客服人员联系！\r\n                </p>\r\n            </div>\r\n            <div class=\"weui-msg__opr-area\">\r\n                <p class=\"weui-btn-area\">\r\n                    <a class=\"weui-btn weui-btn_primary\" href=\"");
	templateBuilder.Append(linkurl("usercenter","index"));

	templateBuilder.Append("\">会员中心</a>\r\n                    <a class=\"weui-btn weui-btn_default\" href=\"");
	templateBuilder.Append(linkurl("index"));

	templateBuilder.Append("\">返回首页</a>\r\n                </p>\r\n            </div>\r\n        </div>\r\n        <!--/支付失败-->\r\n        ");
	}	//end for if

	if (action=="login")
	{

	templateBuilder.Append("\r\n        <!--会员登录-->\r\n        <div class=\"weui-msg msg-box\">\r\n            <div class=\"weui-msg__icon-area\">\r\n                <i class=\"weui-icon-info weui-icon_msg\"></i>\r\n            </div>\r\n            <div class=\"weui-msg__text-area\">\r\n                <h2 class=\"weui-msg__title\">尚未登录</h2>\r\n                <p class=\"weui-msg__desc\">\r\n                    账户尚未登录或已超时，如已是会员请登录后操作，尚未注册会员请先注册会员。\r\n                </p>\r\n            </div>\r\n            <div class=\"weui-msg__opr-area\">\r\n                <p class=\"weui-btn-area\">\r\n                    <a class=\"weui-btn weui-btn_primary\" href=\"");
	templateBuilder.Append(linkurl("usercenter","index"));

	templateBuilder.Append("\">账户登录</a>\r\n                    <a class=\"weui-btn weui-btn_default\" href=\"");
	templateBuilder.Append(linkurl("register"));

	templateBuilder.Append("\">免费注册</a>\r\n                </p>\r\n            </div>\r\n        </div>\r\n        <!--/会员登录-->\r\n        ");
	}	//end for if

	if (action=="recharge")
	{

	templateBuilder.Append("\r\n        <!--余额不足-->\r\n        <div class=\"weui-msg msg-box\">\r\n            <div class=\"weui-msg__icon-area\">\r\n                <i class=\"weui-icon-warn weui-icon_msg-primary\"></i>\r\n            </div>\r\n            <div class=\"weui-msg__text-area\">\r\n                <h2 class=\"weui-msg__title\">余额不足</h2>\r\n                <p class=\"weui-msg__desc\">\r\n                    您的余额不足本次支付，请充值后再进行付款，有任何问题随时与我们客服联系！\r\n                </p>\r\n            </div>\r\n            <div class=\"weui-msg__opr-area\">\r\n                <p class=\"weui-btn-area\">\r\n                    <a class=\"weui-btn weui-btn_primary\" href=\"");
	templateBuilder.Append(linkurl("useramount","recharge"));

	templateBuilder.Append("\">账户充值</a>\r\n                    <a class=\"weui-btn weui-btn_default\" href=\"");
	templateBuilder.Append(linkurl("index"));

	templateBuilder.Append("\">返回首页</a>\r\n                </p>\r\n            </div>\r\n        </div>\r\n        <!--/余额不足-->\r\n        ");
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
