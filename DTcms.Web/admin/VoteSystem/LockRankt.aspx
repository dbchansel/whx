<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LockRankt.aspx.cs" Inherits="DTcms.Web.admin.VoteSystem.LockRankt" %>
<%@ Import namespace="DTcms.Common" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,initial-scale=1.0,user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<title>公示确认</title>
<link rel="stylesheet" type="text/css" href="../../scripts/artdialog/ui-dialog.css" />
<link rel="stylesheet" type="text/css" href="../../css/pagination.css" />
<link rel="stylesheet" type="text/css" href="../skin/icon/iconfont.css" />
<link rel="stylesheet" type="text/css" href="../skin/default/style.css" />
<script type="text/javascript" src="../../scripts/jquery/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="../../scripts/artdialog/dialog-plus-min.js"></script>
<script type="text/javascript" charset="utf-8" src="../js/laymain.js"></script>
<script type="text/javascript" charset="utf-8" src="../js/common.js"></script>

<script type="text/javascript">

</script>
</head>

<body>
<form id="form2" runat="server">
<div class="div-content">
 <div class="tab-content">
  <center>
  <dl>
    <dt>是否开启
        <br />
        锁定前三名</dt>
    <dd>
          <div class="rule-single-select">
            <asp:DropDownList ID="OpenLockRank" runat="server" >

            </asp:DropDownList>
          </div>
    </dd>
  </dl>
  <dl>
    <dt>第二名</dt>
    <dd>
         <asp:DropDownList ID="User1Id" runat="server" >

         </asp:DropDownList>
    </dd>
  </dl>
  <dl>
    <dt>第三名</dt>
    <dd>
         <asp:DropDownList ID="User2Id" runat="server" >

         </asp:DropDownList>
    </dd>
  </dl>
  <dl>
    <dt>第一名</dt>
    <dd>
         <asp:DropDownList ID="User3Id" runat="server" >

         </asp:DropDownList>
    </dd>
  </dl>
  </center>
</div>
</div>

    <!--工具栏-->
<div class="page-footer">
  <div class="btn-wrap">
    <asp:Button ID="btnSubmit" runat="server" Text="提交保存" CssClass="btn" onclick="btnSubmit_Click" />
    <input name="btnReturn" type="button" value="返回上一页" class="btn yellow" onclick="javascript:history.back(-1);" />
  </div>
</div>
<!--/工具栏-->
</form>
</body>
</html>