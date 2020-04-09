<%@ Page Language="C#" AutoEventWireup="true" Inherits="DTcms.Web.UI.Page.index" ValidateRequest="false" %>
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

	templateBuilder.Append("<!DOCTYPE html>\r\n<!--HTML5 doctype-->\r\n<html>\r\n<head>\r\n<meta charset=\"utf-8\">\r\n<meta name=\"viewport\" content=\"width=device-width,initial-scale=1,user-scalable=0\">\r\n<title>");
	templateBuilder.Append(Utils.ObjectToStr(site.seo_title));
	templateBuilder.Append("</title>\r\n<meta name=\"keywords\" content=\"");
	templateBuilder.Append(Utils.ObjectToStr(site.seo_keyword));
	templateBuilder.Append("\" />\r\n<meta name=\"description\" content=\"");
	templateBuilder.Append(Utils.ObjectToStr(site.seo_description));
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
	templateBuilder.Append("/js/common.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append("/templates/mobile");
	templateBuilder.Append("/js/idangerous.swiper-2.1.min.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\">\r\n    $(document).ready(function(){\r\n        //初始化幻灯片\r\n        var mySwiper = new Swiper('.swiper-container',{\r\n            calculateHeight:true,\r\n            resizeReInit:true,\r\n            pagination:\".pagination\",\r\n            autoplay:5000,\r\n            paginationClickable:true\r\n        });\r\n        //选中Tab\r\n        $(\".weui-tabbar a\").eq(0).addClass(\"weui-bar__item_on\");\r\n    });\r\n</");
	templateBuilder.Append("script>\r\n</head>\r\n\r\n<body ontouchstart>\r\n<div class=\"page\">\r\n    <!--页面头部-->\r\n    ");

	templateBuilder.Append("    <div class=\"header\">\r\n        <div class=\"logo\">\r\n            <a href=\"");
	templateBuilder.Append(linkurl("index"));

	templateBuilder.Append("\">\r\n                <img src=\"");
	templateBuilder.Append("/templates/mobile");
	templateBuilder.Append("/images/logo.png\" />\r\n            </a>\r\n        </div>\r\n        <div class=\"right\"> \r\n            <a href=\"");
	templateBuilder.Append(linkurl("search"));

	templateBuilder.Append("\">\r\n                <i class=\"iconfont icon-search\"></i>\r\n            </a>\r\n            <a href=\"");
	templateBuilder.Append(linkurl("usercenter","index"));

	templateBuilder.Append("\">\r\n                <i class=\"iconfont icon-user\"></i>\r\n            </a>\r\n        </div>\r\n    </div>");


	templateBuilder.Append("\r\n    <!--/页面头部-->\r\n  \r\n    <!--页面内容-->\r\n    <div class=\"page__bd\">\r\n        <!--首页幻灯片-->\r\n        <div id=\"slider\" class=\"swiper-container\">\r\n            <div class=\"swiper-wrapper\">\r\n                <div class=\"swiper-slide\"><img src=\"");
	templateBuilder.Append("/templates/mobile");
	templateBuilder.Append("/images/banner1.jpg\"/></div>\r\n                <div class=\"swiper-slide\"><img src=\"");
	templateBuilder.Append("/templates/mobile");
	templateBuilder.Append("/images/banner2.jpg\"/></div>\r\n                <div class=\"swiper-slide\"><img src=\"");
	templateBuilder.Append("/templates/mobile");
	templateBuilder.Append("/images/banner3.jpg\"/></div>\r\n            </div>\r\n            <div class=\"pagination\"></div>\r\n        </div>\r\n        <!--/首页幻灯片-->\r\n    \r\n        <!--首页图标导航-->\r\n        <div class=\"weui-grids nav-list\">\r\n            <a href=\"");
	templateBuilder.Append(linkurl("news"));

	templateBuilder.Append("\" class=\"weui-grid\">\r\n                <div class=\"weui-grid__icon\">\r\n                    <i class=\"iconfont icon-news\"></i>\r\n                </div>\r\n                <p class=\"weui-grid__label\">新闻资讯</p>\r\n            </a>\r\n            <a href=\"");
	templateBuilder.Append(linkurl("goods"));

	templateBuilder.Append("\" class=\"weui-grid\">\r\n                <div class=\"weui-grid__icon\">\r\n                    <i class=\"iconfont icon-shopping\"></i>\r\n                </div>\r\n                <p class=\"weui-grid__label\">购物商城</p>\r\n            </a>\r\n            <a href=\"");
	templateBuilder.Append(linkurl("video"));

	templateBuilder.Append("\" class=\"weui-grid\">\r\n                <div class=\"weui-grid__icon\">\r\n                    <i class=\"iconfont icon-video\"></i>\r\n                </div>\r\n                <p class=\"weui-grid__label\">视频专区</p>\r\n            </a>\r\n            <a href=\"");
	templateBuilder.Append(linkurl("photo"));

	templateBuilder.Append("\" class=\"weui-grid\">\r\n                <div class=\"weui-grid__icon\">\r\n                    <i class=\"iconfont icon-pic\"></i>\r\n                </div>\r\n                <p class=\"weui-grid__label\">图片分享</p>\r\n            </a>\r\n            <a href=\"");
	templateBuilder.Append(linkurl("down"));

	templateBuilder.Append("\" class=\"weui-grid\">\r\n                <div class=\"weui-grid__icon\">\r\n                    <i class=\"iconfont icon-folder\"></i>\r\n                </div>\r\n                <p class=\"weui-grid__label\">资源下载</p>\r\n            </a>\r\n            <a href=\"");
	templateBuilder.Append(linkurl("usercenter","index"));

	templateBuilder.Append("\" class=\"weui-grid\">\r\n                <div class=\"weui-grid__icon\">\r\n                    <i class=\"iconfont icon-user\"></i>\r\n                </div>\r\n                <p class=\"weui-grid__label\">会员中心</p>\r\n            </a>\r\n            <a href=\"");
	templateBuilder.Append(linkurl("content","about"));

	templateBuilder.Append("\" class=\"weui-grid\">\r\n                <div class=\"weui-grid__icon\">\r\n                    <i class=\"iconfont icon-book\"></i>\r\n                </div>\r\n                <p class=\"weui-grid__label\">关于我们</p>\r\n            </a>\r\n            <a href=\"");
	templateBuilder.Append(linkurl("feedback"));

	templateBuilder.Append("\" class=\"weui-grid\">\r\n                <div class=\"weui-grid__icon\">\r\n                    <i class=\"iconfont icon-msg\"></i>\r\n                </div>\r\n                <p class=\"weui-grid__label\">留言反馈</p>\r\n            </a>\r\n            <a href=\"");
	templateBuilder.Append(linkurl("content","contact"));

	templateBuilder.Append("\" class=\"weui-grid\">\r\n                <div class=\"weui-grid__icon\">\r\n                    <i class=\"iconfont icon-tel\"></i>\r\n                </div>\r\n                <p class=\"weui-grid__label\">联系我们</p>\r\n            </a>\r\n        </div>\r\n        <!--/首页图标导航-->\r\n    \r\n        <!--新闻资讯-->\r\n        <div class=\"weui-panel weui-panel_access\">\r\n            <div class=\"weui-panel__hd\">新闻资讯</div>\r\n            <div class=\"weui-panel__bd\">\r\n                <div class=\"txt-list\">\r\n                    <ul>\r\n                        ");
	DataTable newsList = get_article_list("news", 0, 8, "status=0 and img_url<>''");

	int newdr__loop__id=0;
	foreach(DataRow newdr in newsList.Rows)
	{
		newdr__loop__id++;


	if (newdr__loop__id==1)
	{

	templateBuilder.Append("\r\n                        <li>\r\n                            <a href=\"");
	templateBuilder.Append(linkurl("news_show",Utils.ObjectToStr(newdr["id"])));

	templateBuilder.Append("\">\r\n                                <img src=\"" + Utils.ObjectToStr(newdr["img_url"]) + "\" />\r\n                                <h2>" + Utils.ObjectToStr(newdr["title"]) + "</h2>\r\n                                <p class=\"intro\">" + Utils.ObjectToStr(newdr["zhaiyao"]) + "</p>\r\n                            </a>\r\n                        </li>\r\n                        ");
	}
	else
	{

	templateBuilder.Append("\r\n                        <li>\r\n                            <a href=\"");
	templateBuilder.Append(linkurl("news_show",Utils.ObjectToStr(newdr["id"])));

	templateBuilder.Append("\">\r\n                                <i class=\"date\">");	templateBuilder.Append(Utils.ObjectToDateTime(Utils.ObjectToStr(newdr["add_time"])).ToString("MM-dd"));

	templateBuilder.Append("</i>\r\n                                <span class=\"text\">" + Utils.ObjectToStr(newdr["title"]) + "</span>\r\n                            </a>\r\n                        </li>\r\n                        ");
	}	//end for if

	}	//end for if

	templateBuilder.Append("\r\n                    </ul>\r\n                </div>\r\n            </div>\r\n            \r\n            <div class=\"weui-panel__ft\">\r\n                <a class=\"weui-cell weui-cell_access weui-cell_link\" href=\"");
	templateBuilder.Append(linkurl("news"));

	templateBuilder.Append("\">\r\n                    <div class=\"weui-cell__bd\">查看更多</div>\r\n                    <span class=\"weui-cell__ft\"></span>\r\n                </a>    \r\n            </div>\r\n        </div>\r\n        <!--新闻资讯-->\r\n    \r\n        <!--购物商城-->\r\n        <div class=\"weui-panel weui-panel_access\">\r\n            <div class=\"weui-panel__hd\">购物商城</div>\r\n            <div class=\"weui-panel__bd\">\r\n                <div class=\"txt-list\">\r\n                    <ul>\r\n                        ");
	DataTable redGoods = get_article_list("goods", 0, 4, "status=0 and is_red=1");

	foreach(DataRow dr in redGoods.Rows)
	{

	templateBuilder.Append("\r\n                        <li>\r\n                            <a href=\"");
	templateBuilder.Append(linkurl("goods_show",Utils.ObjectToStr(dr["id"])));

	templateBuilder.Append("\">\r\n                                <img src=\"" + Utils.ObjectToStr(dr["img_url"]) + "\" />\r\n                                <h2>" + Utils.ObjectToStr(dr["title"]) + "</h2>\r\n                                <div class=\"note\">\r\n                                    <p>" + Utils.ObjectToStr(dr["zhaiyao"]) + "</p>\r\n                                    <p><i class=\"hot\">" + Utils.ObjectToStr(dr["click"]) + "人</i><i class=\"price\">¥" + Utils.ObjectToStr(dr["sell_price"]) + "</i>元</p>\r\n                                </div>\r\n                            </a>\r\n                        </li>\r\n                        ");
	}	//end for if

	templateBuilder.Append("\r\n                    </ul>\r\n                </div>\r\n            </div>\r\n            \r\n            <div class=\"weui-panel__ft\">\r\n                <a class=\"weui-cell weui-cell_access weui-cell_link\" href=\"");
	templateBuilder.Append(linkurl("goods"));

	templateBuilder.Append("\">\r\n                    <div class=\"weui-cell__bd\">查看更多</div>\r\n                    <span class=\"weui-cell__ft\"></span>\r\n                </a>    \r\n            </div>\r\n        </div>\r\n        <!--/购物商城-->\r\n\r\n        <!--视频专区-->\r\n        <div class=\"weui-panel weui-panel_access\">\r\n            <div class=\"weui-panel__hd\">视频专区</div>\r\n            <div class=\"weui-panel__bd\">\r\n                <div class=\"photo-list\">\r\n                    <ul>\r\n                        ");
	DataTable redVideo = get_article_list("video", 0, 6, "status=0 and is_red=1");

	foreach(DataRow dr in redVideo.Rows)
	{

	templateBuilder.Append("\r\n                        <li>\r\n                            <a href=\"");
	templateBuilder.Append(linkurl("video_show",Utils.ObjectToStr(dr["id"])));

	templateBuilder.Append("\" title=\"" + Utils.ObjectToStr(dr["title"]) + "\">\r\n                                <img src=\"" + Utils.ObjectToStr(dr["img_url"]) + "\" />\r\n                                <h2>" + Utils.ObjectToStr(dr["title"]) + "</h2>\r\n                            </a>\r\n                        </li>\r\n                        ");
	}	//end for if

	templateBuilder.Append("\r\n                    </ul>\r\n                </div>\r\n            </div>\r\n            <div class=\"weui-panel__ft\">\r\n                <a class=\"weui-cell weui-cell_access weui-cell_link\" href=\"");
	templateBuilder.Append(linkurl("video"));

	templateBuilder.Append("\">\r\n                    <div class=\"weui-cell__bd\">查看更多</div>\r\n                    <span class=\"weui-cell__ft\"></span>\r\n                </a>    \r\n            </div>\r\n        </div>\r\n        <!--/视频专区-->\r\n\r\n        <!--图片分享-->\r\n        <div class=\"weui-panel weui-panel_access\">\r\n            <div class=\"weui-panel__hd\">图片分享</div>\r\n            <div class=\"weui-panel__bd\">\r\n                <div class=\"photo-list\">\r\n                    <ul>\r\n                        ");
	DataTable redPhoto = get_article_list("photo", 0, 6, "status=0 and is_red=1");

	foreach(DataRow dr in redPhoto.Rows)
	{

	templateBuilder.Append("\r\n                        <li>\r\n                            <a href=\"");
	templateBuilder.Append(linkurl("photo_show",Utils.ObjectToStr(dr["id"])));

	templateBuilder.Append("\" title=\"" + Utils.ObjectToStr(dr["title"]) + "\">\r\n                                <img src=\"" + Utils.ObjectToStr(dr["img_url"]) + "\" />\r\n                                <h2>" + Utils.ObjectToStr(dr["title"]) + "</h2>\r\n                            </a>\r\n                        </li>\r\n                        ");
	}	//end for if

	templateBuilder.Append("\r\n                    </ul>\r\n                </div>\r\n            </div>\r\n            <div class=\"weui-panel__ft\">\r\n                <a class=\"weui-cell weui-cell_access weui-cell_link\" href=\"");
	templateBuilder.Append(linkurl("photo"));

	templateBuilder.Append("\">\r\n                    <div class=\"weui-cell__bd\">查看更多</div>\r\n                    <span class=\"weui-cell__ft\"></span>\r\n                </a>    \r\n            </div>\r\n        </div>\r\n        <!--/图片分享-->\r\n    \r\n        <!--资源下载-->\r\n        <div class=\"weui-panel weui-panel_access\">\r\n            <div class=\"weui-panel__hd\">资源下载</div>\r\n            <div class=\"weui-panel__bd\">\r\n                <div class=\"txt-list\">\r\n                    <ul>\r\n                        ");
	DataTable redDown = get_article_list("down", 0, 5, "status=0 and is_red=1");

	foreach(DataRow dr in redDown.Rows)
	{

	templateBuilder.Append("\r\n                        <li>\r\n                            <a href=\"");
	templateBuilder.Append(linkurl("down_show",Utils.ObjectToStr(dr["id"])));

	templateBuilder.Append("\" title=\"" + Utils.ObjectToStr(dr["title"]) + "\">\r\n                                <img src=\"" + Utils.ObjectToStr(dr["img_url"]) + "\" />\r\n                                <h2>" + Utils.ObjectToStr(dr["title"]) + "</h2>\r\n                                <div class=\"note\">\r\n                                    <p>" + Utils.ObjectToStr(dr["zhaiyao"]) + "</p>\r\n                                    <p>\r\n                                        <i class=\"hot\"><script type=\"text/javascript\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/submit_ajax.ashx?action=view_attach_count&channel_id=" + Utils.ObjectToStr(dr["channel_id"]) + "&id=" + Utils.ObjectToStr(dr["id"]) + "&view=count\"></");
	templateBuilder.Append("script>次</i>\r\n                                        <i class=\"date\">时间：");	templateBuilder.Append(Utils.ObjectToDateTime(Utils.ObjectToStr(dr["add_time"])).ToString("yyyy-MM-dd"));

	templateBuilder.Append("</i>\r\n                                    </p>\r\n                                </div>\r\n                            </a>\r\n                        </li>\r\n                        ");
	}	//end for if

	templateBuilder.Append("\r\n                    </ul>\r\n                </div>\r\n            </div>\r\n            \r\n            <div class=\"weui-panel__ft\">\r\n                <a class=\"weui-cell weui-cell_access weui-cell_link\" href=\"");
	templateBuilder.Append(linkurl("down"));

	templateBuilder.Append("\">\r\n                    <div class=\"weui-cell__bd\">查看更多</div>\r\n                    <span class=\"weui-cell__ft\"></span>\r\n                </a>    \r\n            </div>\r\n        </div>\r\n        <!--/资源下载-->\r\n        \r\n        <!--版权信息-->\r\n        ");

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


	templateBuilder.Append("\r\n        <!--/底部导航-->\r\n    </div>\r\n    <!--/页面内容-->\r\n</div>\r\n</body>\r\n</html>");
	Response.Write(templateBuilder.ToString());
}
</script>
