<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VoteJoinPage.aspx.cs" Inherits="DTcms.Web.admin.VoteSystem.VoteJoinPage"  ValidateRequest="false"%>
<%@ Import namespace="DTcms.Common" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,initial-scale=1.0,user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<title>待审核管理</title>
<link rel="stylesheet" type="text/css" href="../../scripts/artdialog/ui-dialog.css" />
<link rel="stylesheet" type="text/css" href="../../css/pagination.css" />
<link rel="stylesheet" type="text/css" href="../skin/icon/iconfont.css" />
<link rel="stylesheet" type="text/css" href="../skin/default/style.css" />
<script type="text/javascript" src="../../scripts/jquery/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="../../scripts/artdialog/dialog-plus-min.js"></script>
<script type="text/javascript" charset="utf-8" src="../js/laymain.js"></script>
<script type="text/javascript" charset="utf-8" src="../js/common.js"></script>
    <script>
        function ShowUrlScript(obj) {
            var objNum = arguments.length;
            var d = top.dialog({
                id: 'VoteActivityUrl',
                width: "700",        //宽度
                height: "400",        //高度
                title: '查看链接',
                url: 'VoteSystem/VoteActivityUrl.aspx?type=1&id=' + obj
            }).showModal();
        }
        function AddVoteNum(obj)
        {
            var voteid = obj.split('_')[1];
            var curVote = $("#" + obj).val();
            if (curVote == "" || curVote == "0")
            {
                alert("请输入数字");
                return;
            }
            var aj = $.ajax({
                url: '../../tools/submit_ajax.ashx?action=Vote_V&id=' + voteid + '&VoteNum=' + curVote,// 投票
                type: 'get',
                cache: false,
                dataType: 'json',
                success: function (data) {
                    if (data.status == "1") {
                        window.location.reload();
                    } 
                },
                error: function () {
                    // view("异常！");    
                    //alert("异常！");
                }
            });
        }

        function AddBrowseNum(obj) {
            var voteid = obj.split('_')[1];
            var curBrowse = $("#" + obj).val();
            if (curBrowse == "" || curBrowse == "0") {
                alert("请输入数字");
                return;
            }
            var aj = $.ajax({
                url: '../../tools/submit_ajax.ashx?action=Browse_V&id=' + voteid + '&BrowseNum=' + curBrowse,// 投票
                type: 'get',
                cache: false,
                dataType: 'json',
                success: function (data) {
                    if (data.status == "1") {
                        window.location.reload();
                    }
                },
                error: function () {
                    // view("异常！");    
                    alert("异常！");
                }
            });
        }

        function AddGiftNum(obj) {
            var voteid = obj.split('_')[1];
            var curGift = $("#" + obj).val();
            if (curGift == "" || curGift == "0") {
                alert("请输入数字");
                return;
            }
            var aj = $.ajax({
                url: '../../tools/submit_ajax.ashx?action=GiftVote_V&id=' + voteid + '&GiftNum=' + curGift,// 投票
                type: 'get',
                cache: false,
                dataType: 'json',
                success: function (data) {
                    if (data.status == "1") {
                        window.location.reload();
                    }
                },
                error: function () {
                    // view("异常！");    
                    alert("异常！");
                }
            });
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
  <span>选手列表</span>
</div>
<!--/导航栏-->

<!--工具栏-->
<div id="floatHead" class="toolbar-wrap">
  <div class="toolbar">
    <div class="box-wrap">
      <a class="menu-btn"><i class="iconfont icon-more"></i></a>
      <div class="l-list">
        <ul class="icon-list">
          <li><a href="VoteJoinEdit.aspx?action=<%=DTEnums.ActionEnum.Add %>&VoteId=<%=VoteId.ToString() %>"><i class="iconfont icon-close"></i><span>新增</span></a></li>
          <li><a href="javascript:;" onclick="checkAll(this);"><i class="iconfont icon-check"></i><span>全选</span></a></li>
          <li><asp:LinkButton ID="btnAudit" runat="server"  onclick="btnAudit_Click"><i class="iconfont icon-survey"></i><span>审核</span></asp:LinkButton></li>
          <li><asp:LinkButton ID="LinkButton1" runat="server" onclick="btnAudit_ClickSD"><i class="iconfont icon-survey"></i><span>锁定</span></asp:LinkButton></li>
            
          <li><asp:LinkButton ID="LinkButton2" runat="server"  onclick="btnAudit_ClickDC"><i class="iconfont icon-survey"></i><span>导出数据</span></asp:LinkButton></li>
          <li><asp:LinkButton ID="LinkButton3" runat="server"  onclick="btnAudit_ClickYJSJJP"><i class="iconfont icon-survey"></i><span>一键随机加票</span></asp:LinkButton></li>
          <li><asp:LinkButton ID="LinkButton4" runat="server"  onclick="btnAudit_ClickXTZDJP"><i class="iconfont icon-survey"></i><span>系统自动加票</span></asp:LinkButton></li>
          <li><asp:LinkButton ID="LinkButton5" runat="server"  onclick="btnAudit_ClickJRZX"><i class="iconfont icon-survey"></i><span>设置为今日之星</span></asp:LinkButton></li>
         <!-- <li><asp:LinkButton ID="btnDelete" runat="server" OnClientClick="return ExePostBack('btnDelete','只允许删除已作废订单，是否继续？');" onclick="btnDelete_Click"><i class="iconfont icon-delete"></i><span>删除</span></asp:LinkButton></li>-->
        </ul>
        <div class="menu-list">
       
        </div>

      </div>
      <div class="r-list">
        <asp:TextBox ID="txtKeywords" runat="server" CssClass="keyword"  placeholder="搜索店铺名称"/>
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
    <th width="4%">选择</th>
    <th width="4%" align="left">选手编号</th>
    <th width="6%" align="left">图片</th>
    <th align="left" width="12%">选手店名</th>
    <th align="left" width="10%">选手手机号码</th>
    <th width="10%">票数</th>
    <th width="10%">礼物</th>
    <th width="10%">浏览数</th>
    <th width="8%">审核通过</th>
    <th align="left" width="5%">选手状态</th>
    <th width="10%">链接</th> 
    <th width="8%">操作</th>
  </tr>
</HeaderTemplate>
<ItemTemplate>
  <tr>
    <td align="center">
      <asp:CheckBox ID="chkId" CssClass="checkall" runat="server" Value='<%#Eval("id")%>' style="vertical-align:middle;" />
      <asp:HiddenField ID="hidId" Value='<%#Eval("id")%>' runat="server" />
    </td>
    <td><a href="VoteJoinEdit.aspx?action=<%=DTEnums.ActionEnum.Edit %>&id=<%#Eval("id")%>"><%#Eval("JoinNumber")%></a></td>
    <td><img src='<%#Eval("JoinImg1").ToString() %>'style="width:60px" /></td>
    <td><%#Eval("JoinName").ToString() %></td>
    <td><%#Eval("JoinTel").ToString() %></td>
    <td><%#Eval("VoteNum_ZS").ToString() %>/<%#Eval("VoteNum").ToString() %> <br /><input type="text" name="fname" id="AddVoteNum_<%#Eval("id")%>" style="width:20px" value="0"/> <a onclick='AddVoteNum("AddVoteNum_<%#Eval("id")%>")' style="background-color:#1ab394;color:white;padding:3px">加</a></td>
    <td><%#Eval("GiftNum_ZS").ToString() %> /<%#Eval("GiftNum").ToString() %> <br /><input type="text" name="fname" id="AddGiftNum_<%#Eval("id")%>" style="width:20px" value="0"/> <a onclick='AddGiftNum("AddGiftNum_<%#Eval("id")%>")' style="background-color:#1ab394;color:white;padding:3px">加</a> </td>
    <td><%#Eval("BrowseNum_XN").ToString()%> /<%#Eval("BrowseNum").ToString() %><br /><input type="text" name="fname" id="AddBrowseNum_<%#Eval("id")%>" style="width:20px" value="0"/> <a onclick='AddBrowseNum("AddBrowseNum_<%#Eval("id")%>")' style="background-color:#1ab394;color:white;padding:3px">加</a> </td>
    <td><center><%#Eval("JoinSta").ToString() == "0" ? "待审核" : "已审核" %></center></td>
    <td><center><%#Eval("IsLock").ToString() == "0" ? "未锁定" : "已锁定"  %></center></td>  
    <td><center><a onclick="ShowUrlScript(<%#Eval("id").ToString()%>)">查看链接</a></center></td>
    <td><a href="VoteJoinEdit.aspx?id=<%#Eval("id")%>&action=<%=DTEnums.ActionEnum.Edit %>&VoteId=<%=VoteId%>">编辑</a><br /><a href="VoteNumEdit.aspx?id=<%#Eval("id")%>&action=<%=DTEnums.ActionEnum.Edit %>&VoteId=<%=VoteId%>">票数设置</a><br />
        <a href="GiftPage.aspx?id=<%#Eval("id")%>">礼物</a>
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
