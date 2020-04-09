<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VoteAutoEdit.aspx.cs" Inherits="DTcms.Web.admin.VoteSystem.VoteAutoEdit" ValidateRequest="false" %>
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

    </script>
</head>
<body class="mainbody">
<div style="position:absolute; height:650px;width:950px; overflow:auto">    
<form id="form1" runat="server">

<div id="floatHead" class="content-tab-wrap">
  <div class="content-tab">
    <div class="content-tab-ul-wrap">
      <ul>
        <li><a class="selected" href="javascript:;">多人定时投票</a></li>
        <li><a href="javascript:;">依据名次投票</a></li>
        <li><a href="javascript:;">多人定时送礼物</a></li>
        <li><a href="javascript:;">依据名次送礼物</a></li>
      </ul>
    </div>
  </div>
</div>

<div class="tab-content">

  <dl>
    <dt>选手编号:</dt>
    <dd>
      <asp:TextBox ID="JoinMembers" runat="server" CssClass="input normal" ></asp:TextBox><br />
        (选手编号，多个选手编号请以英文逗号隔开;)
    </dd>
  </dl>
  <dl>
    <dt>频率:</dt>
    <dd>
      <asp:TextBox ID="PL" runat="server" CssClass="input normal" ></asp:TextBox><br />
        (请填写大于5的正数，此处为每N秒自动投一票;)
    </dd>
  </dl>
  <dl>
    <dt>任务开始时间:</dt>
    <dd>
      <asp:TextBox ID="AutoBG" runat="server" CssClass="input rule-date-input" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" datatype="/^\s*$|^\d{4}\-\d{1,2}\-\d{1,2}\s{1}(\d{1,2}:){2}\d{1,2}$/" errormsg="请选择正确的日期" sucmsg=" " />
    </dd>
  </dl>
  <dl>
    <dt>任务结束时间:</dt>
    <dd>
       <asp:TextBox ID="AutoED" runat="server" CssClass="input rule-date-input" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" datatype="/^\s*$|^\d{4}\-\d{1,2}\-\d{1,2}\s{1}(\d{1,2}:){2}\d{1,2}$/" errormsg="请选择正确的日期" sucmsg=" " />
    </dd>
  </dl>
  <dl>
    <dt>是否启用:</dt>
    <dd>
      <div class="rule-single-checkbox">
          <asp:CheckBox ID="Status1" runat="server" Checked="True" />
      </div>
    </dd>
  </dl>
</div>
<div class="tab-content" style="display:none">
 <dl>
    <dt>任务开始时间:</dt>
    <dd>
      <asp:TextBox ID="AutoBG2" runat="server" CssClass="input rule-date-input" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" datatype="/^\s*$|^\d{4}\-\d{1,2}\-\d{1,2}\s{1}(\d{1,2}:){2}\d{1,2}$/" errormsg="请选择正确的日期" sucmsg=" " />
    </dd>
  </dl>
  <dl>
    <dt>任务结束时间:</dt>
    <dd>
       <asp:TextBox ID="AutoED2" runat="server" CssClass="input rule-date-input" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" datatype="/^\s*$|^\d{4}\-\d{1,2}\-\d{1,2}\s{1}(\d{1,2}:){2}\d{1,2}$/" errormsg="请选择正确的日期" sucmsg=" " />
    </dd>
  </dl>
  <dl>
    <dt>频率:</dt>
    <dd>
      <asp:TextBox ID="PL2" runat="server" CssClass="input normal" ></asp:TextBox><br />
        (请填写大于0的正数，單位為分鐘;)
    </dd>
  </dl>

  <dl>
    <dt>排名范围1:</dt>
    <dd>

          <asp:TextBox ID="pmfw1b" runat="server" CssClass="input normal" ></asp:TextBox> ~ <asp:TextBox ID="pmfw1e" runat="server" CssClass="input normal" ></asp:TextBox><br />(必须从大到小，否则出现问题后果自负)

    </dd>
  </dl>
  <dl>
    <dt>票数范围1:</dt>
    <dd>

           <asp:TextBox ID="psfw1b" runat="server" CssClass="input normal" ></asp:TextBox> ~ <asp:TextBox ID="psfw1e" runat="server" CssClass="input normal" ></asp:TextBox><br />(必须从大到小，否则出现问题后果自负)

    </dd>
  </dl>

  <dl>
    <dt>排名范围2:</dt>
    <dd>
          <asp:TextBox ID="pmfw2b" runat="server" CssClass="input normal" ></asp:TextBox> ~ <asp:TextBox ID="pmfw2e" runat="server" CssClass="input normal" ></asp:TextBox><br />(必须从大到小，否则出现问题后果自负)
    </dd>
  </dl>
  <dl>
    <dt>票数范围2:</dt>
    <dd>
           <asp:TextBox ID="psfw2b" runat="server" CssClass="input normal" ></asp:TextBox> ~ <asp:TextBox ID="psfw2e" runat="server" CssClass="input normal" ></asp:TextBox><br />(必须从大到小，否则出现问题后果自负)
    </dd>
  </dl>

  <dl>
    <dt>排名范围3:</dt>
    <dd>
          <asp:TextBox ID="pmfw3b" runat="server" CssClass="input normal" ></asp:TextBox> ~ <asp:TextBox ID="pmfw3e" runat="server" CssClass="input normal" ></asp:TextBox><br />(必须从大到小，否则出现问题后果自负)
    </dd>
  </dl>
  <dl>
    <dt>票数范围3:</dt>
    <dd>
           <asp:TextBox ID="psfw3b" runat="server" CssClass="input normal" ></asp:TextBox> ~ <asp:TextBox ID="psfw3e" runat="server" CssClass="input normal" ></asp:TextBox><br />(必须从大到小，否则出现问题后果自负)
    </dd>
  </dl>

  <dl>
    <dt>排名范围4:</dt>
    <dd>
          <asp:TextBox ID="pmfw4b" runat="server" CssClass="input normal" ></asp:TextBox> ~ <asp:TextBox ID="pmfw4e" runat="server" CssClass="input normal" ></asp:TextBox><br />(必须从大到小，否则出现问题后果自负)
    </dd>
  </dl>
  <dl>
    <dt>票数范围4:</dt>
    <dd>
           <asp:TextBox ID="psfw4b" runat="server" CssClass="input normal" ></asp:TextBox> ~ <asp:TextBox ID="psfw4e" runat="server" CssClass="input normal" ></asp:TextBox><br />(必须从大到小，否则出现问题后果自负)
    </dd>
  </dl>
    
  <dl>
    <dt>是否启用:</dt>
    <dd>
      <div class="rule-single-checkbox">
          <asp:CheckBox ID="Status2" runat="server" Checked="True" />
      </div>
    </dd>
  </dl>
</div>
<div class="tab-content" style="display:none">


</div>
    
<div class="tab-content" style="display:none">


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
