<%@ Page Language="C#" AutoEventWireup="true" Inherits="DTcms.Web.UI.Page.userorder_show" ValidateRequest="false" %>
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

	templateBuilder.Append("<!DOCTYPE html>\r\n<!--HTML5 doctype-->\r\n<html>\r\n<head>\r\n<meta charset=\"utf-8\">\r\n<meta name=\"viewport\" content=\"width=device-width,initial-scale=1,user-scalable=0\">\r\n<title>查看订单 - ");
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
	templateBuilder.Append("script>\r\n</head>\r\n\r\n<body ontouchstart>\r\n<div class=\"page\">\r\n    <!--页面头部-->\r\n    <div class=\"header\">\r\n        <a class=\"back\" href=\"javascript:history.back();\">\r\n            <i class=\"iconfont icon-arrow-left\"></i>\r\n        </a>\r\n        <h3>我的订单</h3>\r\n        <div class=\"right\"> \r\n            <a class=\"weui-cell_access weui-cell_link\" href=\"");
	templateBuilder.Append(linkurl("usercenter","index"));

	templateBuilder.Append("\">\r\n                <i class=\"iconfont icon-user\"></i>\r\n            </a>\r\n        </div>\r\n    </div>\r\n    <!--/页面头部-->\r\n    \r\n    <div class=\"page__bd\">\r\n        \r\n        <!--收货信息-->\r\n        <div class=\"weui-form-preview form-preview\" style=\"margin-top:10px;\">\r\n            <div class=\"weui-form-preview__bd\">\r\n                <div class=\"weui-form-preview__item\">\r\n                    <label class=\"weui-form-preview__label\">收货人</label>\r\n                    <span class=\"weui-form-preview__value\">");
	templateBuilder.Append(Utils.ObjectToStr(model.accept_name));
	templateBuilder.Append("</span>\r\n                </div>\r\n                <div class=\"weui-form-preview__item\">\r\n                    <label class=\"weui-form-preview__label\">收货地址</label>\r\n                    <span class=\"weui-form-preview__value\">");
	templateBuilder.Append(Utils.ObjectToStr(model.area));
	templateBuilder.Append(" ");
	templateBuilder.Append(Utils.ObjectToStr(model.address));
	templateBuilder.Append(" ");
	templateBuilder.Append(Utils.ObjectToStr(model.post_code));
	templateBuilder.Append("</span>\r\n                </div>\r\n                <div class=\"weui-form-preview__item\">\r\n                    <label class=\"weui-form-preview__label\">联系电话</label>\r\n                    <span class=\"weui-form-preview__value\">");
	templateBuilder.Append(Utils.ObjectToStr(model.mobile));
	templateBuilder.Append(" ");
	templateBuilder.Append(Utils.ObjectToStr(model.telphone));
	templateBuilder.Append("</span>\r\n                </div>\r\n                <div class=\"weui-form-preview__item\">\r\n                    <label class=\"weui-form-preview__label\">电子邮箱</label>\r\n                    <span class=\"weui-form-preview__value\">");
	templateBuilder.Append(Utils.ObjectToStr(model.email));
	templateBuilder.Append("</span>\r\n                </div>\r\n                <div class=\"weui-form-preview__item\">\r\n                    <label class=\"weui-form-preview__label\">开具发票</label>\r\n                    <span class=\"weui-form-preview__value\">\r\n                        ");
	if (model.is_invoice==1)
	{

	templateBuilder.Append("\r\n                            是\r\n                        ");
	}
	else
	{

	templateBuilder.Append("\r\n                            否\r\n                        ");
	}	//end for if

	templateBuilder.Append("\r\n                    </span>\r\n                </div>\r\n                ");
	if (model.is_invoice==1)
	{

	templateBuilder.Append("\r\n                <div class=\"weui-form-preview__item\">\r\n                    <label class=\"weui-form-preview__label\">发票抬头</label>\r\n                    <span class=\"weui-form-preview__value\">");
	templateBuilder.Append(Utils.ObjectToStr(model.invoice_title));
	templateBuilder.Append("</span>\r\n                </div>\r\n                ");
	}	//end for if

	templateBuilder.Append("\r\n                <div class=\"weui-form-preview__item\">\r\n                    <label class=\"weui-form-preview__label\">备注留言</label>\r\n                    <span class=\"weui-form-preview__value\">");
	templateBuilder.Append(Utils.ObjectToStr(model.message));
	templateBuilder.Append("</span>\r\n                </div>\r\n            </div>\r\n        </div>\r\n        <!--收货信息-->\r\n        \r\n        <!--订单概述-->\r\n        <div class=\"weui-form-preview form-preview\">\r\n            <div class=\"weui-form-preview__bd\">\r\n                <div class=\"weui-form-preview__item\">\r\n                    <label class=\"weui-form-preview__label\">支付方式</label>\r\n                    <span class=\"weui-form-preview__value\">");
	templateBuilder.Append(get_payment_title(model.payment_id).ToString());

	templateBuilder.Append("</span>\r\n                </div>\r\n                ");
	if (model.payment_status==2)
	{

	templateBuilder.Append("\r\n                <div class=\"weui-form-preview__item\">\r\n                    <label class=\"weui-form-preview__label\">付款时间</label>\r\n                    <span class=\"weui-form-preview__value\">");
	templateBuilder.Append(Utils.ObjectToStr(model.payment_time));
	templateBuilder.Append("</span>\r\n                </div>\r\n                ");
	}	//end for if

	if (model.express_status==2)
	{

	templateBuilder.Append("\r\n                <div class=\"weui-form-preview__item\">\r\n                    <label class=\"weui-form-preview__label\">发货单号</label>\r\n                    <span class=\"weui-form-preview__value\">");
	templateBuilder.Append(get_express_title(model.express_id).ToString());

	templateBuilder.Append(" ");
	templateBuilder.Append(Utils.ObjectToStr(model.express_no));
	templateBuilder.Append("</span>\r\n                </div>\r\n                <div class=\"weui-form-preview__item\">\r\n                    <label class=\"weui-form-preview__label\">物流信息</label>\r\n                    <span class=\"weui-form-preview__value\">");
	templateBuilder.Append(Utils.ObjectToStr(expressdetail));
	templateBuilder.Append("</span>\r\n                </div>\r\n                ");
	}	//end for if

	templateBuilder.Append("\r\n            </div>\r\n        </div>\r\n        <!--订单概述-->\r\n        \r\n        <!--订单信息-->\r\n        <div class=\"weui-form-preview form-preview\">\r\n            <div class=\"weui-form-preview__bd\">\r\n                <div class=\"weui-form-preview__item\">\r\n                    <label class=\"weui-form-preview__label\">商品金额</label>\r\n                    <span class=\"weui-form-preview__value\">¥");
	templateBuilder.Append(Utils.ObjectToStr(model.real_amount));
	templateBuilder.Append("元</span>\r\n                </div>\r\n                <div class=\"weui-form-preview__item\">\r\n                    <label class=\"weui-form-preview__label\">税费</label>\r\n                    <span class=\"weui-form-preview__value\">¥");
	templateBuilder.Append(Utils.ObjectToStr(model.invoice_taxes));
	templateBuilder.Append("元</span>\r\n                </div>\r\n                <div class=\"weui-form-preview__item\">\r\n                    <label class=\"weui-form-preview__label\">运费</label>\r\n                    <span class=\"weui-form-preview__value\">¥");
	templateBuilder.Append(Utils.ObjectToStr(model.express_fee));
	templateBuilder.Append("元</span>\r\n                </div>\r\n                <div class=\"weui-form-preview__item\">\r\n                    <label class=\"weui-form-preview__label\">支付手续费</label>\r\n                    <span class=\"weui-form-preview__value\">¥");
	templateBuilder.Append(Utils.ObjectToStr(model.payment_fee));
	templateBuilder.Append("元</span>\r\n                </div>\r\n                <div class=\"weui-form-preview__item\">\r\n                    <label class=\"weui-form-preview__label\">总积分</label>\r\n                    <span class=\"weui-form-preview__value\">");
	templateBuilder.Append(Utils.ObjectToStr(model.point));
	templateBuilder.Append("分</span>\r\n                </div>\r\n            </div>\r\n        </div>\r\n        <!--订单信息-->\r\n        \r\n        <!--商品列表-->\r\n        <div class=\"detail-list\">\r\n            <ul>\r\n                <li>\r\n                    <div class=\"detail-hd\">\r\n                        <span class=\"fr\">");
	templateBuilder.Append(get_order_status(model.id).ToString());

	templateBuilder.Append("</span>\r\n                        <span>");
	templateBuilder.Append(Utils.ObjectToStr(model.order_no));
	templateBuilder.Append("</span>\r\n                    </div>\r\n                    <div class=\"detail-bd\">\r\n                        ");
	if (model.order_goods!=null)
	{

	foreach(DTcms.Model.order_goods modelt in model.order_goods)
	{

	templateBuilder.Append("\r\n                        <div class=\"list-box\">\r\n                            <div class=\"img-box\">\r\n                                <a href=\"");
	templateBuilder.Append(linkurl("goods_show",modelt.article_id));

	templateBuilder.Append("\"><img src=\"");
	templateBuilder.Append(get_article_img_url(modelt.channel_id, modelt.article_id).ToString());

	templateBuilder.Append("\" /></a>\r\n                            </div>\r\n                            <div class=\"txt-box\">\r\n                                <h2>");
	templateBuilder.Append(Utils.ObjectToStr(modelt.goods_title));
	templateBuilder.Append("</h2>\r\n                                <p>");
	templateBuilder.Append(Utils.ObjectToStr(modelt.spec_text));
	templateBuilder.Append("</p>\r\n                                <p class=\"note\">\r\n                                    <span class=\"fr\">×");
	templateBuilder.Append(Utils.ObjectToStr(modelt.quantity));
	templateBuilder.Append("</span>\r\n                                    <span class=\"price\">￥");
	templateBuilder.Append(Utils.ObjectToStr(modelt.real_price));
	templateBuilder.Append("</span>\r\n                                </p>\r\n                            </div>\r\n                        </div>\r\n                        ");
	}	//end for if

	}	//end for if

	templateBuilder.Append("\r\n                    </div>\r\n                    <div class=\"detail-ft\">\r\n                        <p class=\"fr\">订单总金额：¥");
	templateBuilder.Append(Utils.ObjectToStr(model.order_amount));
	templateBuilder.Append("元</p>\r\n                        <p>");
	templateBuilder.Append(Utils.ObjectToStr(model.add_time));
	templateBuilder.Append("</p>\r\n                        <div class=\"ft-btn\">\r\n                            <div class=\"btn-box\">\r\n                                ");
	if (get_order_payment_status(model.id))
	{

	templateBuilder.Append("\r\n                                <a href=\"");
	templateBuilder.Append(linkurl("payment","?action=confirm&order_no="+model.order_no));

	templateBuilder.Append("\">去付款</a>\r\n                                ");
	}	//end for if

	if (model.status<2)
	{

	templateBuilder.Append("\r\n                                <a href=\"javascript:;\" onclick=\"clickSubmit('");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/submit_ajax.ashx?action=order_cancel&order_no=");
	templateBuilder.Append(Utils.ObjectToStr(model.order_no));
	templateBuilder.Append("');\">取消订单</a>\r\n                                ");
	}	//end for if

	templateBuilder.Append("\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                </li>\r\n            </ul>\r\n        </div>\r\n        <!--/商品列表-->\r\n        \r\n    </div>\r\n    \r\n    <!--版权信息-->\r\n    ");

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


	templateBuilder.Append("\r\n    <!--/底部导航-->\r\n</div>\r\n</body>\r\n</html>\r\n");
	Response.Write(templateBuilder.ToString());
}
</script>
