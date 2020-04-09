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

	templateBuilder.Append("<!DOCTYPE html>\r\n<!--HTML5 doctype-->\r\n<html>\r\n<head>\r\n    <meta charset=\"utf-8\">\r\n    <meta name=\"viewport\" content=\"width=device-width,initial-scale=1,user-scalable=0\">\r\n    <title>投票啦 - ");
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
	templateBuilder.Append("script>\r\n    <style>\r\n        #contentCss img{\r\n	                width: 100%;    height: 100%;\r\n                }\r\n\r\n    </style>\r\n    <script type=\"text/javascript\">\r\n        $(document).ready(function () {\r\n		    var mySwiper = new Swiper('.swiper-container',{\r\n			    calculateHeight:true,\r\n			    resizeReInit:true,\r\n			    pagination:\".pagination\",\r\n			    autoplay:5000,\r\n			    paginationClickable:true\r\n		    });\r\n		   // setCookie('openid', '");
	templateBuilder.Append(Utils.ObjectToStr(openid));
	templateBuilder.Append("', 365);\r\n		    checkCookie();\r\n		    TimeDown($(\"#djs\"), \"");
	templateBuilder.Append(Utils.ObjectToStr(djsStr));
	templateBuilder.Append("\");\r\n        });\r\n        var openid;\r\n        function checkCookie() {\r\n            openid = getCookie('openid')\r\n            if (openid != null && openid != \"\") {\r\n            }\r\n            else {\r\n                setCookie('openid', '");
	templateBuilder.Append(Utils.ObjectToStr(openid));
	templateBuilder.Append("', 365);\r\n            }\r\n        }\r\n\r\n        // 创建cookie\r\n        function setCookie(c_name, value, expiredays){\r\n            var exdate = new Date();\r\n            exdate.setDate(exdate.getDate() + expiredays);\r\n            document.cookie = c_name+ \"=\" + escape(value) + \r\n            ((expiredays==null) ? \"\" : \"; expires=\"+exdate.toGMTString());\r\n        }\r\n        function getCookie(c_name) {\r\n            if (document.cookie.length > 0) {\r\n                c_start = document.cookie.indexOf(c_name + \"=\")\r\n                if (c_start != -1) {\r\n                    c_start = c_start + c_name.length + 1\r\n                    c_end = document.cookie.indexOf(\";\", c_start)\r\n                    if (c_end == -1) c_end = document.cookie.length\r\n                    return unescape(document.cookie.substring(c_start, c_end))\r\n                }\r\n            }\r\n            return \"\"\r\n        }\r\n\r\n        /*\r\n时间倒计时插件\r\nTimeDown.js\r\n*/\r\n        function TimeDown(obj, endDateStr) {\r\n            //结束时间\r\n            var endDate = new Date(endDateStr);\r\n            //当前时间\r\n            var nowDate = new Date();\r\n            if (endDate < nowDate) {\r\n                obj.text(\"0天0时0分0秒（已结束）\");\r\n                return;\r\n            }\r\n\r\n            //相差的总秒数\r\n            var totalSeconds = parseInt((endDate - nowDate) / 1000);\r\n            //天数\r\n            var days = Math.floor(totalSeconds / (60 * 60 * 24));\r\n            //取模（余数）\r\n            var modulo = totalSeconds % (60 * 60 * 24);\r\n            //小时数\r\n            var hours = Math.floor(modulo / (60 * 60));\r\n            modulo = modulo % (60 * 60);\r\n            //分钟\r\n            var minutes = Math.floor(modulo / 60);\r\n            //秒\r\n            var seconds = modulo % 60;\r\n            //输出到页面\r\n            obj.text(days + \"天\" + hours + \"小时\" + minutes + \"分钟\" + seconds + \"秒\");\r\n            //  obj.innerHTML = \"还剩:\" + days + \"天\" + hours + \"小时\" + minutes + \"分钟\" + seconds + \"秒\";\r\n            //延迟一秒执行自己\r\n            setTimeout(function () {\r\n                TimeDown(obj, endDateStr);\r\n            }, 1000)\r\n        }\r\n    </");
	templateBuilder.Append("script>\r\n</head>\r\n\r\n<body style=\"background-color:#ffffff\" id=\"news\" ontouchstart>\r\n    <div class=\"page\">\r\n        <!--页面头部-->\r\n        <div class=\"header\" style=\"background:#0a0a0a6e;\">\r\n            <marquee direction=\"left\" behavior=\"scroll\" scrollamount=\"5\" scrolldelay=\"10\" loop=\"99\" height=\"30\" bgcolor=\"#0a0a0a6e\">\r\n                <font face=\"隶书\" color=\"white\" size=\"3\">");
	templateBuilder.Append(Utils.ObjectToStr(model.Activity_Title));
	templateBuilder.Append(" &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ");
	templateBuilder.Append(Utils.ObjectToStr(model.JRZXName));
	templateBuilder.Append("</font>\r\n            </marquee>\r\n        </div>\r\n        <!--/页面头部-->\r\n        <!--页面内容-->\r\n        <div class=\"page__bd\">\r\n            <!--首页幻灯片-->\r\n            <div id=\"slider\" class=\"swiper-container\">\r\n                <div class=\"swiper-wrapper\">\r\n                    ");
	DataTable focusList = get_VoteInfo();

	foreach(DataRow dr in focusList.Rows)
	{

	templateBuilder.Append("\r\n                    <div class=\"swiper-slide\">\r\n                        <a\">\r\n                            <img src=\"" + Utils.ObjectToStr(dr["img_url"]) + "\" />\r\n                        </a>\r\n                    </div>\r\n                    ");
	}	//end for if

	templateBuilder.Append("\r\n                </div>\r\n                <div class=\"pagination\"></div>\r\n            </div>\r\n            <!--/首页幻灯片-->\r\n            <!--当前参数-->\r\n            <div class=\"weui-panel weui-panel_access\" style=\"margin-top:0;height:80px;\">\r\n                <div style=\"height:65px\">\r\n                    <center>\r\n                        <div style=\"width: 30%;position:absolute;left:5%;font-size:18px\">\r\n                            <div class=\"weui-panel__hd\" style=\"font-size: 14px;\">参加选手<br /><center><label>");
	templateBuilder.Append(Utils.ObjectToStr(VoteJoinNum));
	templateBuilder.Append("</label></center></div>\r\n                        </div>\r\n                        <div style=\"width: 30%;position:absolute;left:35%;font-size:18px\">\r\n                            <div class=\"weui-panel__hd\" style=\"font-size: 14px;\">累积投票<br /><center><label>");
	templateBuilder.Append(Utils.ObjectToStr(VoteTicketNum));
	templateBuilder.Append("</label></center></div>\r\n                        </div>\r\n                        <div style=\"width: 30%;position:absolute;left:65%;font-size:18px\">\r\n                            <div class=\"weui-panel__hd\" style=\"font-size: 14px;\">访问量<br /><center><label>");
	templateBuilder.Append(Utils.ObjectToStr(VoteBrowseNum));
	templateBuilder.Append("</label></center></div>\r\n                        </div>\r\n                    </center>\r\n                </div>\r\n            </div>\r\n            <!--时间信息-->\r\n            <div class=\"weui-panel weui-panel_access\" style=\"margin-top:0;height:110px;\">\r\n                <div style=\"height:65px;font-size: 19px;\">\r\n \r\n                        <div style=\"width: 100%\">\r\n                            <div class=\"weui-panel__hd\" style=\"font-size:15px\">投票时间:&nbsp;&nbsp;<label>&nbsp;&nbsp;");
	templateBuilder.Append(Utils.ObjectToStr(Activity_VoteBGTimeStr));
	templateBuilder.Append("至");
	templateBuilder.Append(Utils.ObjectToStr(Activity_VoteEDTimeStr));
	templateBuilder.Append("</label></div>\r\n                        </div>\r\n                        <div style=\"width:100%\">\r\n                            <div class=\"weui-panel__hd\" style=\"font-size:15px\">倒 计 时&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;<label id=\"djs\" style=\"background-color: green;color: white;\"> </label></div>\r\n                        </div>\r\n                </div>\r\n            </div>\r\n            <!--时间信息-->\r\n            <!--活动信息-->\r\n            <div class=\"weui-panel weui-panel_access\" style=\"margin-top:0;\">\r\n                <div class=\"weui-panel__hd\" style=\"background-color: #1E90FF;font-size: 17px;color: white;border-radius: 10px 10px 0 0;\">活动规则：</div>\r\n                <center>\r\n                    <div id=\"contentCss\" style=\"box-shadow: 2px 2px 2px #cccccc;width: 95%;\">");
	templateBuilder.Append(Utils.ObjectToStr(model.Vote_ActivityContent));
	templateBuilder.Append("</div>\r\n                    \r\n                </center>\r\n\r\n            </div>\r\n            <!--活动信息-->\r\n            <!--选手信息-->\r\n            <div class=\"weui-panel weui-panel_access\">\r\n                <div class=\"weui-panel__hd\" style=\"background-color: #1E90FF;font-size: 17px;color: white;border-radius: 10px 10px 0 0;\">选手列表：<a href=\"VoteRank.aspx?VoteId=");
	templateBuilder.Append(Utils.ObjectToStr(model.id));
	templateBuilder.Append("\" style=\"font-size:20px;color:white;float: right;\">更多</a></div>\r\n                <div class=\"weui-panel__bd\">\r\n                    <div class=\"photo-list\" id=\"selectItem\">\r\n                        <ul>                       \r\n                            ");
	foreach(DataRow dr in VoteJoinInfo.Rows)
	{

	templateBuilder.Append("\r\n                            <li style=\"width: 50%;\">\r\n                                <div style=\"width: 180px;height: 249px;\">\r\n                                    <center>\r\n                                        <div style=\"width: 170px;height: 229px;box-shadow: 2px 2px 2px #cccccc;\">\r\n                                            <a href=\"VoteMember.aspx?id=" + Utils.ObjectToStr(dr["id"]) + "\">\r\n                                                <img src=\"" + Utils.ObjectToStr(dr["JoinImg1"]) + "\" style=\"height:163px\" />\r\n                                                <div style=\"position: relative;top: -163px;left: -40px;background-color: #1e90ff;width: 60px;    border-radius: 0 0 5px 5px;color: white;\">" + Utils.ObjectToStr(dr["JoinNumber"]) + "号</div>\r\n                                                <div style=\"position: relative;top: -18px;left: -40px;position: relative;color: #999;font-size: 14px;\">" + Utils.ObjectToStr(dr["JoinName"]) + "</div>\r\n                                                <div style=\"position: relative;top: -20px;right: 60px;position: relative;color: red;font-size: 14px;\"><i class=\"hot\">" + Utils.ObjectToStr(dr["VoteNum"]) + "票</i></div>\r\n                                                <div style=\"width: 60px;height: 30px;position: relative;top: -48px;right:-42px;position: relative;color: white;font-size: 16px;text-align:center;background-color:#1E90FF\">投票</div>\r\n                                            </a>\r\n                                        </div>\r\n                                    </center>\r\n                                </div>\r\n\r\n                            </li>\r\n                            ");
	}	//end for if

	templateBuilder.Append("\r\n                        </ul>\r\n                    </div>\r\n                </div>\r\n            </div>\r\n            <!--/选手信息-->\r\n            <!--版权信息-->\r\n            ");

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
