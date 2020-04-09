<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VoteNumEdit.aspx.cs" Inherits="DTcms.Web.admin.VoteSystem.VoteNumEdit" ValidateRequest="false"%>
<%@ Import namespace="DTcms.Common" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>编辑后台导航</title>
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,initial-scale=1.0,user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<link rel="stylesheet" type="text/css" href="../../scripts/artdialog/ui-dialog.css" />
<link rel="stylesheet" type="text/css" href="../skin/icon/iconfont.css" />
<link rel="stylesheet" type="text/css" href="../skin/default/style.css" />
<script type="text/javascript" charset="utf-8" src="../../scripts/jquery/jquery-1.11.2.min.js"></script>
<script type="text/javascript" charset="utf-8" src="../../scripts/jquery/Validform_v5.3.2_min.js"></script>
<script type="text/javascript" charset="utf-8" src="../../scripts/datepicker/WdatePicker.js"></script>
<script type="text/javascript" charset="utf-8" src="../../scripts/artdialog/dialog-plus-min.js"></script>
<script type="text/javascript" charset="utf-8" src="../../scripts/webuploader/webuploader.min.js"></script>
<script type="text/javascript" charset="utf-8" src="../../editor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="../../editor/ueditor.all.min.js"> </script>
<script type="text/javascript" charset="utf-8" src="../../editor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript" charset="utf-8" src="../js/uploader.js"></script>
<script type="text/javascript" charset="utf-8" src="../js/common.js"></script>
<script type="text/javascript" charset="utf-8" src="../js/laymain.js"></script>
    <script>
        $(function () {
            //初始化表单验证
            $("#form1").initValidform();
        });
    </script>
</head>
<body class="mainbody">
<div style="position:absolute; height:650px;width:950px; overflow:auto">    
<form id="form1" runat="server">


<div id="floatHead" class="content-tab-wrap">
  <div class="content-tab">
    <div class="content-tab-ul-wrap">
      <ul>
        <li><a class="selected" href="javascript:;">票数设置</a></li>
      </ul>
    </div>
  </div>
</div>

<div class="tab-content">
  <dl>
    <dt>当前票数:</dt>
    <dd>
      <asp:TextBox ID="curSetNum" runat="server" CssClass="input normal"  >0</asp:TextBox>(无需设置)
    </dd>
  </dl>
  <dl>
    <dt>票数设置:</dt>
    <dd>
      <asp:TextBox ID="SetNum" runat="server" CssClass="input normal"  >0</asp:TextBox>(必填)正数为+ 例如：50 负数为- 例如-50(票数不低于0)
    </dd>
  </dl>
  <dl>
    <dt>浏览量设置:</dt>
    <dd>
      <asp:TextBox ID="curSetBrowseNum" runat="server" CssClass="input normal"  >0</asp:TextBox>(无需设置)
    </dd>
  </dl>
  <dl>
    <dt>浏览量设置:</dt>
    <dd>
      <asp:TextBox ID="SetBrowseNum" runat="server" CssClass="input normal"  >0</asp:TextBox>(必填)正数为+ 例如：50 负数为- 例如-50(票数不低于0)
    </dd>
  </dl>
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
</div>
</body>
</html>
