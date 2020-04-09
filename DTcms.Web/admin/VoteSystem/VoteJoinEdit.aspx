<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VoteJoinEdit.aspx.cs" Inherits="DTcms.Web.admin.VoteSystem.VoteJoinEdit"  ValidateRequest="false"%>
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
            //初始化编辑器
            $(".editor").each(function (i) {
                var objId = $(this).attr("id");
                if (objId != "undefined") {
                    var editor = UE.getEditor(objId, {
                        serverUrl: '../../../tools/upload_ajax.ashx',
                        initialFrameWidth: '100%',
                        initialFrameHeight: 350
                    });
                }
            });
            //初始化编辑器
            $(".editor").each(function (i) {
                var objId = $(this).attr("id");
                if (objId != "undefined") {
                    var editor = UE.getEditor(objId, {
                        serverUrl: '../../../tools/upload_ajax.ashx',
                        initialFrameWidth: '100%',
                        initialFrameHeight: 350
                    });
                }
            });
            $(".editor-mini").each(function (i) {
                var objId = $(this).attr("id");
                if (objId != "undefined") {
                    var editorMini = UE.getEditor(objId, {
                        serverUrl: '../../../tools/upload_ajax.ashx',
                        initialFrameWidth: '100%',
                        initialFrameHeight: 250,
                        toolbars: [[
                            'fullscreen', 'source', '|', 'undo', 'redo', '|',
                            'bold', 'italic', 'underline', 'strikethrough', 'removeformat', 'pasteplain', '|', 'forecolor', 'insertorderedlist', 'insertunorderedlist', '|',
                         'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify', '|',
                         'link', 'unlink', 'anchor', '|',
                         'simpleupload', 'insertimage', 'scrawl', 'insertvideo'
                        ]]
                    });
                }
            });
        //初始化上传控件       
        $(".upload-img").InitUploader({ filesize: 1002400, sendurl: "../../tools/upload_ajax.ashx", swf: "../../scripts/webuploader/uploader.swf" });
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
        <li><a class="selected" href="javascript:;">选手设置</a></li>
        <li><a href="javascript:;">其他设置</a></li>
      </ul>
    </div>
  </div>
</div>

<div class="tab-content">

  <dl>
    <dt>选手编号:</dt>
    <dd>
      <asp:TextBox ID="JoinNumber" runat="server" CssClass="input normal" Enabled="false" ></asp:TextBox>(必填)
    </dd>
  </dl>
  <dl>
    <dt>选手店名:</dt>
    <dd>
      <asp:TextBox ID="JoinName" runat="server" CssClass="input normal" ></asp:TextBox>
    </dd>
  </dl>
  <dl>
    <dt>选手手机号码:</dt>
    <dd>
      <asp:TextBox ID="JoinTel" runat="server" CssClass="input normal" ></asp:TextBox>
    </dd>
  </dl>
  <dl>
    <dt>选手商家地址:</dt>
    <dd>
      <asp:TextBox ID="JoinAddress" runat="server" CssClass="input normal" ></asp:TextBox>
    </dd>
  </dl>
  <dl>
    <dt>选手图片1</dt>
    <dd>
      <asp:TextBox ID="JoinImg1" runat="server" CssClass="input normal upload-path" />
      <div class="upload-box upload-img"></div>
    </dd>
  </dl>
  <dl>
    <dt>选手图片2</dt>
    <dd>
      <asp:TextBox ID="JoinImg2" runat="server" CssClass="input normal upload-path" />
      <div class="upload-box upload-img"></div>
    </dd>
  </dl>
  <dl>
    <dt>选手图片3</dt>
    <dd>
      <asp:TextBox ID="JoinImg3" runat="server" CssClass="input normal upload-path" />
      <div class="upload-box upload-img"></div>
    </dd>
  </dl>
  <dl>
    <dt>选手图片4</dt>
    <dd>
      <asp:TextBox ID="JoinImg4" runat="server" CssClass="input normal upload-path" />
      <div class="upload-box upload-img"></div>
    </dd>
  </dl>
  <dl>
    <dt>选手图片5</dt>
    <dd>
      <asp:TextBox ID="JoinImg5" runat="server" CssClass="input normal upload-path" />
      <div class="upload-box upload-img"></div>
    </dd>
  </dl>
  <dl>
    <dt>选手图片6</dt>
    <dd>
      <asp:TextBox ID="JoinImg6" runat="server" CssClass="input normal upload-path" />
      <div class="upload-box upload-img"></div>
    </dd>
  </dl>
  <dl>
    <dt>选手图片7</dt>
    <dd>
      <asp:TextBox ID="JoinImg7" runat="server" CssClass="input normal upload-path" />
      <div class="upload-box upload-img"></div>
    </dd>
  </dl>
  <dl>
    <dt>选手图片8</dt>
    <dd>
      <asp:TextBox ID="JoinImg8" runat="server" CssClass="input normal upload-path" />
      <div class="upload-box upload-img"></div>
    </dd>
  </dl>
  <dl>
    <dt>选手图片9</dt>
    <dd>
      <asp:TextBox ID="JoinImg9" runat="server" CssClass="input normal upload-path" />
      <div class="upload-box upload-img"></div>
    </dd>
  </dl>
  <dl>
    <dt>选手图片10</dt>
    <dd>
      <asp:TextBox ID="JoinImg10" runat="server" CssClass="input normal upload-path" />
      <div class="upload-box upload-img"></div>
    </dd>
  </dl>
  <dl>
    <dt>选手宣传图片</dt>
    <dd>
      <asp:TextBox ID="DisplayImg" runat="server" CssClass="input normal upload-path" />
      <div class="upload-box upload-img"></div>
    </dd>
  </dl>
  <dl>
    <dt>票数:</dt>
    <dd>
      <asp:TextBox ID="VoteNum" runat="server" CssClass="input normal" Enabled="false" value="0"></asp:TextBox>(无需设置)
    </dd>
  </dl>
  <dl>
    <dt>礼物:</dt>
    <dd>
      <asp:TextBox ID="GiftNum" runat="server" CssClass="input normal" Enabled="false" value="0"></asp:TextBox>(无需设置)
    </dd>
  </dl>
  <dl>
    <dt>虚拟热度:</dt>
    <dd>
      <asp:TextBox ID="VisualNum" runat="server" CssClass="input normal" value="0"></asp:TextBox>(无需设置)
    </dd>
  </dl>
  <dl>
    <dt>选手介绍:</dt>
    <dd>
       <textarea id="JoinContent" class="editor" runat="server"></textarea>(必填)
    </dd>
  </dl>
  <dl>
    <dt>是否锁定:</dt>
    <dd>
      <asp:TextBox ID="IsLock" runat="server" CssClass="input normal" value="0"></asp:TextBox>(0无，1锁定)
    </dd>
  </dl>
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
