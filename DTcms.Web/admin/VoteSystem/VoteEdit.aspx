<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VoteEdit.aspx.cs" Inherits="DTcms.Web.admin.VoteSystem.VoteEdit" validateRequest="false"%>
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
        <li><a class="selected" href="javascript:;">活动设置</a></li>
        <li><a href="javascript:;">规则设置</a></li>
        <li><a href="javascript:;">投票设置</a></li>
        <li><a href="javascript:;">界面设置</a></li>
        <li><a href="javascript:;">报名设置</a></li>
        <li><a href="javascript:;">礼物设置</a></li>
      </ul>
    </div>
  </div>
</div>

<div class="tab-content">

  <dl>
    <dt>活动标题:</dt>
    <dd>
      <asp:TextBox ID="Activity_Title" runat="server" CssClass="input normal" ></asp:TextBox>(必填)
    </dd>
  </dl>
  <dl>
    <dt>报名时间:</dt>
    <dd>
           <asp:TextBox ID="Activity_GMBGTime" runat="server" CssClass="input rule-date-input" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" datatype="/^\s*$|^\d{4}\-\d{1,2}\-\d{1,2}\s{1}(\d{1,2}:){2}\d{1,2}$/" errormsg="请选择正确的日期" sucmsg=" " />
        至
        <asp:TextBox ID="Activity_GMEDTime" runat="server" CssClass="input rule-date-input" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" datatype="/^\s*$|^\d{4}\-\d{1,2}\-\d{1,2}\s{1}(\d{1,2}:){2}\d{1,2}$/" errormsg="请选择正确的日期" sucmsg=" " />
    </dd>
  </dl>
  <dl>
    <dt>投票时间:</dt>
    <dd>
           <asp:TextBox ID="Activity_VoteBGTime" runat="server" CssClass="input rule-date-input" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" datatype="/^\s*$|^\d{4}\-\d{1,2}\-\d{1,2}\s{1}(\d{1,2}:){2}\d{1,2}$/" errormsg="请选择正确的日期" sucmsg=" " />
        至
        <asp:TextBox ID="Activity_VoteEDTime" runat="server" CssClass="input rule-date-input" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" datatype="/^\s*$|^\d{4}\-\d{1,2}\-\d{1,2}\s{1}(\d{1,2}:){2}\d{1,2}$/" errormsg="请选择正确的日期" sucmsg=" " />
    </dd>
  </dl>
  <dl>
    <dt>备注:</dt>
    <dd>
      <asp:TextBox ID="Activity_Remarks" runat="server" CssClass="input normal" ></asp:TextBox>
    </dd>
  </dl>
</div>

<div class="tab-content" style="display:none">
    
  <dl>
    <dt>是否已审核:</dt>
    <dd>
      <asp:TextBox ID="Rules_VoteSta" runat="server" CssClass="input normal" value="0"></asp:TextBox>(无需设置)
    </dd>
  </dl>
  <dl>
    <dt>最小人数:</dt>
    <dd>
      <asp:TextBox ID="Rules_MinMember" runat="server" CssClass="input normal" value="0"></asp:TextBox>(无需设置)
    </dd>
  </dl>
  <dl>
    <dt>每人每日每用户（票）:</dt>
    <dd>
      <asp:TextBox ID="Rules_PDUVotes" runat="server" CssClass="input normal" value="0"></asp:TextBox>
    </dd>
  </dl>
  <dl>
    <dt>每日每人（票）:</dt>
    <dd>
      <asp:TextBox ID="Rules_DPVotes" runat="server" CssClass="input normal" value="0"></asp:TextBox>
    </dd>
  </dl>
  <dl>
    <dt>每人最多（票）:</dt>
    <dd>
      <asp:TextBox ID="Rules_MaxVotes" runat="server" CssClass="input normal" value="0"></asp:TextBox>
    </dd>
  </dl>
  <dl>
    <dt>投票时间间隔:</dt>
    <dd>
      <asp:TextBox ID="Rules_DateInterval" runat="server" CssClass="input normal" value="0"></asp:TextBox>(暂未启用)
    </dd>
  </dl>
  <dl>
    <dt>每人最多送礼物:</dt>
    <dd>
      <asp:TextBox ID="Rules_MaxGift" runat="server" CssClass="input normal" value="0"></asp:TextBox>
    </dd>
  </dl>
  <dl>
    <dt>投票消息提醒:</dt>
    <dd>
      <asp:TextBox ID="Rules_RemindSta" runat="server" CssClass="input normal" value="0"></asp:TextBox>(暂未启用)
    </dd>
  </dl>
  <dl>
    <dt>匿名送礼:</dt>
    <dd>
      <asp:TextBox ID="Rules_AnonymousGift" runat="server" CssClass="input normal" value="0"></asp:TextBox>(暂未启用)
    </dd>
  </dl>
  <dl>
    <dt>给自己投票:</dt>
    <dd>
      <asp:TextBox ID="Rules_GiftSelf" runat="server" CssClass="input normal" value="1"></asp:TextBox>(暂未启用)
    </dd>
  </dl>
</div>

<div class="tab-content" style="display:none">
 <dl>
    <dt>轮播图1</dt>
    <dd>
      <asp:TextBox ID="Vote_Pic1" runat="server" CssClass="input normal upload-path" />
      <div class="upload-box upload-img"></div>
    </dd>
  </dl>
 <dl>
    <dt>轮播图2</dt>
    <dd>
      <asp:TextBox ID="Vote_Pic2" runat="server" CssClass="input normal upload-path" />
      <div class="upload-box upload-img"></div>
    </dd>
  </dl>
 <dl>
    <dt>轮播图3</dt>
    <dd>
      <asp:TextBox ID="Vote_Pic3" runat="server" CssClass="input normal upload-path" />
      <div class="upload-box upload-img"></div>
    </dd>
  </dl>
 <dl>
    <dt>轮播图4</dt>
    <dd>
      <asp:TextBox ID="Vote_Pic4" runat="server" CssClass="input normal upload-path" />
      <div class="upload-box upload-img"></div>
    </dd>
  </dl>
 <dl>
    <dt>轮播图5</dt>
    <dd>
      <asp:TextBox ID="Vote_Pic5" runat="server" CssClass="input normal upload-path" />
      <div class="upload-box upload-img"></div>
    </dd>
  </dl>
  <dl>
    <dt>投票成功弹出广告:</dt>
    <dd>
      <asp:TextBox ID="Vote_SuccPopAds" runat="server" CssClass="input normal" ></asp:TextBox>(暂未启用)
    </dd>
  </dl>
  <dl>
    <dt>活动规则:</dt>
    <dd>
       <textarea id="Vote_ActivityContent" class="editor" runat="server"></textarea>(必填)
    </dd>
  </dl>
  <dl>
    <dt>奖品介绍:</dt>
    <dd>
       <textarea id="Vote_PrizeContent" class="editor" runat="server"></textarea>(必填)
    </dd>
  </dl>
</div>
<div class="tab-content" style="display:none">
  <dl>
    <dt>首页显示顺序:</dt>
    <dd>
      <asp:TextBox ID="Surface_DisplayOrder" runat="server" CssClass="input normal">0</asp:TextBox>(按票数倒叙)(暂未启用)
    </dd>
  </dl>
  <dl>
    <dt>虚拟浏览量:</dt>
    <dd>
      <asp:TextBox ID="Surface_BVolume" runat="server" CssClass="input normal">0</asp:TextBox>(首页显示== 真实浏览量+虚拟浏览量)(暂未启用)
    </dd>
  </dl>
  <dl>
    <dt>排行榜数量:</dt>
    <dd>
      <asp:TextBox ID="Surface_RankNum" runat="server" CssClass="input normal" >0</asp:TextBox>(设置排行榜显示选手最大数量)(暂未启用)
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
