<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="goods_records_list.aspx.cs" Inherits="DTcms.Web.admin.VoteSystem.goods_records_list" %>
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

        //设置进货
        function Add_goods(obj) {
            var d = top.dialog({
                id: 'Add_goods',
                width: "800",        //宽度
                height: "400",        //高度
                title: '进/出货登记',
                url: 'article/add_goods.aspx?action=add&good_id=' + obj
            }).showModal();
        }
    </script>
</head>

<body class="mainbody">
<form id="form1" runat="server">
<!--导航栏-->
<div class="location">
  <span><%#good_name.ToString() %></span>
</div>
<!--/导航栏-->

<!--工具栏-->
<div id="floatHead" class="toolbar-wrap">
  <div class="toolbar">
    <div class="box-wrap">
      <a class="menu-btn"><i class="iconfont icon-more"></i></a>
      <div class="l-list">
        <ul class="icon-list">
          <li><asp:LinkButton ID="btnAudit" runat="server"  onclick="btnAudit_Click"><i class="iconfont icon-survey"></i><span>登记</span></asp:LinkButton></li>
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
    <th width="20%" align="left">说明</th>
    <th width="6%" align="center">出/进</th>
    <th width="5%" align="center">数量</th>
    <th align="left" width="15%">售价</th>
    <th align="left" width="15%">成本</th>
    <th align="left" width="10%">生产日期</th>
    <th align="left" width="10%">有效期至</th>
  </tr>
</HeaderTemplate>
<ItemTemplate>
  <tr>
    <td align="center">
      <asp:CheckBox ID="chkId" CssClass="checkall" runat="server" Value='<%#Eval("id")%>' style="vertical-align:middle;" />
      <asp:HiddenField ID="hidId" Value='<%#Eval("id")%>' runat="server" />
    </td>
    <td><%#Eval("remarks")%></td>
    <td><%#Eval("trannsform_type").ToString() == "0" ? "出":"进" %></td>
    <td><%#Eval("transform_num").ToString() %></td>
    <td><%#Eval("sale_prices").ToString() %></td>
    <td><%#Eval("real_prices").ToString() %></td>
    <td><%#Eval("product_date").ToString() %></td>
    <td><%#Eval("end_date").ToString() %></td>
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