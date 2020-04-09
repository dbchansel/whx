<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="add_goods.aspx.cs" Inherits="DTcms.Web.admin.article.add_goods" %>

<%@ Import namespace="DTcms.Common" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,initial-scale=1.0,user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<title>进货</title>
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

<script type="text/javascript">

</script>
</head>

<body>
<form id="form" runat="server">
<div class="div-content">
 <div class="tab-content">
  <center>
  <dl>
    <dt>物品名称：</dt>
    <dd>
    <asp:Label ID="good_name" runat="server"></asp:Label>
    </dd>
  </dl>
  <dl>
    <dt>说明</dt>
    <dd  style="float:left">
      <asp:TextBox ID="remarks" runat="server" CssClass="input normal" datatype="n" sucmsg=" ">0</asp:TextBox>
    </dd>
  </dl>
  <dl>
    <dt>进/出货</dt>
    <dd style="float:left">

            <asp:DropDownList ID="OpenLockRank" runat="server" >

            </asp:DropDownList>

    </dd>
  </dl>
  <dl>
    <dt>数量</dt>
    <dd  style="float:left">
      <asp:TextBox ID="transform_num" runat="server" CssClass="input small" datatype="n" sucmsg=" ">0</asp:TextBox>
    </dd>
  </dl>

      
  <dl>
    <dt>销售价格</dt>
    <dd  style="float:left">
      <asp:TextBox ID="sale_prices" runat="server" CssClass="input small" datatype="n" sucmsg=" ">0</asp:TextBox>
    </dd>
  </dl>

      
  <dl>
    <dt>成本价格</dt>
    <dd  style="float:left">
      <asp:TextBox ID="real_prices" runat="server" CssClass="input small" datatype="n" sucmsg=" ">0</asp:TextBox>
    </dd>
  </dl>
      
  <dl>
    <dt>物品有效期:</dt>
    <dd style="float:left">
           <asp:TextBox ID="product_date" runat="server" CssClass="input rule-date-input" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" datatype="/^\s*$|^\d{4}\-\d{1,2}\-\d{1,2}\s{1}(\d{1,2}:){2}\d{1,2}$/" errormsg="请选择正确的日期" sucmsg=" " />
        至
        <asp:TextBox ID="end_date" runat="server" CssClass="input rule-date-input" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" datatype="/^\s*$|^\d{4}\-\d{1,2}\-\d{1,2}\s{1}(\d{1,2}:){2}\d{1,2}$/" errormsg="请选择正确的日期" sucmsg=" " />
    </dd>
  </dl>

  </center>
</div>
</div>

    <!--工具栏-->
<div class="page-footer">
  <div class="btn-wrap">
    <asp:Button ID="btnSubmit" runat="server" Text="提交保存" CssClass="btn" onclick="btnSubmit_Click" />
  </div>
</div>
<!--/工具栏-->
</form>
</body>
</html>