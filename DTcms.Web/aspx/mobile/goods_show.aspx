<%@ Page Language="C#" AutoEventWireup="true" Inherits="DTcms.Web.UI.Page.article_show" ValidateRequest="false" %>
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
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\">\r\n	$(document).ready(function(){\r\n		var mySwiper = new Swiper('.swiper-container',{\r\n			calculateHeight:true,\r\n			resizeReInit:true,\r\n			pagination:\".pagination\",\r\n			autoplay:5000,\r\n			paginationClickable:true\r\n		});\r\n        //初始化规格事件\r\n        initGoodsSpec('");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/submit_ajax.ashx?action=get_article_goods_info&channel_id=");
	templateBuilder.Append(Utils.ObjectToStr(model.channel_id));
	templateBuilder.Append("');\r\n	});\r\n</");
	templateBuilder.Append("script>\r\n</head>\r\n\r\n<body ontouchstart>\r\n<div class=\"page\">\r\n    <!--页面头部-->\r\n    <div class=\"header\">\r\n        <a class=\"back\" href=\"javascript:history.back();\">\r\n            <i class=\"iconfont icon-arrow-left\"></i>\r\n        </a>\r\n        <h3>购物商城</h3>\r\n        <div class=\"right\"> \r\n            <a class=\"weui-cell_access weui-cell_link\" onclick=\"showDialogBox('#category-box');\">\r\n                <i class=\"iconfont icon-nav\"></i>\r\n            </a>\r\n        </div>\r\n    </div>\r\n    <!--/页面头部-->\r\n  \r\n    <!--页面内容-->\r\n    <div class=\"page__bd\">\r\n        <!--商品幻灯片-->\r\n        <div id=\"slider\" class=\"swiper-container\">\r\n            <div class=\"swiper-wrapper\">\r\n                ");
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
	templateBuilder.Append("</h2>\r\n                    <p><span class=\"price\">¥" + Utils.ObjectToStr(model.fields["sell_price"]) + "</span>元</p>\r\n                </div>\r\n            </div>\r\n            \r\n        </div>\r\n        <!--/商品名称-->\r\n        \r\n        <!--参数选择-->\r\n        <div class=\"weui-panel weui-panel_access item-list\">\r\n            <div class=\"weui-panel__bd\">\r\n                <a id=\"selectSpecText\" class=\"weui-cell weui-cell_access\" href=\"javascript:;\" onclick=\"showActionSheet();\">\r\n                    <div class=\"weui-cell__bd\">\r\n                        <p>选择规格、数量</p>\r\n                    </div>\r\n                    <div class=\"weui-cell__ft\"></div>\r\n                </a>\r\n                 <a class=\"weui-cell weui-cell_access\" href=\"#commentList\">\r\n                    <div class=\"weui-cell__bd\">\r\n                        <p>查看评论</p>\r\n                    </div>\r\n                    <div class=\"weui-cell__ft\">共<script type=\"text/javascript\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/submit_ajax.ashx?action=view_comment_count&channel_id=");
	templateBuilder.Append(Utils.ObjectToStr(model.channel_id));
	templateBuilder.Append("&id=");
	templateBuilder.Append(Utils.ObjectToStr(model.id));
	templateBuilder.Append("\"></");
	templateBuilder.Append("script>条评论</div>\r\n                </a>\r\n               \r\n            </div>\r\n            \r\n        </div>\r\n        <!--/参数选择-->\r\n        \r\n        <!--商品参数-->\r\n        <div class=\"weui-panel weui-panel_access item-list\">\r\n            <div class=\"weui-panel__hd\">商品参数</div>\r\n            <div class=\"weui-panel__bd\">\r\n                <div class=\"weui-cell weui-cell_access\">\r\n                    <div class=\"weui-cell__bd\">\r\n                        <p>货号：<span id=\"commodityGoodsNo\">" + Utils.ObjectToStr(model.fields["goods_no"]) + "</span></p>\r\n                    </div>\r\n                </div>\r\n                <div class=\"weui-cell weui-cell_access\">\r\n                    <div class=\"weui-cell__bd\">\r\n                        <p>市场价：<s id=\"commodityMarketPrice\">¥" + Utils.ObjectToStr(model.fields["market_price"]) + "</s></p>\r\n                    </div>\r\n                </div>\r\n                <div class=\"weui-cell weui-cell_access\">\r\n                    <div class=\"weui-cell__bd\">\r\n                        <p>上架时间：");
	templateBuilder.Append(Utils.ObjectToStr(model.add_time));
	templateBuilder.Append("</p>\r\n                    </div>\r\n                </div>\r\n            </div>\r\n        </div>\r\n        <!--/商品参数-->\r\n        \r\n        <!--商品介绍-->\r\n        <div class=\"weui-panel weui-panel_access\">\r\n            <div class=\"weui-panel__hd\">商品介绍</div>\r\n            <div class=\"weui-panel__bd\">\r\n                <div class=\"entry\">\r\n                    ");
	templateBuilder.Append(Utils.ObjectToStr(model.content));
	templateBuilder.Append("\r\n                </div>\r\n            </div>\r\n        </div>\r\n        <!--/商品介绍-->\r\n        \r\n        <!--相关商品-->\r\n        <div class=\"weui-panel weui-panel_access\">\r\n            <div class=\"weui-panel__hd\">相关商品</div>\r\n            <div class=\"weui-panel__bd\">\r\n                <div class=\"img-list\">\r\n                    <ul>\r\n                        ");
	DataTable relList = get_article_list(channel, model.category_id, 4, "is_red=1 and id<>"+model.id);

	foreach(DataRow dr in relList.Rows)
	{

	templateBuilder.Append("\r\n                        <li>\r\n                            <div class=\"wrap\">\r\n                                <a href=\"");
	templateBuilder.Append(linkurl("goods_show",Utils.ObjectToStr(dr["id"])));

	templateBuilder.Append("\">\r\n                                    <img src=\"" + Utils.ObjectToStr(dr["img_url"]) + "\" />\r\n                                    <div class=\"note\">\r\n                                        <h2>" + Utils.ObjectToStr(dr["title"]) + "</h2>\r\n                                        <p>\r\n                                            <i class=\"hot\">库存 " + Utils.ObjectToStr(dr["stock_quantity"]) + "</i>\r\n                                            <i class=\"price\">¥" + Utils.ObjectToStr(dr["sell_price"]) + "</i>元\r\n                                        </p>\r\n                                    </div>\r\n                                </a>\r\n                            </div>\r\n                        </li>\r\n                        ");
	}	//end for if

	if (relList.Rows.Count<1)
	{

	templateBuilder.Append("\r\n                            <div class=\"nodata\">暂无相关...</div>\r\n                        ");
	}	//end for if

	templateBuilder.Append("\r\n                    </ul>\r\n                </div>\r\n                \r\n            </div>\r\n        </div>\r\n        <!--/相关商品-->\r\n        \r\n        <!--网友评论-->\r\n        ");
	if (model.is_msg==1)
	{


	templateBuilder.Append("        <link rel=\"stylesheet\" type=\"text/css\" href=\"");
	templateBuilder.Append("/templates/mobile");
	templateBuilder.Append("/css/validate.css\" />\r\n        <script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append("/templates/mobile");
	templateBuilder.Append("/js/mvalidate.js\"></");
	templateBuilder.Append("script>\r\n        <script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append("/templates/mobile");
	templateBuilder.Append("/js/mvalidate-extend.js\"></");
	templateBuilder.Append("script>\r\n        ");
	int comment_count = get_comment_count(model.channel_id, model.id, "is_lock=0");

	templateBuilder.Append("<!--取得评论总数-->\r\n        <script type=\"text/javascript\">\r\n        //初始化评论列表\r\n		function InitCommentList(){\r\n			CommentAjaxList('#btnLoadComment','#commentList',10,");
	templateBuilder.Append(Utils.ObjectToStr(comment_count));
	templateBuilder.Append(",'");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/submit_ajax.ashx?action=comment_list&channel_id=");
	templateBuilder.Append(Utils.ObjectToStr(model.channel_id));
	templateBuilder.Append("&article_id=");
	templateBuilder.Append(Utils.ObjectToStr(model.id));
	templateBuilder.Append("');\r\n		}\r\n		//页面加载完毕事件\r\n		$(document).ready(function(){\r\n			//初始化评论列表\r\n			InitCommentList(); //加载第一页评论列表\r\n			//初始化发表评论表单\r\n			AjaxInitForm('#commentForm', '#btnSubmit', 1);\r\n        });\r\n		\r\n      </");
	templateBuilder.Append("script>\r\n        <div class=\"weui-panel weui-panel_access\">\r\n            <div class=\"weui-panel__hd\">网友评论</div>\r\n            <div class=\"weui-panel__bd\">\r\n            \r\n                <div class=\"comment-box\">\r\n                    \r\n                    <div class=\"comment-add\">\r\n                        <form id=\"commentForm\" name=\"commentForm\" class=\"form-box\" url=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/submit_ajax.ashx?action=comment_add&channel_id=");
	templateBuilder.Append(Utils.ObjectToStr(model.channel_id));
	templateBuilder.Append("&article_id=");
	templateBuilder.Append(Utils.ObjectToStr(model.id));
	templateBuilder.Append("\">\r\n                            <div class=\"input-box\">\r\n                                <textarea id=\"txtContent\" name=\"txtContent\" rows=\"3\" placeholder=\"吐槽一下\" class=\"input\" data-validate=\"comment\"></textarea>\r\n                            </div>\r\n                            <div class=\"input-box\">\r\n                                <input id=\"btnSubmit\" name=\"btnSubmit\" type=\"submit\" value=\"发表\" class=\"weui-btn weui-btn_mini weui-btn_primary\" />\r\n                                <input id=\"txtCode\" name=\"txtCode\" type=\"text\" placeholder=\"验证码\" class=\"input code\" data-validate=\"code\" />\r\n                                <a href=\"javascript:;\" onclick=\"ToggleCode(this, '");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/verify_code.ashx');return false;\">\r\n                                    <img src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/verify_code.ashx\" width=\"80\" height=\"25\" style=\"vertical-align:middle;\" />\r\n                                </a>\r\n                            </div>\r\n                        </form>\r\n                    </div>\r\n                    \r\n                    <ol id=\"commentList\" class=\"comment-list\">\r\n                        <div class=\"nodata\">暂无评论...</div>\r\n                    </ol>\r\n                    \r\n                    <div class=\"comment-more\">\r\n                        <input id=\"btnLoadComment\" type=\"button\" value=\"加载更多评论\" class=\"weui-btn weui-btn_default\" onclick=\"InitCommentList();\" />\r\n                    </div>\r\n                </div>\r\n                \r\n            </div>\r\n        </div>");


	}	//end for if

	templateBuilder.Append("\r\n        <!--/网友评论-->\r\n    \r\n        <!--版权信息-->\r\n        ");

	templateBuilder.Append("        <div class=\"weui-footer footer\">\r\n            <p class=\"weui-footer__links\">\r\n                <a href=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.weburl));
	templateBuilder.Append("?m2w\" class=\"weui-footer__link\">触屏版</a>\r\n                <a href=\"");
	templateBuilder.Append(linkurl("index"));

	templateBuilder.Append("\" class=\"weui-footer__link\">电脑版</a>\r\n            </p>\r\n            <p class=\"weui-footer__text\">");
	templateBuilder.Append(Utils.ObjectToStr(site.copyright));
	templateBuilder.Append("</p>\r\n        </div>");


	templateBuilder.Append("\r\n        <!--/版权信息-->\r\n\r\n        <!--底部按钮-->\r\n        <div class=\"goods-btn-box\">\r\n            <div class=\"wrap-box\">\r\n                <a class=\"red\" href=\"javascript:;\" onclick=\"showActionSheet('cart','");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("','");
	templateBuilder.Append(linkurl("shopping"));

	templateBuilder.Append("');\">\r\n                    <i class=\"iconfont icon-cart\"></i>\r\n                    <span>加入购物车</span>\r\n                </a>\r\n                <a class=\"green\" href=\"javascript:;\" onclick=\"showActionSheet('buy','");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("','");
	templateBuilder.Append(linkurl("shopping"));

	templateBuilder.Append("');\">\r\n                    <i class=\"iconfont icon-order\"></i>\r\n                    <span>立即购买</span>\r\n                </a>\r\n            </div>\r\n        </div>\r\n        <!--/底部按钮-->\r\n        \r\n        <!--规格容器-->\r\n        <div>\r\n            <div class=\"weui-mask\" id=\"specMask\" style=\"display:none\"></div>\r\n            <div class=\"weui-actionsheet spec-wrap\" id=\"specActionsheet\">\r\n                <div id=\"specActionsheetCancel\" class=\"close\">\r\n                    <i class=\"iconfont icon-close\"></i>\r\n                </div>\r\n                <div id=\"goodsSpecBox\" class=\"spec-box\">\r\n                    ");
	List<DTcms.Model.article_goods_spec> specList = get_article_goods_spec(model.channel_id, model.id, "parent_id=0");

	if (specList!=null)
	{

	foreach(DTcms.Model.article_goods_spec modelt1 in specList)
	{

	templateBuilder.Append("\r\n                    <dl>\r\n                        <dt>");
	templateBuilder.Append(Utils.ObjectToStr(modelt1.title));
	templateBuilder.Append("</dt>\r\n                        <dd>\r\n                            <!--规格选项-->\r\n                            ");
	List<DTcms.Model.article_goods_spec> itemList = get_article_goods_spec(model.channel_id, model.id, "parent_id="+modelt1.spec_id);

	if (itemList!=null)
	{

	foreach(DTcms.Model.article_goods_spec modelt2 in itemList)
	{

	templateBuilder.Append("\r\n                            <a specid=\"");
	templateBuilder.Append(Utils.ObjectToStr(modelt2.spec_id));
	templateBuilder.Append("\" title=\"");
	templateBuilder.Append(Utils.ObjectToStr(modelt2.title));
	templateBuilder.Append("\" href=\"javascript:;\">\r\n                                <span>");
	templateBuilder.Append(Utils.ObjectToStr(modelt2.title));
	templateBuilder.Append("</span>\r\n                            </a>\r\n                            ");
	}	//end for if

	}	//end for if

	templateBuilder.Append("\r\n                            <!--/规格选项-->\r\n                        </dd>\r\n                    </dl>\r\n                    ");
	}	//end for if

	}	//end for if

	templateBuilder.Append("\r\n                    <div class=\"btn-box\">\r\n                        <dt>购物数量<span>(库存<b id=\"commodityStockNum\">" + Utils.ObjectToStr(model.fields["stock_quantity"]) + "</b>件)</span></dt>\r\n                        <dd>\r\n                            <input id=\"commodityChannelId\" type=\"hidden\" value=\"");
	templateBuilder.Append(Utils.ObjectToStr(model.channel_id));
	templateBuilder.Append("\" />\r\n                            <input id=\"commodityArticleId\" type=\"hidden\" value=\"");
	templateBuilder.Append(Utils.ObjectToStr(model.id));
	templateBuilder.Append("\" />\r\n                            <input id=\"commodityGoodsId\" type=\"hidden\" value=\"0\" />\r\n                            <a class=\"reduce\" href=\"javascript:;\" onclick=\"addCartNum(-1);\">-</a>\r\n                            <input id=\"commoditySelectNum\" class=\"input\" type=\"text\" value=\"1\" maxValue=\"" + Utils.ObjectToStr(model.fields["stock_quantity"]) + "\" onkeydown=\"return checkNumber(event);\" />\r\n                            <a class=\"subjoin\" href=\"javascript:;\" onclick=\"addCartNum(1);\">+</a>\r\n                        </dd>\r\n                    </div>\r\n                </div>\r\n                \r\n                <div class=\"weui-actionsheet__action\">\r\n                    <button id=\"confirmButton\" class=\"weui-actionsheet__cell over\" disabled=\"disabled\">确定</button>\r\n                </div>\r\n            </div>\r\n        </div>\r\n        <!--规格容器-->\r\n    </div>\r\n    <!--/页面内容-->\r\n</div>\r\n\r\n<!--类别容器-->\r\n<div id=\"category-box\" class=\"dialog-wrap\">\r\n    <div class=\"dialog-box\">\r\n        <div class=\"header\">\r\n            <a class=\"back\" href=\"javascript:;\" onclick=\"closeDialogBox('#category-box');\">\r\n                <i class=\"iconfont icon-arrow-left\"></i>\r\n            </a>\r\n            <h3>栏目类别</h3>\r\n        </div>\r\n        <ul class=\"navbar\">\r\n            ");
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

	templateBuilder.Append("\r\n        </ul>\r\n    </div>\r\n</div>\r\n<!--类别容器-->\r\n\r\n</body>\r\n</html>\r\n");
	Response.Write(templateBuilder.ToString());
}
</script>
