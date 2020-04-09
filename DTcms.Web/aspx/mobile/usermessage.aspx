<%@ Page Language="C#" AutoEventWireup="true" Inherits="DTcms.Web.UI.Page.usermessage" ValidateRequest="false" %>
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

	templateBuilder.Append("<!DOCTYPE html>\r\n<!--HTML5 doctype-->\r\n<html>\r\n<head>\r\n<meta charset=\"utf-8\">\r\n<meta name=\"viewport\" content=\"width=device-width,initial-scale=1,user-scalable=0\">\r\n<title>站内短信息 - ");
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
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\">\r\n	function ExecPostBack(checkValue) {\r\n		if (arguments.length == 1) {\r\n			ExecDelete('");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/submit_ajax.ashx?action=user_message_delete', checkValue, '#turl');\r\n		}else{\r\n			var valueArr = '';\r\n			$(\"input[name='checkId']:checked\").each(function(i){\r\n				valueArr += $(this).val();\r\n				if(i < $(\"input[name='checkId']:checked\").length - 1){\r\n					valueArr += \",\"\r\n				}\r\n			});\r\n			ExecDelete('");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/submit_ajax.ashx?action=user_message_delete', valueArr, '#turl');\r\n		}\r\n    }\r\n</");
	templateBuilder.Append("script>\r\n</head>\r\n\r\n<body ontouchstart>\r\n<div class=\"page\">\r\n    <!--页面头部-->\r\n    <div class=\"header\">\r\n        <a class=\"back\" href=\"javascript:history.back();\">\r\n            <i class=\"iconfont icon-arrow-left\"></i>\r\n        </a>\r\n        <h3>站内短消息</h3>\r\n        <div class=\"right\"> \r\n            <a class=\"weui-cell_access weui-cell_link\" href=\"");
	templateBuilder.Append(linkurl("usercenter","index"));

	templateBuilder.Append("\">\r\n                <i class=\"iconfont icon-user\"></i>\r\n            </a>\r\n        </div>\r\n    </div>\r\n    <!--/页面头部-->\r\n    \r\n    <div class=\"page__bd\">\r\n\r\n        ");
	if (action=="add")
	{

	templateBuilder.Append("\r\n        <!--发送消息-->\r\n        <link rel=\"stylesheet\" type=\"text/css\" href=\"");
	templateBuilder.Append("/templates/mobile");
	templateBuilder.Append("/css/validate.css\" />\r\n        <script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append("/templates/mobile");
	templateBuilder.Append("/js/mvalidate.js\"></");
	templateBuilder.Append("script>\r\n        <script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append("/templates/mobile");
	templateBuilder.Append("/js/mvalidate-extend.js\"></");
	templateBuilder.Append("script>\r\n        <script type=\"text/javascript\">\r\n            $(function(){\r\n                //初始化表单\r\n                AjaxInitForm('#addForm', '#btnSubmit', 1, '#turl');\r\n                //选中TAB样式\r\n                $(\".weui-tabbar a\").eq(0).addClass(\"weui-bar__item_on\");\r\n            });\r\n        </");
	templateBuilder.Append("script>\r\n        <form id=\"addForm\" name=\"addForm\" url=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/submit_ajax.ashx?action=user_message_add\">\r\n        <div class=\"weui-panel weui-panel_access\" style=\"margin-top:10px;\">\r\n            <div class=\"weui-panel__hd\">发送消息</div>\r\n            <div class=\"weui-panel__bd\">\r\n                <div class=\"weui-cells_form form-box\">\r\n                    <div class=\"weui-cell\">\r\n                        <div class=\"weui-cell__hd\">\r\n                            <label class=\"weui-label\">收件人</label>\r\n                        </div>\r\n                        <div class=\"weui-cell__bd\">\r\n                            <input id=\"txtUserName\" name=\"txtUserName\" class=\"weui-input\" type=\"text\" placeholder=\"收件人用户名\" data-validate=\"username\" />\r\n                        </div>\r\n                    </div>\r\n                    <div class=\"weui-cell\">\r\n                        <div class=\"weui-cell__hd\">\r\n                            <label class=\"weui-label\">标题</label>\r\n                        </div>\r\n                        <div class=\"weui-cell__bd\">\r\n                            <input id=\"txtTitle\" name=\"txtTitle\" class=\"weui-input\" type=\"text\" placeholder=\"请输入标题\" data-validate=\"s\" />\r\n                        </div>\r\n                    </div>\r\n                    <div class=\"weui-cell\">\r\n                        <div class=\"weui-cell__bd\">\r\n                            <textarea name=\"txtContent\" class=\"weui-textarea\" placeholder=\"请输入内容\" rows=\"3\"></textarea>\r\n                        </div>\r\n                    </div>\r\n                    <div class=\"weui-cell\">\r\n                        <div class=\"weui-cell__hd\">\r\n                            <label class=\"weui-label\">验证码</label>\r\n                        </div>\r\n                        <div class=\"weui-cell__bd\">\r\n                            <input id=\"txtCode\" name=\"txtCode\" class=\"weui-input\" type=\"text\" placeholder=\"请输入验证码\" data-validate=\"code\" />\r\n                        </div>\r\n                        <div class=\"weui-cell__ft\">\r\n                            <a href=\"javascript:;\" onclick=\"ToggleCode(this, '");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/verify_code.ashx');return false;\">\r\n                            <img class=\"weui-vcode-img\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/verify_code.ashx\" style=\"width:82px;height:24px;\" />\r\n                            </a>\r\n                        </div>\r\n                    </div>\r\n                </div>\r\n            </div>\r\n        </div>\r\n        \r\n        <div class=\"weui-panel weui-panel_access\">\r\n            <div class=\"weui-panel__bd\">\r\n                <div class=\"weui-cells_form form-box\">\r\n                    <div class=\"weui-cell weui-cell_switch\">\r\n                        <div class=\"weui-cell__bd\">保存到发件箱</div>\r\n                        <div class=\"weui-cell__ft\">\r\n                            <input id=\"sendSave\" name=\"sendSave\" type=\"checkbox\" class=\"weui-switch\" value=\"true\" checked=\"checked\" />\r\n                        </div>\r\n                    </div>\r\n                </div>\r\n            </div>\r\n        </div>\r\n        \r\n        <div class=\"weui-btn-area\">\r\n            <input id=\"btnSubmit\" name=\"btnSubmit\" type=\"submit\" class=\"weui-btn weui-btn_primary\" value=\"确认发送\" />\r\n        </div>\r\n        </form>\r\n        <!--发送消息-->\r\n\r\n        ");
	}
	else if (action=="system")
	{

	templateBuilder.Append("\r\n        <!--系统消息-->\r\n        <script type=\"text/javascript\">\r\n            $(function(){\r\n                //选中TAB样式\r\n                $(\".weui-tabbar a\").eq(1).addClass(\"weui-bar__item_on\");\r\n            });\r\n        </");
	templateBuilder.Append("script>\r\n        \r\n        <div class=\"detail-list\">\r\n            <ul>\r\n                <!--取得一个DataTable-->\r\n                ");
	DataTable messageList = get_user_message_list(10, page, "accept_user_name='"+userModel.user_name+"' and type=1", out totalcount);

	templateBuilder.Append("\r\n                <!--取得分页页码列表-->\r\n                ");
	string pagelist = get_page_link(10, page, totalcount, "usermessage", action, "__id__");

	foreach(DataRow dr in messageList.Rows)
	{

	templateBuilder.Append("\r\n                <li>\r\n                    <div class=\"detail-bd\">\r\n                        <div class=\"list-box\">\r\n                            <div class=\"txt-box\">\r\n                                <h2>" + Utils.ObjectToStr(dr["title"]) + "</h2>\r\n                                <p class=\"note\">\r\n                                    <span class=\"fr\">\r\n                                        ");
	if (Utils.ObjectToStr(dr["is_read"])=="1")
	{

	templateBuilder.Append("\r\n                                            已读\r\n                                        ");
	}
	else
	{

	templateBuilder.Append("\r\n                                            未读\r\n                                        ");
	}	//end for if

	templateBuilder.Append("\r\n                                    </span>\r\n                                    <span>" + Utils.ObjectToStr(dr["post_time"]) + "</span>\r\n                                </p>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    <div class=\"detail-ft\">\r\n                        <div class=\"ft-btn\">\r\n                            <div class=\"btn-box\">\r\n                                <a href=\"");
	templateBuilder.Append(linkurl("usermessage_show",Utils.ObjectToStr(dr["id"])));

	templateBuilder.Append("\">查看详情</a>\r\n                                <a href=\"javascript:;\" onclick=\"ExecPostBack('" + Utils.ObjectToStr(dr["id"]) + "');\">\r\n                                    <i class=\"iconfont icon-delete\"></i>\r\n                                    删除\r\n                                </a>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                </li>\r\n                ");
	}	//end for if

	if (messageList.Rows.Count==0)
	{

	templateBuilder.Append("\r\n                <div class=\"nodata\">暂无记录...</div>\r\n                ");
	}	//end for if

	templateBuilder.Append("\r\n            </ul>\r\n        </div>\r\n        \r\n        <!--分页页码-->\r\n        <div class=\"page-list\">\r\n            ");
	templateBuilder.Append(Utils.ObjectToStr(pagelist));
	templateBuilder.Append("\r\n        </div>\r\n        <!--/分页页码-->\r\n        \r\n        <input id=\"turl\" type=\"hidden\" value=\"");
	templateBuilder.Append(linkurl("usermessage","system"));

	templateBuilder.Append("\" /><!--存在跳转的URL值-->\r\n        <!--/系统消息-->\r\n        \r\n        ");
	}
	else if (action=="accept")
	{

	templateBuilder.Append("\r\n        <!--收件箱-->\r\n        <script type=\"text/javascript\">\r\n            $(function(){\r\n                //选中TAB样式\r\n                $(\".weui-tabbar a\").eq(2).addClass(\"weui-bar__item_on\");\r\n            });\r\n        </");
	templateBuilder.Append("script>\r\n        \r\n        <div class=\"detail-list\">\r\n            <ul>\r\n                <!--取得一个DataTable-->\r\n                ");
	DataTable messageList = get_user_message_list(10, page, "accept_user_name='"+userModel.user_name+"' and type=2", out totalcount);

	templateBuilder.Append("\r\n                <!--取得分页页码列表-->\r\n                ");
	string pagelist = get_page_link(10, page, totalcount, "usermessage", action, "__id__");

	foreach(DataRow dr in messageList.Rows)
	{

	templateBuilder.Append("\r\n                <li>\r\n                    <div class=\"detail-bd\">\r\n                        <div class=\"list-box\">\r\n                            <div class=\"img-box\">\r\n                                ");
	string user_avatar = get_user_avatar(Utils.ObjectToStr(dr["post_user_name"]));

	if (user_avatar=="")
	{

	templateBuilder.Append("\r\n                                <i class=\"iconfont icon-user-full\"></i>\r\n                                ");
	}
	else
	{

	templateBuilder.Append("\r\n                                <img src=\"");
	templateBuilder.Append(Utils.ObjectToStr(user_avatar));
	templateBuilder.Append("\" alt=\"" + Utils.ObjectToStr(dr["post_user_name"]) + "\" />\r\n                                ");
	}	//end for if

	templateBuilder.Append("\r\n                            </div>\r\n                            <div class=\"txt-box\">\r\n                                <h2>" + Utils.ObjectToStr(dr["title"]) + "</h2>\r\n                                <p>发件人 " + Utils.ObjectToStr(dr["post_user_name"]) + "</p>\r\n                                <p class=\"note\">\r\n                                    <span class=\"fr\">\r\n                                        ");
	if (Utils.ObjectToStr(dr["is_read"])=="1")
	{

	templateBuilder.Append("\r\n                                            已读\r\n                                        ");
	}
	else
	{

	templateBuilder.Append("\r\n                                            未读\r\n                                        ");
	}	//end for if

	templateBuilder.Append("\r\n                                    </span>\r\n                                    <span>" + Utils.ObjectToStr(dr["post_time"]) + "</span>\r\n                                </p>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    <div class=\"detail-ft\">\r\n                        <div class=\"ft-btn\">\r\n                            <div class=\"btn-box\">\r\n                                <a href=\"");
	templateBuilder.Append(linkurl("usermessage_show",Utils.ObjectToStr(dr["id"])));

	templateBuilder.Append("\">查看详情</a>\r\n                                <a href=\"javascript:;\" onclick=\"ExecPostBack('" + Utils.ObjectToStr(dr["id"]) + "');\">\r\n                                    <i class=\"iconfont icon-delete\"></i>\r\n                                    删除\r\n                                </a>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                </li>\r\n                ");
	}	//end for if

	if (messageList.Rows.Count==0)
	{

	templateBuilder.Append("\r\n                <div class=\"nodata\">暂无记录...</div>\r\n                ");
	}	//end for if

	templateBuilder.Append("\r\n            </ul>\r\n        </div>\r\n        \r\n        <!--分页页码-->\r\n        <div class=\"page-list\">\r\n            ");
	templateBuilder.Append(Utils.ObjectToStr(pagelist));
	templateBuilder.Append("\r\n        </div>\r\n        <!--/分页页码-->\r\n        \r\n        <input id=\"turl\" type=\"hidden\" value=\"");
	templateBuilder.Append(linkurl("usermessage","accept"));

	templateBuilder.Append("\" /><!--存在跳转的URL值-->\r\n        <!--/收件箱-->\r\n        \r\n        ");
	}
	else if (action=="send")
	{

	templateBuilder.Append("\r\n        <!--发件箱-->\r\n        <script type=\"text/javascript\">\r\n            $(function(){\r\n                //选中TAB样式\r\n                $(\".weui-tabbar a\").eq(3).addClass(\"weui-bar__item_on\");\r\n            });\r\n        </");
	templateBuilder.Append("script>\r\n        \r\n        <div class=\"detail-list\">\r\n            <ul>\r\n                <!--取得一个DataTable-->\r\n                ");
	DataTable messageList = get_user_message_list(10, page, "accept_user_name='"+userModel.user_name+"' and type=3", out totalcount);

	templateBuilder.Append("\r\n                <!--取得分页页码列表-->\r\n                ");
	string pagelist = get_page_link(10, page, totalcount, "usermessage", action, "__id__");

	foreach(DataRow dr in messageList.Rows)
	{

	templateBuilder.Append("\r\n                <li>\r\n                    <div class=\"detail-bd\">\r\n                        <div class=\"list-box\">\r\n                            <div class=\"img-box\">\r\n                                ");
	string user_avatar = get_user_avatar(Utils.ObjectToStr(dr["accept_user_name"]));

	if (user_avatar=="")
	{

	templateBuilder.Append("\r\n                                <i class=\"iconfont icon-user-full\"></i>\r\n                                ");
	}
	else
	{

	templateBuilder.Append("\r\n                                <img src=\"");
	templateBuilder.Append(Utils.ObjectToStr(user_avatar));
	templateBuilder.Append("\" alt=\"" + Utils.ObjectToStr(dr["post_user_name"]) + "\" />\r\n                                ");
	}	//end for if

	templateBuilder.Append("\r\n                            </div>\r\n                            <div class=\"txt-box\">\r\n                                <h2>" + Utils.ObjectToStr(dr["title"]) + "</h2>\r\n                                <p>收件人 " + Utils.ObjectToStr(dr["accept_user_name"]) + "</p>\r\n                                <p>" + Utils.ObjectToStr(dr["post_time"]) + "</p>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    <div class=\"detail-ft\">\r\n                        <div class=\"ft-btn\">\r\n                            <div class=\"btn-box\">\r\n                                <a href=\"");
	templateBuilder.Append(linkurl("usermessage_show",Utils.ObjectToStr(dr["id"])));

	templateBuilder.Append("\">查看详情</a>\r\n                                <a href=\"javascript:;\" onclick=\"ExecPostBack('" + Utils.ObjectToStr(dr["id"]) + "');\">\r\n                                    <i class=\"iconfont icon-delete\"></i>\r\n                                    删除\r\n                                </a>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                </li>\r\n                ");
	}	//end for if

	if (messageList.Rows.Count==0)
	{

	templateBuilder.Append("\r\n                <div class=\"nodata\">暂无记录...</div>\r\n                ");
	}	//end for if

	templateBuilder.Append("\r\n            </ul>\r\n        </div>\r\n        \r\n        <!--分页页码-->\r\n        <div class=\"page-list\">\r\n            ");
	templateBuilder.Append(Utils.ObjectToStr(pagelist));
	templateBuilder.Append("\r\n        </div>\r\n        <!--/分页页码-->\r\n        \r\n        <input id=\"turl\" type=\"hidden\" value=\"");
	templateBuilder.Append(linkurl("usermessage","send"));

	templateBuilder.Append("\" /><!--存在跳转的URL值-->\r\n        <!--/发件箱-->\r\n        ");
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
	templateBuilder.Append(linkurl("usermessage","add"));

	templateBuilder.Append("\" class=\"weui-tabbar__item\">\r\n                <i class=\"iconfont icon-edit weui-tabbar__icon\"></i>\r\n                <p class=\"weui-tabbar__label\">发送消息</p>\r\n            </a>\r\n            <a href=\"");
	templateBuilder.Append(linkurl("usermessage","system"));

	templateBuilder.Append("\" class=\"weui-tabbar__item\">\r\n                <i class=\"iconfont icon-notice weui-tabbar__icon\"></i>\r\n                <p class=\"weui-tabbar__label\">系统消息</p>\r\n            </a>\r\n            <a href=\"");
	templateBuilder.Append(linkurl("usermessage","accept"));

	templateBuilder.Append("\" class=\"weui-tabbar__item\">\r\n                <i class=\"iconfont icon-folder weui-tabbar__icon\"></i>\r\n                <p class=\"weui-tabbar__label\">收件箱</p>\r\n            </a>\r\n            <a href=\"");
	templateBuilder.Append(linkurl("usermessage","send"));

	templateBuilder.Append("\" class=\"weui-tabbar__item\">\r\n                <i class=\"iconfont icon-log weui-tabbar__icon\"></i>\r\n                <p class=\"weui-tabbar__label\">发件箱</p>\r\n            </a>\r\n        </div>\r\n    </div>\r\n    <!--/底部导航-->\r\n</div>\r\n</body>\r\n</html>\r\n");
	Response.Write(templateBuilder.ToString());
}
</script>
