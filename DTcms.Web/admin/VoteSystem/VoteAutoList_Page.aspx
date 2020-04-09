<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VoteAutoList_Page.aspx.cs" Inherits="DTcms.Web.admin.VoteSystem.VoteAutoList_Page" %>
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
  <span>待审核列表</span>
</div>
<!--/导航栏-->

<!--工具栏-->
<div id="floatHead" class="toolbar-wrap">
  <div class="toolbar">
    <div class="box-wrap">
      <a class="menu-btn"><i class="iconfont icon-more"></i></a>
      <div class="l-list">
        <ul class="icon-list">
          <li><a href="VoteAutoEdit.aspx?action=<%=DTEnums.ActionEnum.Add%>&VoteId=<%=VoteId.ToString() %>"><i class="iconfont icon-close"></i><span>新增</span></a></li>
          <li><asp:LinkButton ID="btnAudit" runat="server"  onclick="btnAudit_Click"><i class="iconfont icon-survey"></i><span>启用</span></asp:LinkButton></li>
          <li><asp:LinkButton ID="LinkButton1" runat="server" onclick="btnAudit_ClickSD"><i class="iconfont icon-survey"></i><span>禁用</span></asp:LinkButton></li>
        </ul>
        <div class="menu-list">
     
        </div>

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
    <th width="5%">选择</th>
    <th width="20%" align="left">选手编号</th>
    <th width="15%" align="left">自动投票类型</th>
    <th width="5%" align="left">频率/秒</th>
    <th align="left" width="25%">任务时间</th>
    <th align="left" width="10%">状态</th>
    <th width="10%">操作</th>
  </tr>
</HeaderTemplate>
<ItemTemplate>
  <tr>
    <td align="center">
      <asp:CheckBox ID="chkId" CssClass="checkall" runat="server" Value='<%#Eval("id")%>' style="vertical-align:middle;" />
      <asp:HiddenField ID="hidId" Value='<%#Eval("id")%>' runat="server" />
    </td>
    <td><a href="VoteAutoEdit.aspx?action=<%=DTEnums.ActionEnum.Edit %>&id=<%#Eval("id")%>"><%#Eval("JoinMembers")%></a></td>
    <td><%#Eval("AutoType ").ToString() %></td>
    <td><%#Eval("PL").ToString() %></td>
    <td><%#Eval("AutoBG").ToString() %> <br /><%#Eval("AutoED").ToString() %></td>
    <td><center><%#Eval("sta").ToString() == "0" ? "未启用" : (Eval("sta").ToString() == "1" ? "启用":"禁用") %></center></td>
    <td><a href="VoteAutoEdit.aspx?id=<%#Eval("id")%>">编辑</a>
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

</form>
</body>
</html>