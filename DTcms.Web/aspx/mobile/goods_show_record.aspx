<%@ Page Language="C#" AutoEventWireup="true" Inherits="DTcms.Web.UI.Page.record_show" ValidateRequest="false" %>
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

	base.channel = "goods";
	base.OnInit(e);
	StringBuilder templateBuilder = new StringBuilder(220000);

	templateBuilder.Append("<!DOCTYPE html>\r\n<!--HTML5 doctype-->\r\n<html>\r\n<head>\r\n<meta charset=\"utf-8\">\r\n<meta name=\"viewport\" content=\"width=device-width,initial-scale=1,user-scalable=0\">\r\n");
	string category_title = get_category_title(model.category_id,"购物商城");

	templateBuilder.Append("\r\n<title>");
	templateBuilder.Append(Utils.ObjectToStr(model.title));
	templateBuilder.Append(" - ");
	templateBuilder.Append(Utils.ObjectToStr(category_title));
	templateBuilder.Append(" - ");
	templateBuilder.Append(Utils.ObjectToStr(site.name));
	templateBuilder.Append("</title>\r\n<meta name=\"keywords\" content=\"");
	templateBuilder.Append(Utils.ObjectToStr(model.seo_keywords));
	templateBuilder.Append("\" />\r\n<meta name=\"description\" content=\"");
	templateBuilder.Append(Utils.ObjectToStr(model.seo_description));
	templateBuilder.Append("\" />\r\n<link rel=\"stylesheet\" type=\"text/css\" href=\"");
	templateBuilder.Append("/templates/mobile");
	templateBuilder.Append("/css/idangerous.swiper.css\" />\r\n<link rel=\"stylesheet\" type=\"text/css\" href=\"");
	templateBuilder.Append("/templates/mobile");
	templateBuilder.Append("/css/style.css\" />\r\n<script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append("/templates/mobile");
	templateBuilder.Append("/js/zepto.min.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append("/templates/mobile");
	templateBuilder.Append("/js/weui.min.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append("/templates/mobile");
	templateBuilder.Append("/js/idangerous.swiper-2.1.min.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append("/templates/mobile");
	templateBuilder.Append("/js/common.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append("/templates/mobile");
	templateBuilder.Append("/js/cart.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\">\r\n	$(document).ready(function(){\r\n		var mySwiper = new Swiper('.swiper-container',{\r\n			calculateHeight:true,\r\n			resizeReInit:true,\r\n			pagination:\".pagination\",\r\n			autoplay:5000,\r\n			paginationClickable:true\r\n		});\r\n        //初始化规格事件\r\n		initGoodsSpec('");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/submit_ajax.ashx?action=get_article_goods_info&channel_id=");
	templateBuilder.Append(Utils.ObjectToStr(model.channel_id));
	templateBuilder.Append("');\r\n\r\n	});\r\n	function saveData()\r\n	{    \r\n	    var prices = $(\"#prices\").val();\r\n	    var trannsform_type = $(\"#trannsform_type\").val();\r\n	    var remarks = $(\"#remarks\").val(); \r\n	    var transform_num = $(\"#transform_num\").val();\r\n	    var aj = $.ajax({\r\n	        url: '");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/submit_ajax.ashx?action=save_goods_record',// 投票\r\n	        type: 'post',\r\n	        data: {\r\n	            'action': 'save_goods_record',\r\n	            'id': getUrlParam(\"id\"),\r\n	            'prices': prices,\r\n	            'trannsform_type': trannsform_type,\r\n	            'transform_num': transform_num,\r\n	            'remarks': remarks\r\n	        },\r\n	        cache: false,\r\n	        dataType: 'json',\r\n	        success: function (data) {\r\n	            if (data.status == \"1\") {\r\n	                alert(\"保存成功\");\r\n	                var t = setTimeout(\"reloadVotemember()\", 1000);\r\n	            } else {\r\n	                debugger;\r\n	                alert(\"异常！\");\r\n	            }\r\n	        },\r\n	        error: function () {\r\n	            // view(\"异常！\");    \r\n	            alert(\"异常！\");\r\n	        }\r\n	    });\r\n	}\r\n	function getUrlParam(name) {\r\n	    // 取得url中?后面的字符\r\n	    var query = window.location.search.substring(1);\r\n	    // 把参数按&拆分成数组\r\n	    var param_arr = query.split(\"&\");\r\n	    for (var i = 0; i < param_arr.length; i++) {\r\n	        var pair = param_arr[i].split(\"=\");\r\n	        if (pair[0] == name) {\r\n	            return pair[1];\r\n	        }\r\n	    }\r\n	    return (false);\r\n	}\r\n\r\n	function reloadVotemember() {\r\n	    window.location.href = \"goods_show_record.aspx?id=");
	templateBuilder.Append(Utils.ObjectToStr(model.id));
	templateBuilder.Append("\";\r\n	}\r\n</");
	templateBuilder.Append("script>\r\n</head>\r\n\r\n<body ontouchstart>\r\n<div class=\"page\">\r\n    <!--页面头部-->\r\n    <div class=\"header\">\r\n        <a class=\"back\" href=\"javascript:history.back();\">\r\n            <i class=\"iconfont icon-arrow-left\"></i>\r\n        </a>\r\n        <h3>记录详情</h3>\r\n        <div class=\"right\"> \r\n            <a class=\"weui-cell_access weui-cell_link\" onclick=\"showDialogBox('#category-box');\">\r\n                <i class=\"iconfont icon-nav\"></i>\r\n            </a>\r\n        </div>\r\n    </div>\r\n    <!--/页面头部-->\r\n  \r\n    <!--页面内容-->\r\n    <div class=\"page__bd\">\r\n        <!--商品幻灯片-->\r\n        <div id=\"slider\" class=\"swiper-container\">\r\n            <div class=\"swiper-wrapper\">\r\n                ");
	if (model.albums!=null)
	{

	foreach(DTcms.Model.article_albums modelt in model.albums)
	{

	templateBuilder.Append("\r\n                <div class=\"swiper-slide\">\r\n                    <img src=\"");
	templateBuilder.Append(Utils.ObjectToStr(modelt.thumb_path));
	templateBuilder.Append("\"/>\r\n                </div>\r\n                ");
	}	//end for if

	}	//end for if

	templateBuilder.Append("\r\n            </div>\r\n            <div class=\"pagination\"></div>\r\n        </div>\r\n        <!--/商品幻灯片-->\r\n        \r\n        <!--商品名称-->\r\n        <div class=\"weui-panel weui-panel_access\" style=\"margin-top:0;\">\r\n            <div class=\"weui-panel__bd\">\r\n                <div class=\"goods-head\">\r\n                    <h2>");
	templateBuilder.Append(Utils.ObjectToStr(model.title));
	templateBuilder.Append("</h2>\r\n                    <p id=\"add_event\" onclick=\"showDialogBox('#record-box');\"><i class=\"icon iconfont icon-edit\" style=\"float: right;height: 30px;\">新增</i></p>\r\n                </div>\r\n            </div>\r\n            \r\n        </div>\r\n        <!--/商品名称-->\r\n       \r\n        ");
	DataTable goodsList = getRecord();

	foreach(DataRow dr in goodsList.Rows)
	{

	templateBuilder.Append("\r\n        <!--商品参数-->\r\n        <div class=\"weui-panel weui-panel_access item-list\">\r\n            <div class=\"weui-panel__hd\">说明:" + Utils.ObjectToStr(dr["remarks"]) + "</div>\r\n            <div class=\"weui-panel__bd\">\r\n                <div class=\"weui-cell weui-cell_access\">\r\n                    <div class=\"weui-cell__bd\">\r\n                        <p>进/出：");
	templateBuilder.Append(getRecordType(Utils.ObjectToStr(dr["trannsform_type"])).ToString());

	templateBuilder.Append("\r\n                        </p>\r\n                    </div>\r\n                </div>\r\n                <div class=\"weui-cell weui-cell_access\">\r\n                    <div class=\"weui-cell__bd\">\r\n                        <span>价格：");
	templateBuilder.Append(getRecordMoney(Utils.ObjectToStr(dr["trannsform_type"]),Utils.ObjectToStr(dr["sale_prices"]),Utils.ObjectToStr(dr["real_prices"])).ToString());

	templateBuilder.Append("</span>\r\n                    </div>\r\n                </div>\r\n                <div class=\"weui-cell weui-cell_access\">\r\n                    <div class=\"weui-cell__bd\">\r\n                        <p>等级时间：" + Utils.ObjectToStr(dr["CreateDate"]) + "</p>\r\n                    </div>\r\n                </div>\r\n            </div>\r\n        </div>\r\n        <!--/商品参数-->\r\n        ");
	}	//end for if

	templateBuilder.Append("\r\n        \r\n    \r\n        <!--版权信息-->\r\n        ");

	templateBuilder.Append("<div class=\"weui-footer footer\">\r\n    <p class=\"weui-footer__text\">");
	templateBuilder.Append(Utils.ObjectToStr(site.copyright));
	templateBuilder.Append("</p>\r\n</div>");


	templateBuilder.Append("\r\n        <!--/版权信息-->\r\n        \r\n       \r\n    </div>\r\n    <!--/页面内容-->\r\n</div>\r\n\r\n<!--类别容器-->\r\n<div id=\"category-box\" class=\"dialog-wrap\">\r\n    <div class=\"dialog-box\">\r\n        <div class=\"header\">\r\n            <a class=\"back\" href=\"javascript:;\" onclick=\"closeDialogBox('#category-box');\">\r\n                <i class=\"iconfont icon-arrow-left\"></i>\r\n            </a>\r\n            <h3>栏目类别</h3>\r\n        </div>\r\n        <ul class=\"navbar\">\r\n            ");
	DataTable categoryList1 = get_category_child_list(channel, 0);

	foreach(DataRow cdr1 in categoryList1.Rows)
	{

	templateBuilder.Append("\r\n            <li>\r\n                <h3><a href=\"");
	templateBuilder.Append(linkurl("news_list",Utils.ObjectToStr(cdr1["id"])));

	templateBuilder.Append("\">" + Utils.ObjectToStr(cdr1["title"]) + "</a></h3> \r\n                <p>\r\n                ");
	DataTable categoryList2 = get_category_child_list(channel, Utils.StrToInt(Utils.ObjectToStr(cdr1["id"]), 0));

	foreach(DataRow cdr2 in categoryList2.Rows)
	{

	if (Utils.StrToInt(Utils.ObjectToStr(cdr2["id"]), 0)==model.category_id)
	{

	templateBuilder.Append("\r\n                    <a href=\"");
	templateBuilder.Append(linkurl("news_list",Utils.ObjectToStr(cdr2["id"])));

	templateBuilder.Append("\" class=\"selected\">" + Utils.ObjectToStr(cdr2["title"]) + "</a>\r\n                    ");
	}
	else
	{

	templateBuilder.Append("\r\n                    <a href=\"");
	templateBuilder.Append(linkurl("news_list",Utils.ObjectToStr(cdr2["id"])));

	templateBuilder.Append("\">" + Utils.ObjectToStr(cdr2["title"]) + "</a>\r\n                    ");
	}	//end for if

	}	//end for if

	templateBuilder.Append("\r\n                </p>\r\n            </li>\r\n            ");
	}	//end for if

	templateBuilder.Append("\r\n        </ul>\r\n    </div>\r\n</div>\r\n<!--类别容器-->\r\n\r\n<!--记录-->\r\n<div id=\"record-box\" class=\"dialog-wrap\">\r\n    <div class=\"dialog-box\">\r\n        <div class=\"header\">\r\n            <a class=\"back\" href=\"javascript:;\" onclick=\"closeDialogBox('#record-box');\">\r\n                <i class=\"iconfont icon-arrow-left\"></i>\r\n            </a>\r\n            <h3>登记</h3>\r\n        </div>\r\n        <ul class=\"navbar\" style=\"font-size:24px\">\r\n            <li><span style=\"padding-left: 30px;\">说明</span>:<spa style=\"padding-left: 30px;\"n><input style=\"height: 28px;\" type=\"text\" id=\"remarks\" /></span></li>\r\n            <li><span style=\"padding-left: 30px;\">进/出</span>:\r\n            <span style=\"padding-left: 12px;\">\r\n                <select id=\"trannsform_type\">\r\n                    <option value=\"1\">进</option>\r\n                    <option value=\"0\">出</option>\r\n                </select>\r\n            </span>\r\n            </li>\r\n            <li><span style=\"padding-left: 30px;\">数量</span>:<span style=\"padding-left: 30px;\"><input style=\"height: 28px;\"  type=\"text\" id=\"transform_num\" /></span></li>\r\n            <li><span style=\"padding-left: 30px;\">费用</span>:<span style=\"padding-left: 30px;\"><input style=\"height: 28px;\"  type=\"text\" id=\"prices\" /></span></li>\r\n            <li><center><input type=\"submit\" id=\"remarks\" onclick=\"saveData();\" /></center></li>\r\n        </ul>\r\n    </div>\r\n</div>\r\n<!--类别容器-->\r\n\r\n</body>\r\n</html>\r\n");
	Response.Write(templateBuilder.ToString());
}
</script>
