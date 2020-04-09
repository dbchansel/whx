<%@ Page Language="C#" AutoEventWireup="true" Inherits="DTcms.Web.UI.Page.useramount" ValidateRequest="false" %>
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

	templateBuilder.Append("<!DOCTYPE html>\r\n<!--HTML5 doctype-->\r\n<html>\r\n<head>\r\n<meta charset=\"utf-8\">\r\n<meta name=\"viewport\" content=\"width=device-width,initial-scale=1,user-scalable=0\">\r\n<title>账户余额 - ");
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
	templateBuilder.Append("script>\r\n</head>\r\n\r\n<body ontouchstart>\r\n<div class=\"page\">\r\n    <!--页面头部-->\r\n    <div class=\"header\">\r\n        <a class=\"back\" href=\"javascript:history.back();\">\r\n            <i class=\"iconfont icon-arrow-left\"></i>\r\n        </a>\r\n        <h3>账户余额</h3>\r\n        <div class=\"right\"> \r\n            <a class=\"weui-cell_access weui-cell_link\" href=\"");
	templateBuilder.Append(linkurl("usercenter","index"));

	templateBuilder.Append("\">\r\n                <i class=\"iconfont icon-user\"></i>\r\n            </a>\r\n        </div>\r\n    </div>\r\n    <!--/页面头部-->\r\n    \r\n    <div class=\"page__bd\">\r\n\r\n        ");
	if (action=="recharge")
	{

	templateBuilder.Append("\r\n        <!--账户充值-->\r\n        <link rel=\"stylesheet\" type=\"text/css\" href=\"");
	templateBuilder.Append("/templates/mobile");
	templateBuilder.Append("/css/validate.css\" />\r\n        <script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append("/templates/mobile");
	templateBuilder.Append("/js/mvalidate.js\"></");
	templateBuilder.Append("script>\r\n        <script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append("/templates/mobile");
	templateBuilder.Append("/js/mvalidate-extend.js\"></");
	templateBuilder.Append("script>\r\n        <script type=\"text/javascript\">\r\n            $(function(){\r\n                //初始化表单\r\n                AjaxInitForm('#rechargeForm', '#btnSubmit', 0);\r\n                //选中TAB样式\r\n                $(\".weui-tabbar a\").eq(1).addClass(\"weui-bar__item_on\");\r\n            });\r\n        </");
	templateBuilder.Append("script>\r\n        <form id=\"rechargeForm\" name=\"rechargeForm\" class=\"form-box\" url=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/submit_ajax.ashx?action=user_amount_recharge&site_id=");
	templateBuilder.Append(Utils.ObjectToStr(site.id));
	templateBuilder.Append("\">\r\n        <div class=\"weui-form-preview\" style=\"margin-top:10px;\">\r\n            <div class=\"weui-form-preview__hd\">\r\n                <div class=\"weui-form-preview__item\">\r\n                    <label class=\"weui-form-preview__label\">当前余额</label>\r\n                    <em class=\"weui-form-preview__value\">¥");
	templateBuilder.Append(Utils.ObjectToStr(userModel.amount));
	templateBuilder.Append("</em>\r\n                </div>\r\n            </div>\r\n        </div>\r\n        \r\n        <div class=\"weui-panel weui-panel_access\">\r\n            <div class=\"weui-panel__hd\">账户充值</div>\r\n            <div class=\"weui-panel__bd\">\r\n                <div class=\"weui-cells_form form-box\">\r\n                    <div class=\"weui-cell\">\r\n                        <div class=\"weui-cell__hd\">\r\n                            <label class=\"weui-label\">充值金额</label>\r\n                        </div>\r\n                        <div class=\"weui-cell__bd\">\r\n                            <input id=\"order_amount\" name=\"order_amount\" type=\"text\" class=\"weui-input\" placeholder=\"请输入金额\" data-validate=\"n\" />\r\n                        </div>\r\n                    </div>\r\n                </div>\r\n            </div>\r\n        </div>\r\n        \r\n        <div class=\"weui-panel weui-panel_access\">\r\n            <div class=\"weui-panel__hd\">支付方式</div>\r\n            <div class=\"weui-panel__bd\">\r\n                <div class=\"weui-cells_radio form-box\">\r\n                    <!--取得一个DataTable-->\r\n                    ");
	DataTable payList = get_payment_list(0, "type=1 and payment_id>2 and site_id="+site.id);

	foreach(DataRow dr in payList.Rows)
	{

	templateBuilder.Append("\r\n                    <label class=\"weui-cell weui-check__label\" for=\"p-" + Utils.ObjectToStr(dr["id"]) + "\">\r\n                        <div class=\"weui-cell__bd\">\r\n                            <p>" + Utils.ObjectToStr(dr["title"]) + "</p>\r\n                        </div>\r\n                        <div class=\"weui-cell__ft\">\r\n                            <input id=\"p-" + Utils.ObjectToStr(dr["id"]) + "\" name=\"payment_id\" type=\"radio\" class=\"weui-check\" value=\"" + Utils.ObjectToStr(dr["id"]) + "\" data-validate=\"select\" />\r\n                            <span class=\"weui-icon-checked\"></span>\r\n                        </div>\r\n                    </label>\r\n                    ");
	}	//end for if

	templateBuilder.Append("\r\n                </div>\r\n            </div>\r\n        </div>\r\n        \r\n        <div class=\"weui-btn-area\">\r\n            <input id=\"btnSubmit\" name=\"btnSubmit\" type=\"submit\" class=\"weui-btn weui-btn_primary\" value=\"确认充值\" />\r\n        </div>\r\n        </form>\r\n        <!--账户充值-->\r\n\r\n        ");
	}
	else if (action=="log")
	{

	templateBuilder.Append("\r\n        <!--充值记录-->\r\n        <script type=\"text/javascript\">\r\n            $(function(){\r\n                //选中TAB样式\r\n                $(\".weui-tabbar a\").eq(2).addClass(\"weui-bar__item_on\");\r\n            });\r\n            //删除方法\r\n            function ExecPostBack(checkValue) {\r\n                if (arguments.length == 1) {\r\n                    ExecDelete('");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/submit_ajax.ashx?action=user_recharge_delete', checkValue, '#turl');\r\n                }else{\r\n                    var valueArr = '';\r\n                    $(\"input[name='checkId']:checked\").each(function(i){\r\n                        valueArr += $(this).val();\r\n                        if(i < $(\"input[name='checkId']:checked\").length - 1){\r\n                            valueArr += \",\"\r\n                        }\r\n                    });\r\n                    ExecDelete('");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/submit_ajax.ashx?action=user_recharge_delete', valueArr, '#turl');\r\n                }\r\n            }\r\n        </");
	templateBuilder.Append("script>\r\n        \r\n        <div class=\"detail-list\">\r\n            <ul>\r\n                <!--取得一个DataTable-->\r\n                ");
	DataTable rechargeList = get_user_recharge_list(10, page, "user_id="+userModel.id, out totalcount);

	templateBuilder.Append("\r\n                <!--取得分页页码列表-->\r\n                ");
	string pagelist = get_page_link(10, page, totalcount, "useramount", action, "__id__");

	foreach(DataRow dr in rechargeList.Rows)
	{

	templateBuilder.Append("\r\n                <li>\r\n                    <div class=\"detail-hd\">\r\n                        <span class=\"fr\">\r\n                            ");
	if (Utils.StrToInt(Utils.ObjectToStr(dr["status"]), 0)>0)
	{

	templateBuilder.Append("\r\n                                已完成\r\n                            ");
	}
	else
	{

	templateBuilder.Append("\r\n                                未完成\r\n                            ");
	}	//end for if

	templateBuilder.Append("\r\n                        </span>\r\n                        <span>" + Utils.ObjectToStr(dr["add_time"]) + "</span>\r\n                    </div>\r\n                    <div class=\"detail-bd\">\r\n                        <div class=\"list-box\">\r\n                            <div class=\"txt-box\">\r\n                                <h2>订单号 " + Utils.ObjectToStr(dr["recharge_no"]) + "</h2>\r\n                                <p class=\"note\">\r\n                                    <span class=\"fr\">\r\n                                        ￥" + Utils.ObjectToStr(dr["amount"]) + "\r\n                                    </span>\r\n                                    <span>");
	templateBuilder.Append(get_payment_title(Utils.StrToInt(Utils.ObjectToStr(dr["payment_id"]), 0)).ToString());

	templateBuilder.Append("</span>\r\n                                </p>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    <div class=\"detail-ft\">\r\n                        <div class=\"ft-btn\">\r\n                            <div class=\"btn-box\">\r\n                                <a href=\"javascript:;\" onclick=\"ExecPostBack('" + Utils.ObjectToStr(dr["id"]) + "');\">\r\n                                    <i class=\"iconfont icon-delete\"></i>\r\n                                    删除\r\n                                </a>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                </li>\r\n                ");
	}	//end for if

	if (rechargeList.Rows.Count==0)
	{

	templateBuilder.Append("\r\n                <div class=\"nodata\">暂无记录...</div>\r\n                ");
	}	//end for if

	templateBuilder.Append("\r\n            </ul>\r\n        </div>\r\n        \r\n        <!--分页页码-->\r\n        <div class=\"page-list\">\r\n            ");
	templateBuilder.Append(Utils.ObjectToStr(pagelist));
	templateBuilder.Append("\r\n        </div>\r\n        <!--/分页页码-->\r\n        \r\n        <!--div class=\"detail-list\">\r\n            <ul>\r\n                <li>\r\n                    <div class=\"detail-hd\">\r\n                        <span class=\"fr\">已完成</span>\r\n                        <span>2017-07-08 22:30:12</span>\r\n                    </div>\r\n                    <div class=\"detail-bd\">\r\n                        <div class=\"list-box\">\r\n                            <div class=\"img-box\">\r\n                                <img src=\"#\" />\r\n                            </div>\r\n                            <div class=\"txt-box\">\r\n                                <h2>这是标题文字</h2>\r\n                                <p>这是描述信息</p>\r\n                                <p class=\"note\">\r\n                                    <span class=\"fr\">X1</span>\r\n                                    <span>文字</span>\r\n                                </p>\r\n                            </div>\r\n                        </div>\r\n                        \r\n                        <div class=\"list-box\">\r\n                            <div class=\"img-box\">\r\n                                <img src=\"#\" />\r\n                            </div>\r\n                            <div class=\"txt-box\">\r\n                                <h2>这是标题文字</h2>\r\n                                <p>这是描述信息</p>\r\n                                <p class=\"note\">\r\n                                    <span class=\"fr\">X1</span>\r\n                                    <span>文字</span>\r\n                                </p>\r\n                            </div>\r\n                        </div>\r\n                        \r\n                    </div>\r\n                    <div class=\"detail-ft\">\r\n                        <p class=\"fr\">共1件商品 合计：325元</p>\r\n                        <p>再来一句说明</p>\r\n                        <div class=\"ft-btn\">\r\n                            <label class=\"check-box\">\r\n                                <input type=\"checkbox\" name=\"checkall\" class=\"checkall\" />全选\r\n                            </label>\r\n                            <div class=\"btn-box\">\r\n                                <a href=\"javascript:;\">\r\n                                    <i class=\"iconfont icon-all\"></i>\r\n                                    选择\r\n                                </a>\r\n                                <a href=\"javascript:;\">\r\n                                    <i class=\"iconfont icon-delete\"></i>\r\n                                    删除\r\n                                </a>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                </li>\r\n                \r\n            </ul>\r\n        </div-->\r\n        \r\n        <input id=\"turl\" type=\"hidden\" value=\"");
	templateBuilder.Append(linkurl("useramount","log"));

	templateBuilder.Append("\" /><!--存在跳转的URL值-->\r\n        <!--/充值记录-->\r\n        \r\n        ");
	}
	else if (action=="list")
	{

	templateBuilder.Append("\r\n        <!--收支明细-->\r\n        <script type=\"text/javascript\">\r\n            $(function(){\r\n                //选中TAB样式\r\n                $(\".weui-tabbar a\").eq(3).addClass(\"weui-bar__item_on\");\r\n            });\r\n            //删除方法\r\n            function ExecPostBack(checkValue) {\r\n                if (arguments.length == 1) {\r\n                    ExecDelete('");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/submit_ajax.ashx?action=user_amount_delete', checkValue, '#turl');\r\n                }else{\r\n                    var valueArr = '';\r\n                    $(\"input[name='checkId']:checked\").each(function(i){\r\n                        valueArr += $(this).val();\r\n                        if(i < $(\"input[name='checkId']:checked\").length - 1){\r\n                            valueArr += \",\"\r\n                        }\r\n                    });\r\n                    ExecDelete('");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/submit_ajax.ashx?action=user_amount_delete', valueArr, '#turl');\r\n                }\r\n            }\r\n        </");
	templateBuilder.Append("script>\r\n        \r\n        <div class=\"detail-list\">\r\n            <ul>\r\n                <!--取得一个DataTable-->\r\n                ");
	DataTable amountList = get_user_amount_list(10, page, "user_id="+userModel.id, out totalcount);

	templateBuilder.Append("\r\n                <!--取得分页页码列表-->\r\n                ");
	string pagelist = get_page_link(10, page, totalcount, "useramount", action, "__id__");

	foreach(DataRow dr in amountList.Rows)
	{

	templateBuilder.Append("\r\n                <li>\r\n                    <div class=\"detail-bd\">\r\n                        <div class=\"list-box\">\r\n                            <div class=\"txt-box\">\r\n                                <h2>" + Utils.ObjectToStr(dr["remark"]) + "</h2>\r\n                                <p class=\"note\">\r\n                                    <span class=\"fr\">\r\n                                        ");
	if (Utils.StrToInt(Utils.ObjectToStr(dr["value"]), 0)>0)
	{

	templateBuilder.Append("\r\n                                        +" + Utils.ObjectToStr(dr["value"]) + "\r\n                                        ");
	}
	else
	{

	templateBuilder.Append("\r\n                                        " + Utils.ObjectToStr(dr["value"]) + "\r\n                                        ");
	}	//end for if

	templateBuilder.Append("\r\n                                    </span>\r\n                                    <span>" + Utils.ObjectToStr(dr["add_time"]) + "</span>\r\n                                </p>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    <div class=\"detail-ft\">\r\n                        <div class=\"ft-btn\">\r\n                            <div class=\"btn-box\">\r\n                                <a href=\"javascript:;\" onclick=\"ExecPostBack('" + Utils.ObjectToStr(dr["id"]) + "');\">\r\n                                    <i class=\"iconfont icon-delete\"></i>\r\n                                    删除\r\n                                </a>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                </li>\r\n                ");
	}	//end for if

	if (amountList.Rows.Count==0)
	{

	templateBuilder.Append("\r\n                <div class=\"nodata\">暂无记录...</div>\r\n                ");
	}	//end for if

	templateBuilder.Append("\r\n            </ul>\r\n        </div>\r\n        \r\n        <!--分页页码-->\r\n        <div class=\"page-list\">\r\n            ");
	templateBuilder.Append(Utils.ObjectToStr(pagelist));
	templateBuilder.Append("\r\n        </div>\r\n        <!--/分页页码-->\r\n        \r\n        <input id=\"turl\" type=\"hidden\" value=\"");
	templateBuilder.Append(linkurl("useramount","list"));

	templateBuilder.Append("\" /><!--存在跳转的URL值-->\r\n        <!--/收支明细-->\r\n        ");
	}	//end for if

	templateBuilder.Append("\r\n        \r\n    </div>\r\n    \r\n    <!--版权信息-->\r\n    ");

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
	templateBuilder.Append(linkurl("useramount","recharge"));

	templateBuilder.Append("\" class=\"weui-tabbar__item\">\r\n                <i class=\"iconfont icon-money weui-tabbar__icon\"></i>\r\n                <p class=\"weui-tabbar__label\">账户充值</p>\r\n            </a>\r\n            <a href=\"");
	templateBuilder.Append(linkurl("useramount","log"));

	templateBuilder.Append("\" class=\"weui-tabbar__item\">\r\n                <i class=\"iconfont icon-amount weui-tabbar__icon\"></i>\r\n                <p class=\"weui-tabbar__label\">充值记录</p>\r\n            </a>\r\n            <a href=\"");
	templateBuilder.Append(linkurl("useramount","list"));

	templateBuilder.Append("\" class=\"weui-tabbar__item\">\r\n                <i class=\"iconfont icon-log weui-tabbar__icon\"></i>\r\n                <p class=\"weui-tabbar__label\">收支明细</p>\r\n            </a>\r\n        </div>\r\n    </div>\r\n    <!--/底部导航-->\r\n</div>\r\n</body>\r\n</html>\r\n");
	Response.Write(templateBuilder.ToString());
}
</script>
