<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VoteList_Page.aspx.cs" Inherits="DTcms.Web.admin.VoteSystem.VoteList_Page"%>
<%@ Import namespace="DTcms.Common" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,initial-scale=1.0,user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<title>订单管理</title>
<link rel="stylesheet" type="text/css" href="../../scripts/artdialog/ui-dialog.css" />
<link rel="stylesheet" type="text/css" href="../../css/pagination.css" />
<link rel="stylesheet" type="text/css" href="../skin/icon/iconfont.css" />
<link rel="stylesheet" type="text/css" href="../skin/default/style.css" />
<script type="text/javascript" src="../../scripts/jquery/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="../../scripts/artdialog/dialog-plus-min.js"></script>
<script type="text/javascript" charset="utf-8" src="../js/laymain.js"></script>
<script type="text/javascript" charset="utf-8" src="../js/common.js"></script>
<style>
    .EXDatetime
    {
      background-color:forestgreen;
      color: white;
      padding:3px;
    }
</style>
<script>
    $(function () {
        $('.EXDatetime').each(function(i){
            var datesrt = $(this).attr('timeValue');
            var dateEx = Date.now();
            var endDate = new Date(datesrt);
            if ((datesrt != "" || datesrt != null) && (endDate > dateEx))
            {
            //    var date = new Date(datesrt);
            //    var dateEx = Date.now(); -date;
                TimeDown($(this), datesrt);
            }
            else
            {
                $(this).text("已结束");
            }

            
        });
    });
        /*
        时间倒计时插件
        TimeDown.js
        */
        function TimeDown(obj, endDateStr) {
            //结束时间
            var endDate = new Date(endDateStr);
            //当前时间
            var nowDate = new Date();
            if (endDate < nowDate)
            {
                obj.text("已结束");
                return;
            }
               
            //相差的总秒数
            var totalSeconds = parseInt((endDate - nowDate) / 1000);
            //天数
            var days = Math.floor(totalSeconds / (60 * 60 * 24));
            //取模（余数）
            var modulo = totalSeconds % (60 * 60 * 24);
            //小时数
            var hours = Math.floor(modulo / (60 * 60));
            modulo = modulo % (60 * 60);
            //分钟
            var minutes = Math.floor(modulo / 60);
            //秒
            var seconds = modulo % 60;
            //输出到页面
            obj.text( days + "天" + hours + "小时" + minutes + "分钟" + seconds + "秒");
          //  obj.innerHTML = "还剩:" + days + "天" + hours + "小时" + minutes + "分钟" + seconds + "秒";
            //延迟一秒执行自己
            setTimeout(function () {
                TimeDown(obj, endDateStr);
            }, 1000)
        }


        function ShowUrlScript(obj) {
            var objNum = arguments.length;
            var d = top.dialog({
                id: 'VoteActivityUrl',
                width: "700",        //宽度
                height: "400",        //高度
                title: '查看链接',
                url: 'VoteSystem/VoteActivityUrl.aspx?type=0&id=' + obj
            }).showModal();
        }
    //前三名锁定设置
        function LockRankt(obj) {
            var objNum = arguments.length;
            var d = top.dialog({
                id: 'LockRankt',
                width: "500",        //宽度
                height: "400",        //高度
                title: '锁定前三名',
                url: 'VoteSystem/LockRankt.aspx?type=0&id=' + obj
            }).showModal();
        }
</script>
</head>

<body class="mainbody">
<form id="form1" runat="server">
<!--导航栏-->
<div class="location">
  <a href="javascript:history.back(-1);" class="back"><i class="iconfont icon-up"></i><span>返回上一页</span></a>
  <a href="../center.aspx" class="home"><i class="iconfont icon-home"></i><span>首页</span></a>
  <i class="arrow iconfont icon-arrow-right"></i>
  <span>订单列表</span>
</div>
<!--/导航栏-->

<!--工具栏-->
<div id="floatHead" class="toolbar-wrap">
  <div class="toolbar">
    <div class="box-wrap">
      <a class="menu-btn"><i class="iconfont icon-more"></i></a>
      <div class="l-list">
        <ul class="icon-list">
          <li><a href="VoteEdit.aspx?action=<%=DTEnums.ActionEnum.Add %>"><i class="iconfont icon-close"></i><span>新增</span></a></li>
          <li><a href="javascript:;" onclick="checkAll(this);"><i class="iconfont icon-check"></i><span>全选</span></a></li>
          <li><asp:LinkButton ID="btnAudit" runat="server" onclick="btnAudit_Click"><i class="iconfont icon-survey"></i><span>审核</span></asp:LinkButton></li>
          <li><asp:LinkButton ID="LinkButton1" runat="server" onclick="btnAudit_ClickKS"><i class="iconfont icon-survey"></i><span>开始</span></asp:LinkButton></li>
          <li><asp:LinkButton ID="LinkButton2" runat="server"  onclick="btnAudit_ClickJS"><i class="iconfont icon-survey"></i><span>结束</span></asp:LinkButton></li>
          <li><asp:LinkButton ID="LinkButton4" runat="server"  onclick="btnAudit_Click_Copy"><i class="iconfont icon-survey"></i><span>复制添加活动</span></asp:LinkButton></li>
            
          <li><asp:LinkButton ID="LinkButton3" runat="server" onclick="btnAudit_ClickSC"><i class="iconfont icon-survey"></i><span>删除</span></asp:LinkButton></li>
        </ul>
        <div class="menu-list">
       
          <div class="rule-single-select">
            <asp:DropDownList ID="DateDownList" runat="server" AutoPostBack="True" onselectedindexchanged="ddlDateTime_SelectedIndexChanged">

            </asp:DropDownList>
          </div>
        </div>

      </div>
      <div class="r-list">
        <asp:TextBox ID="txtKeywords" runat="server" CssClass="keyword" placeholder="搜索活动名称"/>
        <asp:LinkButton ID="lbtnSearch" runat="server" CssClass="btn-search" onclick="btnSearch_Click"><i class="iconfont icon-search"></i></asp:LinkButton>
      </div>
    </div>
  </div>
</div>
<!--/工具栏-->

<!--列表-->
<div class="table-container">
<asp:Repeater ID="rptList" runat="server">
<HeaderTemplate>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="ltable">
  <tr>
    <th width="8%">选择</th>
    <th width="6%" align="left">图片</th>
    <th align="left">活动标题</th>
    <th align="left" width="15%">活动时间</th>
    <th width="10%">当前状态</th> 
    <th width="5%">充值金额</th> 
    <th width="10%">链接</th> 
    <th width="10%">备注</th> 
    <th align="left" width="6%">当前参加人数</th>
    <th width="8%">操作</th>
  </tr>
</HeaderTemplate>
<ItemTemplate>
  <tr>
    <td align="center">
      <asp:CheckBox ID="chkId" CssClass="checkall" runat="server" Value='<%#Eval("id")%>' style="vertical-align:middle;" />
      <asp:HiddenField ID="hidId" Value='<%#Eval("id")%>' runat="server" />
    </td>
    <td><a href="VoteEdit.aspx?id=<%#Eval("id")%>&action=<%=DTEnums.ActionEnum.Edit %>"><img src='<%#Eval("Vote_Pic1").ToString() %>'style="width:60px" /></a></td>
    <td><a href="VoteJoinPage.aspx?action=&VoteId=<%#Eval("id")%>"><%#Eval("Activity_Title")%></a></td>
    <td><center><%#Eval("Activity_VoteBGTime").ToString() %><br />
        <%#Eval("Activity_VoteEDTime").ToString() %>
        <br />
        <label class="EXDatetime" timeValue="<%#Eval("Activity_VoteEDTime").ToString() %>"><%#Eval("EXDatetime").ToString() %></label>
        </center>
    </td>
    <td><center><%#Eval("Rules_VoteSta").ToString() == "0" ? "待审核" : "已审核" %><br /><%#Eval("VoteSta").ToString() == "0" ? "未开始" : (Eval("VoteSta").ToString() == "1" ? "投票中": "已结束" ) %></center></td>  
    <td><u><font color="red"><center><%#Eval("Gift_Votes1_ZS").ToString()%></center></font></u></td>
    <td><center><a onclick="ShowUrlScript(<%#Eval("id").ToString()%>)">查看链接</a></center></td>
    <td><center><%#Eval("Activity_Remarks").ToString()%></center></td>
    <td><center><%#Eval("JoinMemberNum").ToString()%></center></td>
    <td><a href="VoteJoinPage.aspx?action=&VoteId=<%#Eval("id")%>">人员管理</a><br />
        <a href="VoteEdit.aspx?id=<%#Eval("id")%>&action=<%=DTEnums.ActionEnum.Edit %>">编辑</a>
        <br /><a onclick="LockRankt(<%#Eval("id").ToString()%>)" style="color:#0065D9">设置锁定前三名</a>
    </td>
  </tr>
</ItemTemplate>
<FooterTemplate>
  <%#rptList.Items.Count == 0 ? "<tr><td align=\"center\" colspan=\"9\">暂无记录</td></tr>" : ""%>
</table>
</FooterTemplate>
</asp:Repeater>
</div>
<!--/列表-->

<!--内容底部-->
<div class="line20"></div>
<div class="pagelist">
  <div class="l-btns">
    <span>显示</span><asp:TextBox ID="txtPageNum" runat="server" CssClass="pagenum" onkeydown="return checkNumber(event);"
                OnTextChanged="txtPageNum_TextChanged" AutoPostBack="True"></asp:TextBox><span>条/页</span>
  </div>
  <div id="PageContent" runat="server" class="default"></div>
</div>
<!--/内容底部-->

</form>
</body>
</html>