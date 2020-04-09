<%@ Page Language="C#" AutoEventWireup="true" Inherits="DTcms.Web.UI.Page.article_list" ValidateRequest="false" %>
<%@ Import namespace="System.Collections.Generic" %>
<%@ Import namespace="System.Text" %>
<%@ Import namespace="System.Data" %>
<%@ Import namespace="DTcms.Common" %>

<script runat="server">
override protected void OnInit(EventArgs e)
{

	/* 
		This page was created by DTcms Template Engine at 2020/3/31 20:02:53.
		本页面代码由DTcms模板引擎生成于 2020/3/31 20:02:53. 
	*/

	base.channel = "goods";
	base.OnInit(e);
	StringBuilder templateBuilder = new StringBuilder(220000);
	const int pagesize = 20;

	templateBuilder.Append("<!doctype html>\r\n<html>\r\n<head>\r\n<meta charset=\"utf-8\">\r\n<title>");
	templateBuilder.Append(Utils.ObjectToStr(model.title));
	templateBuilder.Append(" - ");
	templateBuilder.Append(Utils.ObjectToStr(site.name));
	templateBuilder.Append("</title>\r\n<meta name=\"keywords\" content=\"");
	templateBuilder.Append(Utils.ObjectToStr(model.seo_keywords));
	templateBuilder.Append("\" />\r\n<meta name=\"description\" content=\"");
	templateBuilder.Append(Utils.ObjectToStr(model.seo_description));
	templateBuilder.Append("\" />\r\n<link rel=\"stylesheet\" type=\"text/css\" href=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("css/pagination.css\" />\r\n<link rel=\"stylesheet\" type=\"text/css\" href=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/css/style.css\" />\r\n<script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("scripts/jquery/jquery-1.11.2.min.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/js/jquery.flexslider-min.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/js/common.js\"></");
	templateBuilder.Append("script>\r\n</head>\r\n\r\n<body id=\"goods\">\r\n<!--页面头部-->\r\n");

	templateBuilder.Append("<div class=\"header\">\r\n    <div class=\"head-top\">\r\n        <div class=\"section\">\r\n            <div class=\"left-box\">\r\n                <span>网站链接：</span>\r\n                <a target=\"_blank\" href=\"/\">东营创新创业服务平台</a>                \r\n            </div>\r\n            <script type=\"text/javascript\">\r\n                $.ajax({\r\n                    type: \"POST\",\r\n                    url: \"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/submit_ajax.ashx?action=user_check_login\",\r\n                    dataType: \"json\",\r\n                    timeout: 20000,\r\n                    success: function (data, textStatus) {\r\n                        if (data.status == 1) {\r\n                            $(\"#hbbd_menu\").prepend('<a href=\"");
	templateBuilder.Append(linkurl("usercenter","index"));

	templateBuilder.Append("\">我的账户</a>');\r\n                            $(\"#hbbd_menu\").prepend('<a href=\"");
	templateBuilder.Append(linkurl("usercenter","exit"));

	templateBuilder.Append("\">退出</a>');                            \r\n                        } else {\r\n                            $(\"#hbbd_menu\").prepend('<a href=\"");
	templateBuilder.Append(linkurl("login"));

	templateBuilder.Append("\">登录</a>');\r\n                            $(\"#hbbd_menu\").prepend('<a href=\"");
	templateBuilder.Append(linkurl("register"));

	templateBuilder.Append("\">注册</a>');                            \r\n                        }\r\n                    }\r\n                });\r\n            </");
	templateBuilder.Append("script>\r\n            <div id=\"menu\" class=\"right-box\">\r\n                <a href=\"");
	templateBuilder.Append(linkurl("content","contact"));

	templateBuilder.Append("\"><i class=\"iconfont icon-phone\"></i>联系我们</a>                \r\n            </div>\r\n        </div>\r\n    </div>\r\n    <div class=\"head-body\">\r\n        <div class=\"head-body-div\">\r\n            <div class=\"head-body-div-div1\">\r\n            </div>\r\n            <div class=\"head-body-div-div2\">\r\n                <div class=\"hbbd_search\">\r\n                    <div class=\"hbbd_search_txt\">\r\n                        <input id=\"keywords\" name=\"keywords\" type=\"text\" onkeydown=\"if(event.keyCode==13){SiteSearch('");
	templateBuilder.Append(linkurl("search"));

	templateBuilder.Append("', '#keywords');return false};\" placeholder=\"输入关健字\" x-webkit-speech=\"\" />\r\n                    </div>\r\n                    <div class=\"hbbd_search_bt\">\r\n                        <a href=\"javascript:;\" onclick=\"SiteSearch('");
	templateBuilder.Append(linkurl("search"));

	templateBuilder.Append("', '#keywords');\">                            \r\n                        </a>\r\n                    </div>\r\n                </div>\r\n            </div>\r\n            <div class=\"head-body-div-div3\">\r\n                <div class=\"hbbd_menu\" id=\"hbbd_menu\">\r\n                    \r\n                </div>\r\n            </div>\r\n        </div>\r\n    </div>\r\n    <div class=\"head-nav-div\">\r\n        <div class=\"nav-box2\">\r\n            <ul>\r\n                <li class=\"top_a\"><a href=\"");
	templateBuilder.Append(linkurl("index"));

	templateBuilder.Append("\">网站首页</a></li>\r\n                <li class=\"top_a\"><a href=\"");
	templateBuilder.Append(linkurl("news"));

	templateBuilder.Append("\">创业资讯</a></li>\r\n                <li class=\"top_a\"><a href=\"#\">创想邦</a></li>\r\n                <li class=\"top_a\"><a href=\"#\">公共服务</a></li>\r\n                <li class=\"top_a\"><a href=\"#\">创新地图</a></li>\r\n                <li class=\"top_a\"><a href=\"#\">创客驿站</a></li>\r\n                <li class=\"top_a\"><a href=\"#\">双创政策</a></li>\r\n                <li class=\"top_a\"><a href=\"#\">项目申报</a></li>\r\n                <li class=\"top_a\"><a href=\"#\">创新学院</a></li>\r\n                <li class=\"top_a\"><a href=\"#\">动态展示</a></li>                \r\n            </ul>\r\n        </div>\r\n    </div>    \r\n</div>");


	templateBuilder.Append("\r\n<!--/页面头部-->\r\n\r\n<!--当前位置-->\r\n");
	string category_nav = get_category_menu("goods_list", category_id);

	templateBuilder.Append("\r\n<div class=\"section\">\r\n    <div class=\"location\">\r\n        <span>当前位置：</span>\r\n        <a href=\"");
	templateBuilder.Append(linkurl("index"));

	templateBuilder.Append("\">首页</a> &gt;\r\n        <a href=\"");
	templateBuilder.Append(linkurl("goods"));

	templateBuilder.Append("\">购物商城</a>\r\n        ");
	templateBuilder.Append(Utils.ObjectToStr(category_nav));
	templateBuilder.Append("\r\n    </div>\r\n</div>\r\n<!--/当前位置-->\r\n\r\n<!--/分类导航-->\r\n<div class=\"section\">\r\n    <div class=\"wrapper clearfix\">\r\n        <div class=\"screen-box\">\r\n            <!--分类-->\r\n            <dl>\r\n                <dt>分类：</dt>\r\n                <dd>\r\n                ");
	if (category_id==0)
	{

	templateBuilder.Append("\r\n                    <a class=\"selected\" href=\"");
	templateBuilder.Append(linkurl("gsearch"));

	templateBuilder.Append("\">全部</a>\r\n                ");
	}
	else
	{

	templateBuilder.Append("\r\n                    <a href=\"");
	templateBuilder.Append(linkurl("gsearch"));

	templateBuilder.Append("\">全部</a>\r\n                ");
	}	//end for if

	DataTable categoryList = get_category_child_list(channel,0);

	foreach(DataRow cdr in categoryList.Rows)
	{

	if (category_id==Utils.StrToInt(Utils.ObjectToStr(cdr["id"]), 0))
	{

	templateBuilder.Append("\r\n                        <a class=\"selected\" href=\"");
	templateBuilder.Append(linkurl("gsearch","?category_id="+Utils.ObjectToStr(cdr["id"])));

	templateBuilder.Append("\">" + Utils.ObjectToStr(cdr["title"]) + "</a>\r\n                    ");
	}
	else
	{

	templateBuilder.Append("\r\n                        <a href=\"");
	templateBuilder.Append(linkurl("gsearch","?category_id="+Utils.ObjectToStr(cdr["id"])));

	templateBuilder.Append("\">" + Utils.ObjectToStr(cdr["title"]) + "</a>\r\n                    ");
	}	//end for if

	}	//end for if

	templateBuilder.Append("\r\n                </dd>\r\n            </dl>\r\n            <!--/分类-->\r\n            \r\n            <!--规格-->\r\n            ");
	DataTable specList = get_article_category_spec(model.id);

	foreach(DataRow dr1 in specList.Rows)
	{

	templateBuilder.Append("\r\n            <dl>\r\n                <dt>" + Utils.ObjectToStr(dr1["title"]) + "：</dt>\r\n                <dd>\r\n                    ");
	DataTable subList = get_article_spec_child(Utils.StrToInt(Utils.ObjectToStr(dr1["id"]), 0));

	templateBuilder.Append("\r\n                    <a class=\"selected\" href=\"");
	templateBuilder.Append(linkurl("gsearch"));

	templateBuilder.Append("\">全部</a>\r\n                    ");
	foreach(DataRow dr2 in subList.Rows)
	{

	templateBuilder.Append("\r\n                        <a href=\"");
	templateBuilder.Append(linkurl("gsearch","?category_id="+category_id+"&s_"+Utils.ObjectToStr(dr1["id"])+"="+Utils.ObjectToStr(dr2["id"])));

	templateBuilder.Append("\">" + Utils.ObjectToStr(dr2["title"]) + "</a>\r\n                    ");
	}	//end for if

	templateBuilder.Append("\r\n                </dd>\r\n            </dl>\r\n            ");
	}	//end for if

	templateBuilder.Append("\r\n            <!--/规格-->\r\n            \r\n            <!--价格-->\r\n            <dl>\r\n                <dt>价格：</dt>\r\n                <dd>\r\n                    <a class=\"selected\" href=\"");
	templateBuilder.Append(linkurl("gsearch"));

	templateBuilder.Append("\">全部</a>\r\n                    <a href=\"");
	templateBuilder.Append(linkurl("gsearch","?category_id="+category_id+"&min_price=0&max_price=100"));

	templateBuilder.Append("\">0-100元</a>\r\n                    <a href=\"");
	templateBuilder.Append(linkurl("gsearch","?category_id="+category_id+"&min_price=101&max_price=500"));

	templateBuilder.Append("\">101-500元</a>\r\n                    <a href=\"");
	templateBuilder.Append(linkurl("gsearch","?category_id="+category_id+"&min_price=501&max_price=1000"));

	templateBuilder.Append("\">501-1000元</a>\r\n                    <a href=\"");
	templateBuilder.Append(linkurl("gsearch","?category_id="+category_id+"&min_price=1001&max_price=2000"));

	templateBuilder.Append("\">1001-2000元</a>\r\n                    <a href=\"");
	templateBuilder.Append(linkurl("gsearch","?category_id="+category_id+"&min_price=2000"));

	templateBuilder.Append("\">2000以上</a>\r\n                </dd>\r\n            </dl>\r\n            <!--/价格-->\r\n        </div>\r\n        \r\n        <div class=\"sort-box\">\r\n            <a class=\"first selected\" href=\"");
	templateBuilder.Append(linkurl("gsearch","?category_id="+category_id+"&orderby=time"));

	templateBuilder.Append("\">上架时间</a>\r\n            <a href=\"");
	templateBuilder.Append(linkurl("gsearch","?category_id="+category_id+"&orderby=click"));

	templateBuilder.Append("\">按人气</a>\r\n            <a href=\"");
	templateBuilder.Append(linkurl("gsearch","?category_id="+category_id+"&orderby=max"));

	templateBuilder.Append("\">价格从高到低</a>\r\n            <a href=\"");
	templateBuilder.Append(linkurl("gsearch","?category_id="+category_id+"&orderby=min"));

	templateBuilder.Append("\">价格从低到高</a>\r\n        </div>\r\n    \r\n    </div>\r\n</div>\r\n<!--/分类导航-->\r\n\r\n<!--商品列表-->\r\n<div class=\"section\">\r\n    <div class=\"wrapper clearfix\">\r\n        <ul class=\"img-list\">\r\n        <!--取得一个分页DataTable-->\r\n        ");
	DataTable goodsList = get_article_list(channel, category_id, pagesize, page, "status=0", out totalcount, out pagelist, "goods_list", category_id, "__id__");

	foreach(DataRow dr in goodsList.Rows)
	{

	templateBuilder.Append("\r\n            <li>\r\n                <a href=\"");
	templateBuilder.Append(linkurl("goods_show",Utils.ObjectToStr(dr["id"])));

	templateBuilder.Append("\">\r\n                    <div class=\"img-box\">\r\n                        ");
	if (Utils.ObjectToStr(dr["is_red"])=="1")
	{

	templateBuilder.Append("\r\n                            <div class=\"abs-txt\">推荐</div>\r\n                        ");
	}	//end for if

	templateBuilder.Append("\r\n                        <img src=\"" + Utils.ObjectToStr(dr["img_url"]) + "\" />\r\n                    </div>\r\n                    <div class=\"info\">\r\n                        <h3>" + Utils.ObjectToStr(dr["title"]) + "</h3>\r\n                        <p class=\"price\"><b>¥" + Utils.ObjectToStr(dr["sell_price"]) + "</b>元</p>\r\n                        <p>\r\n                            <strong>库存 " + Utils.ObjectToStr(dr["stock_quantity"]) + "</strong>\r\n                            <span>市场价：<s>" + Utils.ObjectToStr(dr["market_price"]) + "</s></span>\r\n                        </p>\r\n                    </div>\r\n                </a>\r\n            </li>\r\n        ");
	}	//end for if

	templateBuilder.Append("\r\n        </ul>\r\n        \r\n        <!--页码列表-->\r\n        <div class=\"page-box\" style=\"margin:15px 0 0;\">\r\n            <div class=\"digg\">");
	templateBuilder.Append(Utils.ObjectToStr(pagelist));
	templateBuilder.Append("</div>\r\n        </div>\r\n        <!--/页码列表-->\r\n    </div>\r\n\r\n</div>\r\n<!--/商品列表-->\r\n\r\n<!--页面底部-->\r\n");

	templateBuilder.Append("<div class=\"footer\">\r\n    <div class=\"section\">        \r\n        <div class=\"foot-box\">\r\n            <div class=\"copyright\">\r\n                <p>版权所有 ");
	templateBuilder.Append(Utils.ObjectToStr(site.company));
	templateBuilder.Append(" ");
	templateBuilder.Append(Utils.ObjectToStr(site.crod));
	templateBuilder.Append("</p>\r\n                <p>公司地址：");
	templateBuilder.Append(Utils.ObjectToStr(site.address));
	templateBuilder.Append(" 联系电话：");
	templateBuilder.Append(Utils.ObjectToStr(site.tel));
	templateBuilder.Append("</p>\r\n                <p class=\"gray\">Copyright © 2009-2017 dycxpt.com Corporation,All Rights Reserved.</p>\r\n            </div>\r\n            <div class=\"service\">\r\n                <p>东营创新创业服务平台</p>                \r\n            </div>\r\n        </div>\r\n    </div>\r\n</div>");


	templateBuilder.Append("\r\n<!--/页面底部-->\r\n</body>\r\n</html>");
	Response.Write(templateBuilder.ToString());
}
</script>
