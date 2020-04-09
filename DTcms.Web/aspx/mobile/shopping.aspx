<%@ Page Language="C#" AutoEventWireup="true" Inherits="DTcms.Web.UI.Page.shopping" ValidateRequest="false" %>
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

	templateBuilder.Append("<!DOCTYPE html>\r\n<!--HTML5 doctype-->\r\n<html>\r\n<head>\r\n<meta charset=\"utf-8\">\r\n<meta name=\"viewport\" content=\"width=device-width,initial-scale=1,user-scalable=0\">\r\n<title>确认订单 - ");
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
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("scripts/jquery/PCASClass.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\" charset=\"utf-8\" src=\"");
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
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append("/templates/mobile");
	templateBuilder.Append("/js/common.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append("/templates/mobile");
	templateBuilder.Append("/js/cart.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\">\r\n$(function(){\r\n	//初始化收货地址\r\n	initUserAddress(\"#userAddress\");\r\n	//初始化表单\r\n	AjaxInitForm('#orderForm', '#btnSubmit', 0);\r\n});\r\n</");
	templateBuilder.Append("script>\r\n</head>\r\n\r\n<body ontouchstart>\r\n<div class=\"page\">\r\n    <!--页面头部-->\r\n    <div class=\"header\">\r\n        <a class=\"back\" href=\"javascript:history.back();\">\r\n            <i class=\"iconfont icon-arrow-left\"></i>\r\n        </a>\r\n        <h3>订单确认</h3>\r\n        <div class=\"right\"> \r\n            <a class=\"weui-cell_access weui-cell_link\" href=\"");
	templateBuilder.Append(linkurl("index"));

	templateBuilder.Append("\">\r\n                <i class=\"iconfont icon-home\"></i>\r\n            </a>\r\n        </div>\r\n    </div>\r\n    <!--/页面头部-->\r\n  \r\n    <!--页面内容-->\r\n    <div class=\"page__bd\">\r\n\r\n        ");
	if (userModel!=null)
	{

	templateBuilder.Append("\r\n        <!--地址簿-->\r\n        <div class=\"weui-panel weui-panel_access\" style=\"margin-top:10px;\">\r\n            <div class=\"weui-panel__hd\">我的地址簿</div>\r\n            <div class=\"weui-panel__bd\">\r\n                <div id=\"userAddress\" class=\"weui-cells_radio form-box\">\r\n                    ");
	DataTable addrList = get_user_addr_book_list(0, "user_id="+userModel.id);

	foreach(DataRow dr in addrList.Rows)
	{

	templateBuilder.Append("\r\n                    <label class=\"weui-cell weui-check__label\" for=\"x-" + Utils.ObjectToStr(dr["id"]) + "\">\r\n                        <div class=\"weui-cell__bd\">\r\n                            <p>" + Utils.ObjectToStr(dr["accept_name"]) + "<i>" + Utils.ObjectToStr(dr["mobile"]) + "</i></p>\r\n                            <p>" + Utils.ObjectToStr(dr["area"]) + "" + Utils.ObjectToStr(dr["address"]) + "</p>\r\n                        </div>\r\n                        <div class=\"weui-cell__ft\">\r\n                            ");
	if (Utils.ObjectToStr(dr["is_default"])=="1")
	{

	templateBuilder.Append("\r\n                            <input id=\"x-" + Utils.ObjectToStr(dr["id"]) + "\" name=\"user_book_id\" type=\"radio\" class=\"weui-check\" checked=\"checked\" />\r\n                            ");
	}
	else
	{

	templateBuilder.Append("\r\n                            <input id=\"x-" + Utils.ObjectToStr(dr["id"]) + "\" name=\"user_book_id\" type=\"radio\" class=\"weui-check\" />\r\n                            ");
	}	//end for if

	templateBuilder.Append("\r\n                            <span class=\"weui-icon-checked\"></span>\r\n                        </div>\r\n                        <input name=\"user_accept_name\" type=\"hidden\" value=\"" + Utils.ObjectToStr(dr["accept_name"]) + "\" />\r\n                        <input name=\"user_area\" type=\"hidden\" value=\"" + Utils.ObjectToStr(dr["area"]) + "\" />\r\n                        <input name=\"user_address\" type=\"hidden\" value=\"" + Utils.ObjectToStr(dr["address"]) + "\" />\r\n                        <input name=\"user_mobile\" type=\"hidden\" value=\"" + Utils.ObjectToStr(dr["mobile"]) + "\" />\r\n                        <input name=\"user_telphone\" type=\"hidden\" value=\"" + Utils.ObjectToStr(dr["telphone"]) + "\" />\r\n                        <input name=\"user_email\" type=\"hidden\" value=\"" + Utils.ObjectToStr(dr["email"]) + "\" />\r\n                        <input name=\"user_post_code\" type=\"hidden\" value=\"" + Utils.ObjectToStr(dr["post_code"]) + "\" />\r\n                    </label>\r\n                    ");
	}	//end for if

	templateBuilder.Append("\r\n                </div>\r\n                \r\n            </div>\r\n        </div>\r\n        <!--/地址簿-->\r\n        ");
	}	//end for if

	templateBuilder.Append("\r\n        \r\n        <form id=\"orderForm\" name=\"orderForm\" url=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/submit_ajax.ashx?action=order_save&site_id=");
	templateBuilder.Append(Utils.ObjectToStr(site.id));
	templateBuilder.Append("\">\r\n        <!--收货地址-->\r\n        <div class=\"weui-panel weui-panel_access\" style=\"margin-top:10px;\">\r\n            <div class=\"weui-panel__hd\">收货地址</div>\r\n            <div class=\"weui-panel__bd\">\r\n                <div class=\"weui-cells_form form-box\">\r\n                    <input name=\"book_id\" id=\"book_id\" type=\"hidden\" value=\"0\" />\r\n                    <div class=\"weui-cell\">\r\n                        <div class=\"weui-cell__hd\">\r\n                            <label class=\"weui-label\">收件人</label>\r\n                        </div>\r\n                        <div class=\"weui-cell__bd\">\r\n                            <input id=\"accept_name\" name=\"accept_name\" class=\"weui-input\" type=\"text\" placeholder=\"收件人名称\" data-validate=\"s\" />\r\n                        </div>\r\n                    </div>\r\n                    \r\n                    <div class=\"weui-cell\">\r\n                        <div class=\"weui-cell__hd\">\r\n                            <label class=\"weui-label\">所属地区</label>\r\n                        </div>\r\n                        <div class=\"weui-cell__bd\">\r\n                            <select id=\"province\" name=\"province\" class=\"select\"></select>\r\n                            <select id=\"city\" name=\"city\" class=\"select\"></select>\r\n                            <select id=\"area\" name=\"area\" class=\"select\"></select>\r\n                        </div>\r\n                    </div>\r\n                    \r\n                    <div class=\"weui-cell\">\r\n                        <div class=\"weui-cell__hd\">\r\n                            <label class=\"weui-label\">详细地址</label>\r\n                        </div>\r\n                        <div class=\"weui-cell__bd\">\r\n                            <input id=\"address\" name=\"address\" class=\"weui-input\" type=\"text\" placeholder=\"详细地址\" data-validate=\"s\" />\r\n                        </div>\r\n                    </div>\r\n                    \r\n                    <div class=\"weui-cell\">\r\n                        <div class=\"weui-cell__hd\">\r\n                            <label class=\"weui-label\">手机号</label>\r\n                        </div>\r\n                        <div class=\"weui-cell__bd\">\r\n                            <input id=\"mobile\" name=\"mobile\" class=\"weui-input\" type=\"tel\" placeholder=\"请输入手机号\" data-validate=\"m\" />\r\n                        </div>\r\n                    </div>\r\n                    \r\n                    <div class=\"weui-cell\">\r\n                        <div class=\"weui-cell__hd\">\r\n                            <label class=\"weui-label\">电话</label>\r\n                        </div>\r\n                        <div class=\"weui-cell__bd\">\r\n                            <input id=\"telphone\" name=\"telphone\" class=\"weui-input\" type=\"text\" placeholder=\"电话号码，非必填\" />\r\n                        </div>\r\n                    </div>\r\n                    \r\n                    <div class=\"weui-cell\">\r\n                        <div class=\"weui-cell__hd\">\r\n                            <label class=\"weui-label\">邮箱</label>\r\n                        </div>\r\n                        <div class=\"weui-cell__bd\">\r\n                            <input id=\"email\" name=\"email\" class=\"weui-input\" type=\"text\" placeholder=\"方便通知，非必填\"/>\r\n                        </div>\r\n                    </div>\r\n                    \r\n                    <div class=\"weui-cell\">\r\n                        <div class=\"weui-cell__hd\">\r\n                            <label class=\"weui-label\">邮政编码</label>\r\n                        </div>\r\n                        <div class=\"weui-cell__bd\">\r\n                            <input id=\"post_code\" name=\"post_code\" class=\"weui-input\" type=\"text\" placeholder=\"邮政编码，非必填\"/>\r\n                        </div>\r\n                    </div>\r\n                    \r\n                </div>\r\n                \r\n            </div>\r\n        </div>\r\n        <!--/收货地址-->\r\n        \r\n        <!--支付方式-->\r\n        <div class=\"weui-panel weui-panel_access\">\r\n            <div class=\"weui-panel__hd\">支付方式</div>\r\n            <div class=\"weui-panel__bd\">\r\n                <div class=\"weui-cells_radio form-box\">\r\n                    ");
	DataTable paymentList = get_payment_list(0, "site_id="+site.id);

	foreach(DataRow dr in paymentList.Rows)
	{

	decimal poundage_amount = get_payment_poundage_amount(Utils.StrToInt(Utils.ObjectToStr(dr["id"]), 0),goodsTotal.real_amount);

	templateBuilder.Append("\r\n                    <label class=\"weui-cell weui-check__label\" for=\"p-" + Utils.ObjectToStr(dr["id"]) + "\">\r\n                        <div class=\"weui-cell__bd\">\r\n                            <p>" + Utils.ObjectToStr(dr["title"]) + "<i>手续费 ");
	templateBuilder.Append(Utils.ObjectToStr(poundage_amount));
	templateBuilder.Append(" 元</i></p>\r\n                        </div>\r\n                        <div class=\"weui-cell__ft\">\r\n                            <input id=\"p-" + Utils.ObjectToStr(dr["id"]) + "\" name=\"payment_id\" type=\"radio\" class=\"weui-check\" onclick=\"paymentAmountTotal(this);\" price=\"");
	templateBuilder.Append(Utils.ObjectToStr(poundage_amount));
	templateBuilder.Append("\" value=\"" + Utils.ObjectToStr(dr["id"]) + "\" data-validate=\"select\" />\r\n                            <span class=\"weui-icon-checked\"></span>\r\n                        </div>\r\n                    </label>\r\n                    ");
	}	//end for if

	templateBuilder.Append("\r\n                </div>\r\n                \r\n            </div>\r\n        </div>\r\n        <!--/支付方式-->\r\n        \r\n        <!--配送方式-->\r\n        <div class=\"weui-panel weui-panel_access\">\r\n            <div class=\"weui-panel__hd\">配送方式</div>\r\n            <div class=\"weui-panel__bd\">\r\n                <div class=\"weui-cells_radio form-box\">\r\n                    ");
	DataTable expressList = get_express_list(0, "");

	foreach(DataRow dr in expressList.Rows)
	{

	templateBuilder.Append("\r\n                    <label class=\"weui-cell weui-check__label\" for=\"e-" + Utils.ObjectToStr(dr["id"]) + "\">\r\n                        <div class=\"weui-cell__bd\">\r\n                            <p>" + Utils.ObjectToStr(dr["title"]) + "<i>运费 " + Utils.ObjectToStr(dr["express_fee"]) + " 元</i></p>\r\n                        </div>\r\n                        <div class=\"weui-cell__ft\">\r\n                            <input id=\"e-" + Utils.ObjectToStr(dr["id"]) + "\" name=\"express_id\" type=\"radio\" class=\"weui-check\" onclick=\"freightAmountTotal(this);\" price=\"" + Utils.ObjectToStr(dr["express_fee"]) + "\" value=\"" + Utils.ObjectToStr(dr["id"]) + "\" data-validate=\"select\" />\r\n                            <span class=\"weui-icon-checked\"></span>\r\n                        </div>\r\n                    </label>\r\n                    ");
	}	//end for if

	templateBuilder.Append("\r\n                </div>\r\n                \r\n            </div>\r\n        </div>\r\n        <!--/配送方式-->\r\n        \r\n        <!--商品清单-->\r\n        <div class=\"weui-panel weui-panel_access\">\r\n            <div class=\"weui-panel__hd\">商品列表</div>\r\n            <div class=\"weui-panel__bd\">\r\n                <div class=\"cart-list inset\">\r\n                    <ul>\r\n                        ");
	foreach(DTcms.Model.cart_items modelt in goodsList)
	{

	templateBuilder.Append("\r\n                        <li>\r\n                            <a href=\"");
	templateBuilder.Append(linkurl("goods_show",modelt.article_id));

	templateBuilder.Append("\" class=\"img-box\">\r\n                              <img src=\"");
	templateBuilder.Append(Utils.ObjectToStr(modelt.img_url));
	templateBuilder.Append("\" />\r\n                            </a>\r\n                            <h2>");
	templateBuilder.Append(Utils.ObjectToStr(modelt.title));
	templateBuilder.Append("</h2>\r\n                            <p class=\"stxt\">");
	templateBuilder.Append(Utils.ObjectToStr(modelt.spec_text));
	templateBuilder.Append("</p>\r\n                            <div class=\"note\">\r\n                                <span class=\"right\">\r\n                                  ×");
	templateBuilder.Append(Utils.ObjectToStr(modelt.quantity));
	templateBuilder.Append("\r\n                                </span>\r\n                                <i class=\"price\">¥");
	templateBuilder.Append(Utils.ObjectToStr(modelt.user_price));
	templateBuilder.Append("</i>\r\n                            </div>\r\n                        </li>\r\n                        ");
	}	//end for if

	templateBuilder.Append("\r\n                    </ul>\r\n                </div>\r\n                \r\n            </div>\r\n        </div>\r\n        <!--/商品清单-->\r\n        \r\n        <!--结算信息-->\r\n        <div class=\"weui-panel weui-panel_access\">\r\n            <div class=\"weui-panel__hd\">结算信息</div>\r\n            <div class=\"weui-panel__bd\">\r\n                <div class=\"weui-cells_form form-box\">\r\n                    <div class=\"weui-cell weui-cell_switch\">\r\n                        <div class=\"weui-cell__bd\">是否开具发票</div>\r\n                        <div class=\"weui-cell__ft\">\r\n                            <input id=\"is_invoice\" name=\"is_invoice\" class=\"weui-switch\" type=\"checkbox\" price=\"");
	templateBuilder.Append(get_order_taxamount(goodsTotal.real_amount).ToString());

	templateBuilder.Append("\" onclick=\"taxAmoutTotal(this);\" />\r\n                        </div>\r\n                    </div>\r\n                    \r\n                    <div id=\"invoiceBox\" class=\"weui-cell\" style=\"display:none;\">\r\n                        <div class=\"weui-cell__hd\">\r\n                            <label class=\"weui-label\">发票抬头</label>\r\n                        </div>\r\n                        <div class=\"weui-cell__bd\">\r\n                            <input id=\"invoice_title\" name=\"invoice_title\" class=\"weui-input\" type=\"text\" placeholder=\"开具发票的抬头\" />\r\n                        </div>\r\n                    </div>\r\n                    \r\n                    <div class=\"weui-cell\">\r\n                        <div class=\"weui-cell__bd\">\r\n                            <textarea name=\"message\" class=\"weui-textarea\" placeholder=\"订单备注(100字以内)\" rows=\"3\"></textarea>\r\n                        </div>\r\n                    </div>\r\n                    \r\n                </div>\r\n                \r\n                <div class=\"weui-form-preview form-preview\">\r\n                    <div class=\"weui-form-preview__hd\">\r\n                        <label class=\"weui-form-preview__label\">应付总金额</label>\r\n                        <em class=\"weui-form-preview__value\">¥<label id=\"totalAmount\">");
	templateBuilder.Append(Utils.ObjectToStr(goodsTotal.real_amount));
	templateBuilder.Append("</label></em>\r\n                    </div>\r\n                    <div class=\"weui-form-preview__bd\">\r\n                        <div class=\"weui-form-preview__item\">\r\n                            <label class=\"weui-form-preview__label\">商品金额</label>\r\n                            <span class=\"weui-form-preview__value\">¥<label id=\"goodsAmount\">");
	templateBuilder.Append(Utils.ObjectToStr(goodsTotal.real_amount));
	templateBuilder.Append("</label>元</span>\r\n                        </div>\r\n                        <div class=\"weui-form-preview__item\">\r\n                            <label class=\"weui-form-preview__label\">税费</label>\r\n                            <span class=\"weui-form-preview__value\">¥<label id=\"taxesFee\">0.00</label>元</span>\r\n                        </div>\r\n                        <div class=\"weui-form-preview__item\">\r\n                            <label class=\"weui-form-preview__label\">运费</label>\r\n                            <span class=\"weui-form-preview__value\">¥<label id=\"expressFee\">0.00</label>元</span>\r\n                        </div>\r\n                        <div class=\"weui-form-preview__item\">\r\n                            <label class=\"weui-form-preview__label\">支付手续费</label>\r\n                            <span class=\"weui-form-preview__value\">¥<label id=\"paymentFee\">0.00</label>元</span>\r\n                        </div>\r\n                        <div class=\"weui-form-preview__item\">\r\n                            <label class=\"weui-form-preview__label\">总积分</label>\r\n                            <span class=\"weui-form-preview__value\">");
	templateBuilder.Append(Utils.ObjectToStr(goodsTotal.total_point));
	templateBuilder.Append("分</span>\r\n                        </div>\r\n                    </div>\r\n                    <div class=\"weui-form-preview__ft\">\r\n                        <a class=\"weui-form-preview__btn weui-form-preview__btn_default\" href=\"");
	templateBuilder.Append(linkurl("cart"));

	templateBuilder.Append("\">返回购物车</a>\r\n                        ");
	if (goodsTotal.total_quantity>0)
	{

	templateBuilder.Append("\r\n                        <button id=\"btnSubmit\" type=\"submit\" class=\"weui-form-preview__btn weui-form-preview__btn_primary\">确认提交</button>\r\n                        ");
	}
	else
	{

	templateBuilder.Append("\r\n                        <button id=\"btnSubmit\" type=\"submit\" class=\"weui-form-preview__btn weui-form-preview__btn_primary\" disabled=\"disabled\">确认提交</button>\r\n                        ");
	}	//end for if

	templateBuilder.Append("\r\n                    </div>\r\n                </div>\r\n                \r\n            </div>\r\n        </div>\r\n        </form>\r\n        <!--/结算信息-->\r\n    \r\n        <!--版权信息-->\r\n        ");

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
