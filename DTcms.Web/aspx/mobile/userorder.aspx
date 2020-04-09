<%@ Page Language="C#" AutoEventWireup="true" Inherits="DTcms.Web.UI.Page.userorder" ValidateRequest="false" %>
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

	templateBuilder.Append("<!DOCTYPE html>\r\n<!--HTML5 doctype-->\r\n<html>\r\n<head>\r\n<meta charset=\"utf-8\">\r\n<meta name=\"viewport\" content=\"width=device-width,initial-scale=1,user-scalable=0\">\r\n<title>我的订单 - ");
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

	templateBuilder.Append("\">\r\n                <i class=\"iconfont icon-user\"></i>\r\n            </a>\r\n        </div>\r\n    </div>\r\n    <!--/页面头部-->\r\n    \r\n    <div class=\"page__bd\">\r\n        <!--订单列表-->\r\n        <div class=\"detail-list\">\r\n            <ul>\r\n                <!--取得一个DataTable-->\r\n                ");
	DataTable list = get_order_list(10, page, "user_id="+userModel.id, out totalcount);

	templateBuilder.Append("\r\n                <!--取得分页页码列表-->\r\n                ");
	string pagelist = get_page_link(10, page, totalcount, "userorder", action, "__id__");

	foreach(DataRow dr in list.Rows)
	{

	templateBuilder.Append("\r\n                <li>\r\n                    <div class=\"detail-hd\">\r\n                        <span class=\"fr\">");
	templateBuilder.Append(get_order_status(Utils.StrToInt(Utils.ObjectToStr(dr["id"]), 0)).ToString());

	templateBuilder.Append("</span>\r\n                        <span>" + Utils.ObjectToStr(dr["order_no"]) + "</span>\r\n                    </div>\r\n                    <div class=\"detail-bd\">\r\n                        ");
	List<DTcms.Model.article> ls = get_order_goods_list(Utils.StrToInt(Utils.ObjectToStr(dr["id"]), 0));

	if (ls!=null)
	{

	foreach(DTcms.Model.article modelt in ls)
	{

	templateBuilder.Append("\r\n                            <div class=\"list-box\">\r\n                                <div class=\"img-box\">\r\n                                    <img src=\"");
	templateBuilder.Append(Utils.ObjectToStr(modelt.img_url));
	templateBuilder.Append("\" />\r\n                                </div>\r\n                                <div class=\"txt-box\">\r\n                                    <h2>");
	templateBuilder.Append(Utils.ObjectToStr(modelt.title));
	templateBuilder.Append("</h2>\r\n                                    <p class=\"note\">\r\n                                        <span class=\"fr\"></span>\r\n                                        <span class=\"price\">￥" + Utils.ObjectToStr(modelt.fields["sell_price"]) + "</span>\r\n                                    </p>\r\n                                </div>\r\n                            </div>\r\n                            ");
	}	//end for if

	}	//end for if

	templateBuilder.Append("\r\n                    </div>\r\n                    <div class=\"detail-ft\">\r\n                        <p class=\"fr\">订单总金额：￥" + Utils.ObjectToStr(dr["order_amount"]) + "元</p>\r\n                        <p>" + Utils.ObjectToStr(dr["add_time"]) + "</p>\r\n                        <div class=\"ft-btn\">\r\n                            <div class=\"btn-box\">\r\n                                <a href=\"");
	templateBuilder.Append(linkurl("userorder_show",Utils.ObjectToStr(dr["id"])));

	templateBuilder.Append("\">查看订单</a>\r\n                                ");
	if (get_order_payment_status(Utils.StrToInt(Utils.ObjectToStr(dr["id"]), 0)))
	{

	templateBuilder.Append("\r\n                                <a href=\"");
	templateBuilder.Append(linkurl("payment","?action=confirm&order_no="+Utils.ObjectToStr(dr["order_no"])));

	templateBuilder.Append("\">去付款</a>\r\n                                ");
	}	//end for if

	if (Utils.StrToInt(Utils.ObjectToStr(dr["status"]), 0)<2)
	{

	templateBuilder.Append("\r\n                                <a href=\"javascript:;\" onclick=\"clickSubmit('");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/submit_ajax.ashx?action=order_cancel&order_no=" + Utils.ObjectToStr(dr["order_no"]) + "');\">取消订单</a>\r\n                                ");
	}	//end for if

	templateBuilder.Append("\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                </li>\r\n                ");
	}	//end for if

	if (list.Rows.Count==0)
	{

	templateBuilder.Append("\r\n                <div class=\"nodata\">暂无记录...</div>\r\n                ");
	}	//end for if

	templateBuilder.Append("\r\n            </ul>\r\n        </div>\r\n        \r\n        <!--分页页码-->\r\n        <div class=\"page-list\">\r\n            ");
	templateBuilder.Append(Utils.ObjectToStr(pagelist));
	templateBuilder.Append("\r\n        </div>\r\n        <!--/分页页码-->\r\n        \r\n        <input id=\"turl\" type=\"hidden\" value=\"");
	templateBuilder.Append(linkurl("useraddress"));

	templateBuilder.Append("\" /><!--存在跳转的URL值-->\r\n        <!--/订单列表-->\r\n    </div>\r\n    \r\n    <!--版权信息-->\r\n    ");

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
