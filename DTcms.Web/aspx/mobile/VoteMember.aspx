<%@ Page Language="C#" AutoEventWireup="true" Inherits="DTcms.Web.UI.Page.VoteMember" ValidateRequest="false" %>
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

	templateBuilder.Append("<!DOCTYPE html>\r\n<!--HTML5 doctype-->\r\n<html>\r\n<head>\r\n    <meta charset=\"utf-8\">\r\n    <meta name=\"viewport\" content=\"width=device-width,initial-scale=1,user-scalable=0\">\r\n    <title>投票啦！ - ");
	templateBuilder.Append(Utils.ObjectToStr(model.JoinName));
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
	templateBuilder.Append("script>\r\n    <style type=\"text/css\">\r\n        .textLine {\r\n            padding: 14px 15px 10px;\r\n            color: #999;\r\n            font-size: 12px;\r\n            position: relative;\r\n        }\r\n        .payItem {\r\n            color:#FF0000;\r\n            border: 1px solid #e5e5e5;\r\n            width:80px;\r\n            height: 35px;\r\n        }\r\n        .payItemEx {\r\n            color:#FFFFFF;\r\n            border: 1px solid #e5e5e5;\r\n            width:80px;\r\n            height: 35px;\r\n            background-color:red;\r\n        }\r\n        .payItemlabel {\r\n            font-size:20px;\r\n        }\r\n        #contentCss img {\r\n	                width: 100%;    height: 100%;\r\n        }\r\n    </style>\r\n    <script type=\"text/javascript\">\r\n        var curVoteNum = 0;\r\n        var curGiftNum = 0;\r\n        var openid = \"\";\r\n        $(document).ready(function () {\r\n            var curopenid = \"");
	templateBuilder.Append(Utils.ObjectToStr(curopenid));
	templateBuilder.Append("\";\r\n            if (curopenid != \"\")\r\n            {\r\n                openid = curopenid;\r\n                setCookie('openid', openid, 365);\r\n            }\r\n            else\r\n                openid = getCookie(\"openid\");\r\n\r\n            if (openid == null || openid == \"\")\r\n                loginWX();\r\n            //获取access_token\r\n            //20_PylHUf3w7U3olk48jG2lr9f-FlKMQI9RHXk02PHU3zmABETr6dELSDyx2Mef8vjf4gn5niNGBLM6vvDalaOXDjd0yrZh_zXaZtx3q9qB_LjmglS2-5X7sNZTMEQ4iNLZxY339zN9LcTzsJZGCXLjABAWRF\r\n		var mySwiper = new Swiper('.swiper-container',{\r\n			calculateHeight:true,\r\n			resizeReInit:true,\r\n			pagination:\".pagination\",\r\n			autoplay:5000,\r\n			paginationClickable:true\r\n		});\r\n\r\n        });\r\n        // 创建cookie\r\n        function setCookie(c_name, value, expiredays) {\r\n            var exdate = new Date();\r\n            exdate.setDate(exdate.getDate() + expiredays);\r\n            document.cookie = c_name + \"=\" + escape(value) +\r\n            ((expiredays == null) ? \"\" : \"; expires=\" + exdate.toGMTString());\r\n        }\r\n        function loginWX()\r\n        {\r\n            window.location.href = \"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("api/oauth/index.aspx?id=4&votememberid=");
	templateBuilder.Append(Utils.ObjectToStr(id));
	templateBuilder.Append("&type=1\";\r\n        }\r\n        function getCookie(c_name) {\r\n            if (document.cookie.length > 0) {\r\n                c_start = document.cookie.indexOf(c_name + \"=\")\r\n                if (c_start != -1) {\r\n                    c_start = c_start + c_name.length + 1\r\n                    c_end = document.cookie.indexOf(\";\", c_start)\r\n                    if (c_end == -1) c_end = document.cookie.length\r\n                    return unescape(document.cookie.substring(c_start, c_end))\r\n                }\r\n            }\r\n            return \"\"\r\n        }\r\n	function VoteFun()\r\n        {\r\n	    if (getCookie(\"openid\") == \"\")\r\n	    {\r\n	        alert(\"请同意之后投票！\");\r\n	        loginWX();\r\n	        return;\r\n	    }\r\n	    if (\"");
	templateBuilder.Append(Utils.ObjectToStr(isVote));
	templateBuilder.Append("\" == \"false\")\r\n	    {\r\n	        alert(\"投票活动已结束！\");\r\n	        return;\r\n	    }\r\n	    var aj = $.ajax({\r\n	        url: '");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/submit_ajax.ashx?action=Vote&id=");
	templateBuilder.Append(Utils.ObjectToStr(model.id));
	templateBuilder.Append("&openid='+openid,// 投票\r\n	        type: 'get',\r\n	        cache: false,\r\n	        dataType: 'json',\r\n	        success: function (data) {\r\n	            if (data.status == \"1\") {\r\n	                openSucced();\r\n	                //  window.location.href = \"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("api/payment/wxapipay/index_vote.aspx?pay_order_no=\" + data.order_no + \"&pay_order_amount=\" + data.order_amount;\r\n	        //        window.location.href = \"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("api/payment/wxapipay/index_vote.aspx?pay_order_no=\" + data.order_no + \"&pay_order_amount=0.01\";\r\n	            } else if (data.status == \"2\") {\r\n\r\n	                alert(\"您当前助力次数已达上线，请明天再次助力该好友吧！\");\r\n	            } else if (data.status == \"3\") {\r\n\r\n	                alert(\"您已超过当日最多投票数，明天再来助力该好友吧！\");\r\n	            } else if (data.status == \"4\") {\r\n\r\n	                alert(\"助力时间间隔太短，请稍后再试！\");\r\n	            } else{\r\n\r\n	                alert(\"异常,请重新刷新！\");\r\n	            }\r\n	        },\r\n	        error: function () {\r\n	            // view(\"异常！\");    \r\n	            alert(\"异常！\");\r\n	        }\r\n	    });\r\n	 //   clickSubmit('");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/submit_ajax.ashx?action=Vote&id=");
	templateBuilder.Append(Utils.ObjectToStr(model.id));
	templateBuilder.Append("');\r\n	}\r\n	function openSucced()\r\n	{\r\n	    $(\"#infoPage\").hide();\r\n	    $(\"#gopayPage\").show();\r\n	}\r\n\r\n	function GiftFun() {\r\n\r\n	    if (getCookie(\"openid\") == \"\") {\r\n	        alert(\"请同意之后投票！\");\r\n	        return;\r\n	    }\r\n	    if (\"");
	templateBuilder.Append(Utils.ObjectToStr(isVote));
	templateBuilder.Append("\" == \"false\")\r\n	    {\r\n            alert(\"投票活动已结束！\");\r\n            return;\r\n	    }\r\n	    $(\"#infoPage\").hide();\r\n	    $(\"#payPage\").show();\r\n	//    $(\"#paypageimg\").hide();\r\n	}\r\n	function GiftNum(obj)\r\n	{\r\n	    if (obj != 0)\r\n	    {\r\n	        curGiftNum = obj;\r\n	        curVoteNum = obj * 3;\r\n	        $(\"#NumStr\").html(\"为 ");
	templateBuilder.Append(Utils.ObjectToStr(model.JoinName));
	templateBuilder.Append(" 送\" + obj + \"钻 = \" + obj * 3 + \"票\");\r\n	        $(\"#setVoteValuepa\").hide();\r\n	    }\r\n	    else\r\n	    {\r\n	        $(\"#setVoteValuepa\").show();\r\n	    }\r\n\r\n	    $(\"#div10\").attr(\"class\", \"payItem\");\r\n	    $(\"#div50\").attr(\"class\", \"payItem\");\r\n	    $(\"#div100\").attr(\"class\", \"payItem\");\r\n	    $(\"#div300\").attr(\"class\", \"payItem\");\r\n	    $(\"#div500\").attr(\"class\", \"payItem\");\r\n	    $(\"#div0\").attr(\"class\", \"payItem\");\r\n\r\n\r\n	    $(\"#div\" + obj).attr(\"class\", \"payItemEx\");\r\n	//    alert(obj);\r\n	}\r\n	function editVoteFun()\r\n	{\r\n	    var str = $(\"#setVoteValue\").val();\r\n	    if (str == null || str == \"\")\r\n	        return;\r\n\r\n	    try{\r\n	        curGiftNum =  parseInt(str);\r\n	        curVoteNum = curGiftNum * 3;\r\n	        if (curGiftNum <= 0)\r\n	            alert(\"输入金额有误，请重新输入！\");\r\n	        $(\"#NumStr\").html(\"为 ");
	templateBuilder.Append(Utils.ObjectToStr(model.JoinName));
	templateBuilder.Append(" 送\" + curGiftNum + \"钻 = \" + curGiftNum * 3 + \"票\");\r\n	    }\r\n	    catch(ex)\r\n	    {\r\n	        alert(\"输入金额有误，请重新输入！\");\r\n	    }\r\n	}\r\n	function payFun()\r\n	{\r\n	    //1.$.ajax带json数据的异步请求  \r\n	    var aj = $.ajax({\r\n	        url: '");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/submit_ajax.ashx?action=order_save_vote&site_id=2&openid=' + openid + '&gift=' + curGiftNum + '&voteid=");
	templateBuilder.Append(Utils.ObjectToStr(id));
	templateBuilder.Append("',// 跳转到 action    \r\n	        //	        url: '");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/submit_ajax.ashx?action=order_save_vote&site_id=2&openid=' + openid + '&gift=' + curGiftNum,// 跳转到 action \r\n	        type: 'get',\r\n	        cache: false,\r\n	        dataType: 'json',\r\n	        success: function (data) {\r\n	            if (data.status == \"1\") {\r\n	            //    alert(\"打赏成功\");\r\n	           //     var t = setTimeout(\"reloadVotemember()\", 1000);\r\n	                  window.location.href = \"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("api/payment/wxapipay/index_vote.aspx?pay_order_no=\" + data.order_no + \"&pay_order_amount=\" + data.order_amount;\r\n	            } else {\r\n	                view(data.msg);\r\n	            }\r\n	        },\r\n	        error: function () {\r\n	            // view(\"异常！\");    \r\n	            alert(\"异常！\");\r\n	        }\r\n	    });\r\n	}\r\n	function reloadVotemember()\r\n	{\r\n	    window.location.href = \"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("aspx/mobile/VoteMember.aspx?id=");
	templateBuilder.Append(Utils.ObjectToStr(id));
	templateBuilder.Append("\";\r\n	}\r\n	function reloadFun()\r\n	{\r\n	    location.reload();  \r\n	}\r\n    </");
	templateBuilder.Append("script>\r\n</head>\r\n\r\n<body style=\"background-color:#ffffff\" id=\"news\" ontouchstart>\r\n    <div class=\"page\" id=\"payPage\" style=\"background-color:white;width:100%;height:100%;position:relative;z-index:2;display: none;\">\r\n        <!--页面头部-->\r\n        <div class=\"header\">\r\n            <marquee direction=\"left\" behavior=\"scroll\" scrollamount=\"5\" scrolldelay=\"10\" loop=\"99\" height=\"30\" bgcolor=\"#0a0a0a6e\">\r\n                <font face=\"隶书\" color=\"white\" size=\"3\">");
	templateBuilder.Append(Utils.ObjectToStr(model2.Activity_Title));
	templateBuilder.Append(" &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ");
	templateBuilder.Append(Utils.ObjectToStr(model2.JRZXName));
	templateBuilder.Append("</font>\r\n            </marquee>\r\n        </div>\r\n        <!--/页面头部-->\r\n        <!--页面内容-->\r\n        <div class=\"page__bd\">\r\n            <br />\r\n            <div style=\"width:100%;height:120px\" >\r\n                <center>\r\n                    <div id=\"paypageimg\" style=\"width:100px;height:100px;border-radius: 50%;overflow:hidden;border: 2px solid #ffffff;\" onclick=\"\">\r\n                        <a>\r\n                            <img src=\"");
	templateBuilder.Append(Utils.ObjectToStr(model.JoinImg1));
	templateBuilder.Append("\" style=\"width:110px\" />\r\n                        </a>\r\n                    </div>\r\n                </center>\r\n            </div>\r\n            <div style=\"width:100%;height:50px;text-align:center\" id=\"NumStr\">\r\n                为 ");
	templateBuilder.Append(Utils.ObjectToStr(model.JoinName));
	templateBuilder.Append(" 送10钻 = 30票\r\n            </div>\r\n                <!--时间信息-->\r\n                <div class=\"weui-panel_access\" style=\"margin-top:0;height:300px\">\r\n                    <center>\r\n                        <table width=\"250\">\r\n                            <tr>\r\n                                <td><center><div id=\"div10\" class=\"payItem\" onclick=\"GiftNum('10')\"><center><label class=\"payItemlabel\">10</label>钻</center></div></center></td>\r\n                                <td><center><div id=\"div50\" class=\"payItem\" onclick=\"GiftNum('50')\"><center><label class=\"payItemlabel\">50</label>钻</center></div></center></td>\r\n                                <td><center><div id=\"div100\" class=\"payItem\" onclick=\"GiftNum('100')\"><center><label class=\"payItemlabel\">100</label>钻</center></div></center></td>\r\n                            </tr>\r\n                            <tr>\r\n                                <td><center><div id=\"div300\" class=\"payItem\" onclick=\"GiftNum('300')\"><center><label class=\"payItemlabel\">300</label>钻</center></div></center></td>\r\n                                <td><center><div id=\"div500\" class=\"payItem\" onclick=\"GiftNum('500')\"><center><label class=\"payItemlabel\">500</label>钻</center></div></center></td>\r\n                                <td><center><div id=\"div0\" class=\"payItem\" onclick=\"GiftNum('0')\"><center><label class=\"payItemlabel\">自定义</label></center></div></center></td>\r\n                            </tr>\r\n                        </table>\r\n                        <div class=\"weui-cell__bd\" style=\"display:none\" id=\"setVoteValuepa\">\r\n                            <input id=\"setVoteValue\" name=\"setVoteValue\" type=\"text\" class=\"weui-input\" placeholder=\"请输入打赏的金额，不能超过5000元\" style=\"width: 250px;height: 2.47058824em;border-radius: 4px;    border: 1px solid #e5e5e5;\" onchange=\"editVoteFun()\" />\r\n                        </div>\r\n                        <br />\r\n                        <div style=\"width:250px;height:35px;background-color:limegreen;text-align:center;color:white;font-size:20px;border-radius: 6px;\" onclick=\"payFun()\">\r\n                            确认打赏\r\n                        </div>\r\n                    </center>\r\n\r\n                </div>\r\n\r\n                <!--时间信息-->\r\n                <div class=\"weui-tab foot-nav\">\r\n                    <div class=\"weui-tab__panel\">\r\n\r\n                    </div>\r\n\r\n                </div>\r\n            </div>\r\n        <!--/页面内容-->\r\n    </div>\r\n    <div class=\"page\" id=\"gopayPage\" style=\"background-color:white;width:100%;height:100%;position:relative;z-index:2;display: none;\">\r\n        <!--页面头部-->\r\n        <div class=\"header\">\r\n            <marquee direction=\"left\" behavior=\"scroll\" scrollamount=\"5\" scrolldelay=\"10\" loop=\"99\" height=\"30\" bgcolor=\"#0a0a0a6e\">\r\n                <font face=\"隶书\" color=\"white\" size=\"3\">");
	templateBuilder.Append(Utils.ObjectToStr(model2.Activity_Title));
	templateBuilder.Append(" &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ");
	templateBuilder.Append(Utils.ObjectToStr(model2.JRZXName));
	templateBuilder.Append("</font>\r\n            </marquee>\r\n        </div>\r\n        <!--/页面头部-->\r\n        <!--页面内容-->\r\n        <div class=\"page__bd\">\r\n            <br />\r\n            <div style=\"width:100%;height:50px;text-align:center;font-size: 30px;\">\r\n                成功为");
	templateBuilder.Append(Utils.ObjectToStr(model.JoinName));
	templateBuilder.Append("投票!\r\n            </div>\r\n            <div style=\"width:100%;height:120px\">\r\n                <center>\r\n                    <div id=\"paypageimg\" style=\"width:100px;height:100px;border-radius: 50%;overflow:hidden;border: 2px solid #ffffff;\" onclick=\"\">\r\n                        <a>\r\n                            <img src=\"../../templates/mobile/images/zs.png\" style=\"width:110px\" />\r\n                        </a>\r\n                    </div>\r\n                </center>\r\n                <center style=\"font-size: 23px;\">再打赏钟意的Ta吧！</center>\r\n            </div>\r\n            <br />\r\n            <!--时间信息-->\r\n            <div class=\"weui-panel_access\" style=\"margin-top:0;height:300px\">\r\n                    <br />\r\n                <center>\r\n                    <div style=\"width:200px;height:35px;background-color:orange;text-align:center;color:white;font-size:20px;border-radius: 6px;\" onclick=\"GiftFun()\">\r\n                        打赏\r\n                    </div>\r\n                    <br />\r\n                    <div style=\"width:200px;height:35px;background-color:blanchedalmond;text-align:center;color:white;font-size:20px;border-radius: 6px;\" onclick=\"reloadFun()\">\r\n                        返回\r\n                    </div>\r\n                    <br />\r\n                    <br />\r\n                    <a>\r\n                        <img src=\"");
	templateBuilder.Append(Utils.ObjectToStr(JRZXURLStr));
	templateBuilder.Append("\" style=\"width: 200px;height: 200px;\" />\r\n                    </a>\r\n                </center>\r\n            </div>\r\n            <div style=\"width:100%;height:120px\">\r\n                <center>\r\n                    <div id=\"paypageimg\" style=\"width:100px;height:100px;border-radius: 50%;overflow:hidden;border: 2px solid #ffffff;\" onclick=\"\">\r\n                        <a>\r\n                            <img src=\"");
	templateBuilder.Append(Utils.ObjectToStr(model.JoinImg2));
	templateBuilder.Append("\" style=\"width:110px\" />\r\n                        </a>\r\n                    </div>\r\n                </center>\r\n            </div>\r\n        </div>\r\n        <!--/页面内容-->\r\n    </div>\r\n    <div class=\"page\" id=\"infoPage\">\r\n        <!--页面头部-->\r\n        <div class=\"header\">\r\n            <marquee direction=\"left\" behavior=\"scroll\" scrollamount=\"5\" scrolldelay=\"10\" loop=\"99\" height=\"30\" bgcolor=\"#0a0a0a6e\" style=\"height: 50px;\">\r\n                <font face=\"隶书\" color=\"white\" size=\"3\">");
	templateBuilder.Append(Utils.ObjectToStr(model2.Activity_Title));
	templateBuilder.Append(" &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ");
	templateBuilder.Append(Utils.ObjectToStr(model2.JRZXName));
	templateBuilder.Append("</font>\r\n            </marquee>\r\n        </div>\r\n        <!--/页面头部-->\r\n        <!--页面内容-->\r\n        <div class=\"page__bd\">\r\n            <!--首页幻灯片-->\r\n            <div id=\"slider\" class=\"swiper-container\">\r\n                <div class=\"swiper-wrapper\">\r\n                    ");
	DataTable focusList = get_VoteInfo();

	foreach(DataRow dr in focusList.Rows)
	{

	templateBuilder.Append("\r\n                    <div class=\"swiper-slide\">\r\n                        <a>\r\n                            <img src=\"" + Utils.ObjectToStr(dr["img_url"]) + "\" style=\"width: 375px;height: 375px;\"/>\r\n                        </a>\r\n                    </div>\r\n                    ");
	}	//end for if

	templateBuilder.Append("\r\n                </div>\r\n                <div class=\"pagination\"></div>\r\n            </div>\r\n            <!--/首页幻灯片-->\r\n            <!--当前参数-->\r\n            <div class=\"weui-panel weui-panel_access\" style=\"margin-top:0;height:80px;\">\r\n                <div style=\"height:65px\">\r\n                    <center>\r\n                        <div style=\"width: 30%;position:absolute;left:5%;font-size:18px\">\r\n                            <div class=\"weui-panel__hd\" style=\"font-size: 14px;\">当前排名<br /><center><label>");
	templateBuilder.Append(Utils.ObjectToStr(RankNum));
	templateBuilder.Append("</label></center></div>\r\n                        </div>\r\n                        <div style=\"width: 30%;position:absolute;left:35%;font-size:18px\">\r\n                            <div class=\"weui-panel__hd\" style=\"font-size: 14px;\">累积票数<br /><center><label>");
	templateBuilder.Append(Utils.ObjectToStr(model.VoteNum));
	templateBuilder.Append("</label></center></div>\r\n                        </div>\r\n                        <div style=\"width: 30%;position:absolute;left:65%;font-size:18px\">\r\n                            <div class=\"weui-panel__hd\" style=\"font-size: 14px;\">差上名票数<br /><center><label>");
	templateBuilder.Append(Utils.ObjectToStr(LastVoteNum));
	templateBuilder.Append("</label></center></div>\r\n                        </div>\r\n                    </center>\r\n                </div>\r\n            </div>\r\n            <!--时间信息-->\r\n            <div class=\"weui-panel_access\" style=\"margin-top:0;height:200px\">\r\n                <div class=\"weui-panel__hd\" style=\"background-color: #1E90FF;font-size: 17px;color: white;border-radius: 10px 10px 0 0;\">选手信息：</div>\r\n                <div style=\"height:150px\">\r\n                    <div class=\"textLine\">\r\n                        <div style=\"position:relative;font-size: 17px;\">名称:<label>");
	templateBuilder.Append(Utils.ObjectToStr(model.JoinName));
	templateBuilder.Append("</label></div>\r\n                        <div style=\"position:relative;font-size: 17px;\">\r\n                            编号:<label>");
	templateBuilder.Append(Utils.ObjectToStr(model.JoinNumber));
	templateBuilder.Append("</label>\r\n                        </div>\r\n                        <div style=\"position:relative;font-size: 17px;\">\r\n                            商家地址:<label>");
	templateBuilder.Append(Utils.ObjectToStr(model.JoinAddress));
	templateBuilder.Append("</label>\r\n                        </div>\r\n\r\n                </div>\r\n            </div>\r\n            <!--时间信息-->\r\n            <!--活动信息-->\r\n            <div class=\"weui-panel weui-panel_access\" style=\"margin-top:0;\">\r\n                <div class=\"weui-panel__hd\" style=\"background-color: #1E90FF;font-size: 17px;color: white;border-radius: 10px 10px 0 0;\">选手说明：</div>\r\n                <center>\r\n                    <div id=\"contentCss\" style=\"box-shadow: 2px 2px 2px #cccccc;width: 100%;\">\r\n                        ");
	DataTable focusListPic = get_VoteInfoPic();

	foreach(DataRow drpic in focusListPic.Rows)
	{

	templateBuilder.Append("\r\n                            <a>\r\n                                <img src=\"" + Utils.ObjectToStr(drpic["img_url"]) + "\" style=\"width: 100%;height: 375px;\" />\r\n                            </a>\r\n                        ");
	}	//end for if

	templateBuilder.Append("\r\n                    </div>\r\n                </center>\r\n\r\n            </div>\r\n            <!--活动信息-->\r\n            <!--版权信息-->\r\n            ");

	templateBuilder.Append("<div class=\"weui-footer footer\">\r\n    <p class=\"weui-footer__text\">");
	templateBuilder.Append(Utils.ObjectToStr(site.copyright));
	templateBuilder.Append("</p>\r\n</div>");


	templateBuilder.Append("\r\n            <!--/版权信息-->\r\n            <div class=\"weui-tab foot-nav\">\r\n                <div class=\"weui-tab__panel\">\r\n\r\n                </div>\r\n                <div class=\"weui-tabbar\">\r\n                    <div class=\"weui-tabbar\" style=\"position: absolute;top: -90px;\">\r\n                        <a onclick=\"VoteFun()\" class=\"weui-tabbar__item\" style=\"background-color:red\">\r\n                            <p class=\"weui-tabbar__label\" style=\"color:white;font-size:16px\">给Ta投票</p>\r\n                        </a>\r\n                        <a onclick=\"GiftFun()\" class=\"weui-tabbar__item\" style=\"background-color:blue\">\r\n                            <p class=\"weui-tabbar__label\" style=\"color:white;font-size:16px\">打赏Ta</p>\r\n                        </a>\r\n                    </div>\r\n                    <div class=\"weui-tabbar\">\r\n                        <a href=\"goVote.aspx?id=");
	templateBuilder.Append(Utils.ObjectToStr(model2.id));
	templateBuilder.Append("\" class=\"weui-tabbar__item\">\r\n                            <i class=\"iconfont icon-home weui-tabbar__icon\"></i>\r\n                            <p class=\"weui-tabbar__label\">首页</p>\r\n                        </a>\r\n                        <a href=\"VoteRank.aspx?VoteId=");
	templateBuilder.Append(Utils.ObjectToStr(model2.id));
	templateBuilder.Append("\" class=\"weui-tabbar__item\">\r\n                            <i class=\"iconfont icon-view weui-tabbar__icon\"></i>\r\n                            <p class=\"weui-tabbar__label\">排名</p>\r\n                        </a>\r\n                        <a href=\"VoteGift.aspx?VoteId=");
	templateBuilder.Append(Utils.ObjectToStr(model2.id));
	templateBuilder.Append("\" class=\"weui-tabbar__item\">\r\n                            <i class=\"iconfont icon-order weui-tabbar__icon\"></i>\r\n                            <p class=\"weui-tabbar__label\">奖品</p>\r\n                        </a>\r\n                        <a href=\"VoteJoin.aspx?VoteId=");
	templateBuilder.Append(Utils.ObjectToStr(model2.id));
	templateBuilder.Append("\" class=\"weui-tabbar__item\">\r\n                            <i class=\"iconfont icon-user weui-tabbar__icon\"></i>\r\n                            <p class=\"weui-tabbar__label\">报名</p>\r\n                        </a>\r\n                    </div>\r\n                </div>\r\n            </div>\r\n        </div>\r\n        <!--/页面内容-->\r\n    </div>\r\n</body>\r\n</html>\r\n");
	Response.Write(templateBuilder.ToString());
}
</script>
