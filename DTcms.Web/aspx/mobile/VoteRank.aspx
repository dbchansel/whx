<%@ Page Language="C#" AutoEventWireup="true" Inherits="DTcms.Web.UI.Page.VoteIndex" ValidateRequest="false" %>
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

	templateBuilder.Append("<!DOCTYPE html>\r\n<!--HTML5 doctype-->\r\n<html>\r\n<head>\r\n    <meta charset=\"utf-8\">\r\n    <meta name=\"viewport\" content=\"width=device-width,initial-scale=1,user-scalable=0\">\r\n    <title>投票啦,排名 - ");
	templateBuilder.Append(Utils.ObjectToStr(model.Activity_Title));
	templateBuilder.Append("</title>\r\n    <meta name=\"keywords\" content=\"");
	templateBuilder.Append(Utils.ObjectToStr(site.seo_keyword));
	templateBuilder.Append("\" />\r\n    <meta name=\"description\" content=\"");
	templateBuilder.Append(Utils.ObjectToStr(site.seo_description));
	templateBuilder.Append("\" />\r\n    <link rel=\"stylesheet\" type=\"text/css\" href=\"");
	templateBuilder.Append("/templates/mobile");
	templateBuilder.Append("/css/idangerous.swiper.css\" />\r\n    <link rel=\"stylesheet\" type=\"text/css\" href=\"");
	templateBuilder.Append("/templates/mobile");
	templateBuilder.Append("/css/style.css\" />\r\n    <script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append("/templates/mobile");
	templateBuilder.Append("/js/zepto.min.js\"></");
	templateBuilder.Append("script>\r\n    <script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append("/templates/mobile");
	templateBuilder.Append("/js/weui.min.js\"></");
	templateBuilder.Append("script>\r\n    <script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append("/templates/mobile");
	templateBuilder.Append("/js/common.js\"></");
	templateBuilder.Append("script>\r\n    <script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append("/templates/mobile");
	templateBuilder.Append("/js/idangerous.swiper-2.1.min.js\"></");
	templateBuilder.Append("script>\r\n    <script type=\"text/javascript\">\r\n	$(document).ready(function(){\r\n		var mySwiper = new Swiper('.swiper-container',{\r\n			calculateHeight:true,\r\n			resizeReInit:true,\r\n			pagination:\".pagination\",\r\n			autoplay:5000,\r\n			paginationClickable:true\r\n		});\r\n	});\r\n    </");
	templateBuilder.Append("script>\r\n</head>\r\n\r\n<body style=\"background-color:#ffffff\" id=\"news\" ontouchstart>\r\n    <div class=\"page\">\r\n        <!--页面头部-->\r\n        <div class=\"header\" style=\"background:#0a0a0a6e;\">\r\n            <marquee direction=\"left\" behavior=\"scroll\" scrollamount=\"5\" scrolldelay=\"10\" loop=\"99\" height=\"30\" bgcolor=\"#0a0a0a6e\">\r\n                <font face=\"隶书\" color=\"white\" size=\"3\">");
	templateBuilder.Append(Utils.ObjectToStr(model.Activity_Title));
	templateBuilder.Append(" &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ");
	templateBuilder.Append(Utils.ObjectToStr(model.JRZXName));
	templateBuilder.Append("</font>\r\n            </marquee>\r\n        </div>\r\n        <!--/页面头部-->\r\n        <!--页面内容-->\r\n        <div class=\"page__bd\">\r\n            <!--首页幻灯片-->\r\n            <div id=\"slider\" class=\"swiper-container\">\r\n                <div class=\"swiper-wrapper\">\r\n                    ");
	DataTable focusList = get_VoteInfo();

	foreach(DataRow dr in focusList.Rows)
	{

	templateBuilder.Append("\r\n                    <div class=\"swiper-slide\">\r\n                        <a>\r\n                            <img src=\"" + Utils.ObjectToStr(dr["img_url"]) + "\" />\r\n                         </a>\r\n                    </div>\r\n                    ");
	}	//end for if

	templateBuilder.Append("\r\n                </div>\r\n                <div class=\"pagination\"></div>\r\n            </div>\r\n            <!--/首页幻灯片-->\r\n            <!--排名信息-->\r\n            <div class=\"weui-panel weui-panel_access\">\r\n                <div class=\"weui-panel__hd\" style=\"background-color: #1E90FF;font-size: 17px;color: white;border-radius: 10px 10px 0 0;\">选手列表：</div>\r\n                <div class=\"weui-panel__bd\">\r\n                    <div class=\"txt-list\">\r\n                        <ul>\r\n                            ");
	foreach(DataRow dr in _RankDataTable.Rows)
	{

	templateBuilder.Append("\r\n                            <li>\r\n                                <div style=\"width:100%;height:200px;\">\r\n                                    <div style=\"width: 95%;height: 160px;position: relative;top: 30px;right: -10px;box-shadow: 2px 2px 2px #cccccc;\">\r\n                                        <a href=\"VoteMember.aspx?id=" + Utils.ObjectToStr(dr["id"]) + "\">\r\n                                            <div style=\"width: 130px;height: 130px;border-radius: 50%;overflow: hidden;\"><img src=\"" + Utils.ObjectToStr(dr["JoinImg1"]) + "\" style=\"width:130px;height:130px\" /></div>\r\n                                            \r\n                                            <h4 style=\"position: relative;font-size: 16px;top: -120px;right: -150px;color: #999;\">" + Utils.ObjectToStr(dr["JoinName"]) + "</h4>\r\n                                            <div style=\"position:relative;right: -270px;font-size: 20px;background-color: #1E90FF;color: white;top: -160px;width: 70px;border-radius: 0px 0px 5px 5px;text-align: center;\">第" + Utils.ObjectToStr(dr["Rank"]) + "名</div>\r\n                                            <div class=\"note\" style=\"position: relative;top: 17px;\">\r\n                                                <p style=\"position: relative;top: -154px;font-size: 16px;right: -140px;color: #555;width: 210px;white-space: nowrap;\">" + Utils.ObjectToStr(dr["JoinAddress"]) + "</p>\r\n                                                <p style=\"position: relative;top: -130px;font-size: 16px;right: -200px;\">\r\n                                                    <div style=\"position:relative;    top: -145px;right: -270px;\">\r\n                                                        <i class=\"hot\" style=\"color: #f00;font-size: 17px;top: -142px;right: -270px;\">" + Utils.ObjectToStr(dr["VoteNum"]) + "票</i>\r\n                                                    </div>\r\n                                                   <div style=\"position:relative;top: -170px;right: -130px;\"><i class=\"date\" style=\"font-size: 17px;color:#1E90FF\">浏览量：" + Utils.ObjectToStr(dr["BrowseNum"]) + "</i></div>\r\n                                                    \r\n                                                </p>\r\n                                            </div>\r\n                                        </a>\r\n\r\n                                    </div>\r\n                                </div>\r\n                                         \r\n                            </li>\r\n                            ");
	}	//end for if

	templateBuilder.Append("\r\n                        </ul>\r\n                    </div>\r\n                </div>\r\n            </div>\r\n            <!--/排名信息-->\r\n            <!--版权信息-->\r\n            ");

	templateBuilder.Append("<div class=\"weui-footer footer\">\r\n    <p class=\"weui-footer__text\">");
	templateBuilder.Append(Utils.ObjectToStr(site.copyright));
	templateBuilder.Append("</p>\r\n</div>");


	templateBuilder.Append("\r\n            <!--/版权信息-->\r\n            <!--底部导航-->\r\n            <div class=\"weui-tab foot-nav\">\r\n                <div class=\"weui-tab__panel\">\r\n\r\n                </div>\r\n                <div class=\"weui-tabbar\">\r\n                    <a href=\"goVote.aspx?id=");
	templateBuilder.Append(Utils.ObjectToStr(model.id));
	templateBuilder.Append("\" class=\"weui-tabbar__item\">\r\n                        <i class=\"iconfont icon-home weui-tabbar__icon\"></i>\r\n                        <p class=\"weui-tabbar__label\">首页</p>\r\n                    </a>\r\n                    <a href=\"VoteRank.aspx?VoteId=");
	templateBuilder.Append(Utils.ObjectToStr(model.id));
	templateBuilder.Append("\" class=\"weui-tabbar__item\">\r\n                        <i class=\"iconfont icon-view weui-tabbar__icon\"></i>\r\n                        <p class=\"weui-tabbar__label\">排名</p>\r\n                    </a>\r\n                    <a href=\"VoteGift.aspx?VoteId=");
	templateBuilder.Append(Utils.ObjectToStr(model.id));
	templateBuilder.Append("\" class=\"weui-tabbar__item\">\r\n                        <i class=\"iconfont icon-order weui-tabbar__icon\"></i>\r\n                        <p class=\"weui-tabbar__label\">奖品</p>\r\n                    </a>\r\n                    <a href=\"VoteJoin.aspx?VoteId=");
	templateBuilder.Append(Utils.ObjectToStr(model.id));
	templateBuilder.Append("\" class=\"weui-tabbar__item\">\r\n                        <i class=\"iconfont icon-user weui-tabbar__icon\"></i>\r\n                        <p class=\"weui-tabbar__label\">报名</p>\r\n                    </a>\r\n                </div>\r\n            </div>\r\n            <!--/底部导航-->\r\n        </div>\r\n        <!--/页面内容-->\r\n    </div>\r\n</body>\r\n</html>\r\n");
	Response.Write(templateBuilder.ToString());
}
</script>
