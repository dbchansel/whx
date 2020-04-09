<%@ Page Language="C#" AutoEventWireup="true" Inherits="DTcms.Web.UI.Page.userpoint" ValidateRequest="false" %>
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

	templateBuilder.Append("<!DOCTYPE html>\r\n<!--HTML5 doctype-->\r\n<html>\r\n<head>\r\n<meta charset=\"utf-8\">\r\n<meta name=\"viewport\" content=\"width=device-width,initial-scale=1,user-scalable=0\">\r\n<title>我的积分 - ");
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
	templateBuilder.Append("script>\r\n</head>\r\n\r\n<body ontouchstart>\r\n<div class=\"page\">\r\n    <!--页面头部-->\r\n    <div class=\"header\">\r\n        <a class=\"back\" href=\"javascript:history.back();\">\r\n            <i class=\"iconfont icon-arrow-left\"></i>\r\n        </a>\r\n        <h3>我的税分</h3>\r\n        <div class=\"right\"> \r\n            <a class=\"weui-cell_access weui-cell_link\" href=\"");
	templateBuilder.Append(linkurl("usercenter","index"));

	templateBuilder.Append("\">\r\n                <i class=\"iconfont icon-user\"></i>\r\n            </a>\r\n        </div>\r\n    </div>\r\n    <!--/页面头部-->\r\n    \r\n    <div class=\"page__bd\">\r\n\r\n        ");
	if (action=="convert")
	{

	templateBuilder.Append("\r\n        <!--积分兑换-->\r\n        <link rel=\"stylesheet\" type=\"text/css\" href=\"");
	templateBuilder.Append("/templates/mobile");
	templateBuilder.Append("/css/validate.css\" />\r\n        <script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append("/templates/mobile");
	templateBuilder.Append("/js/mvalidate.js\"></");
	templateBuilder.Append("script>\r\n        <script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append("/templates/mobile");
	templateBuilder.Append("/js/mvalidate-extend.js\"></");
	templateBuilder.Append("script>\r\n        <script type=\"text/javascript\">\r\n            $(function(){\r\n                //初始化表单\r\n                AjaxInitForm('#pointForm', '#btnSubmit', 1, '#turl');\r\n                //选中TAB样式\r\n                $(\".weui-tabbar a\").eq(1).addClass(\"weui-bar__item_on\");\r\n            });\r\n        </");
	templateBuilder.Append("script>\r\n        \r\n        <input id=\"hideAmount\" name=\"hideAmount\" type=\"hidden\" value=\"");
	templateBuilder.Append(Utils.ObjectToStr(userModel.amount));
	templateBuilder.Append("\" />\r\n        <input id=\"hideCashrate\" name=\"hideCashrate\" type=\"hidden\" value=\"");
	templateBuilder.Append(Utils.ObjectToStr(uconfig.pointcashrate));
	templateBuilder.Append("\" />\r\n        <form id=\"pointForm\" name=\"pointform\" class=\"form-box\" url=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/submit_ajax.ashx?action=user_point_convert\">\r\n        <div class=\"weui-form-preview\" style=\"margin-top:10px;\">\r\n            <div class=\"weui-form-preview__hd\">\r\n                <div class=\"weui-form-preview__item\">\r\n                    <label class=\"weui-form-preview__label\">账户余额</label>\r\n                    <em class=\"weui-form-preview__value\">¥");
	templateBuilder.Append(Utils.ObjectToStr(userModel.amount));
	templateBuilder.Append("</em>\r\n                </div>\r\n            </div>\r\n            <div class=\"weui-form-preview__bd\">\r\n                <div class=\"weui-form-preview__item\">\r\n                    <label class=\"weui-form-preview__label\">账户积分</label>\r\n                    <span class=\"weui-form-preview__value\">");
	templateBuilder.Append(Utils.ObjectToStr(userModel.point));
	templateBuilder.Append(" 分</span>\r\n                </div>\r\n                <div class=\"weui-form-preview__item\">\r\n                    <label class=\"weui-form-preview__label\">兑换说明</label>\r\n                    <span class=\"weui-form-preview__value\">兑换最少金额为1元，兑换比例：1元等于");
	templateBuilder.Append(Utils.ObjectToStr(uconfig.pointcashrate));
	templateBuilder.Append("积分</span>\r\n                </div>\r\n                ");
	if (uconfig.pointcashrate==0)
	{

	templateBuilder.Append("\r\n                <div class=\"weui-form-preview__item\">\r\n                    <label class=\"weui-form-preview__label\">温馨提示</label>\r\n                    <span class=\"weui-form-preview__value\">目前的积分兑换功能已被关闭！</span>\r\n                </div>\r\n                ");
	}
	else if (userModel.amount<1)
	{

	templateBuilder.Append("\r\n                <div class=\"weui-form-preview__item\">\r\n                    <label class=\"weui-form-preview__label\">温馨提示</label>\r\n                    <span class=\"weui-form-preview__value\">目前您的余额不足，不能使用积分兑换！</span>\r\n                </div>\r\n                ");
	}	//end for if

	templateBuilder.Append("\r\n            </div>\r\n        </div>\r\n        \r\n        ");
	if (uconfig.pointcashrate>0&&userModel.amount>1)
	{

	templateBuilder.Append("\r\n        <div class=\"weui-panel weui-panel_access\">\r\n            <div class=\"weui-panel__hd\">积分兑换</div>\r\n            <div class=\"weui-panel__bd\">\r\n                <div class=\"weui-cells_form form-box\">\r\n                    <div class=\"weui-cell\">\r\n                        <div class=\"weui-cell__hd\">\r\n                            <label class=\"weui-label\">兑换金额</label>\r\n                        </div>\r\n                        <div class=\"weui-cell__bd\">\r\n                            <input id=\"txtAmount\" name=\"txtAmount\" type=\"text\" class=\"weui-input\" placeholder=\"请输入兑换金额\" data-validate=\"n\" />\r\n                        </div>\r\n                    </div>\r\n                    \r\n                    <div class=\"weui-cell\">\r\n                        <div class=\"weui-cell__hd\">\r\n                            <label class=\"weui-label\">登录密码</label>\r\n                        </div>\r\n                        <div class=\"weui-cell__bd\">\r\n                            <input id=\"txtPassword\" name=\"txtPassword\" type=\"password\" class=\"weui-input\" placeholder=\"请输入登录密码\" data-validate=\"password\" />\r\n                        </div>\r\n                    </div>\r\n                    \r\n                </div>\r\n            </div>\r\n        </div>\r\n        <div class=\"weui-btn-area\">\r\n            <input id=\"btnSubmit\" name=\"btnSubmit\" type=\"submit\" class=\"weui-btn weui-btn_primary\" value=\"确认兑换\" />\r\n        </div>\r\n        ");
	}	//end for if

	templateBuilder.Append("\r\n        </form>\r\n        <!--/积分兑换-->\r\n\r\n        ");
	}
	else if (action=="list")
	{

	templateBuilder.Append("\r\n        <!--积分明细-->\r\n        <script type=\"text/javascript\">\r\n            $(function(){\r\n                //选中TAB样式\r\n                $(\".weui-tabbar a\").eq(2).addClass(\"weui-bar__item_on\");\r\n            });\r\n            //删除方法\r\n            function ExecPostBack(checkValue) {\r\n                if (arguments.length == 1) {\r\n                    ExecDelete('");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/submit_ajax.ashx?action=user_point_delete', checkValue, '#turl');\r\n                }else{\r\n                    var valueArr = '';\r\n                    $(\"input[name='checkId']:checked\").each(function(i){\r\n                        valueArr += $(this).val();\r\n                        if(i < $(\"input[name='checkId']:checked\").length - 1){\r\n                            valueArr += \",\"\r\n                        }\r\n                    });\r\n                    ExecDelete('");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/submit_ajax.ashx?action=user_point_delete', valueArr, '#turl');\r\n                }\r\n            }\r\n        </");
	templateBuilder.Append("script>\r\n        \r\n        <div class=\"detail-list\">\r\n            <ul>\r\n                <!--取得一个DataTable-->\r\n                ");
	DataTable pointList = get_user_point_list(20, page, "user_id="+userModel.id, out totalcount);

	templateBuilder.Append("\r\n                <!--取得分页页码列表-->\r\n                ");
	string pagelist = get_page_link(20, page, totalcount, "userpoint", action, "__id__");

	foreach(DataRow dr in pointList.Rows)
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

	if (pointList.Rows.Count==0)
	{

	templateBuilder.Append("\r\n                <div class=\"nodata\">暂无记录...</div>\r\n                ");
	}	//end for if

	templateBuilder.Append("\r\n            </ul>\r\n        </div>\r\n        \r\n        <!--分页页码-->\r\n        <div class=\"page-list\">\r\n            ");
	templateBuilder.Append(Utils.ObjectToStr(pagelist));
	templateBuilder.Append("\r\n        </div>\r\n        <!--/分页页码-->\r\n        \r\n        <input id=\"turl\" type=\"hidden\" value=\"");
	templateBuilder.Append(linkurl("userpoint","list"));

	templateBuilder.Append("\" /><!--存在跳转的URL值-->\r\n        <!--/积分明细-->\r\n        ");
	}	//end for if

	templateBuilder.Append("\r\n    </div>\r\n    \r\n    <!--版权信息-->\r\n    ");

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
	templateBuilder.Append(linkurl("userpoint","convert"));

	templateBuilder.Append("\" class=\"weui-tabbar__item\">\r\n                <i class=\"iconfont icon-point weui-tabbar__icon\"></i>\r\n                <p class=\"weui-tabbar__label\">税分兑换</p>\r\n            </a>\r\n            <a href=\"");
	templateBuilder.Append(linkurl("userpoint","list"));

	templateBuilder.Append("\" class=\"weui-tabbar__item\">\r\n                <i class=\"iconfont icon-log weui-tabbar__icon\"></i>\r\n                <p class=\"weui-tabbar__label\">积分明细</p>\r\n            </a>\r\n        </div>\r\n    </div>\r\n    <!--/底部导航-->\r\n</div>\r\n</body>\r\n</html>\r\n");
	Response.Write(templateBuilder.ToString());
}
</script>
