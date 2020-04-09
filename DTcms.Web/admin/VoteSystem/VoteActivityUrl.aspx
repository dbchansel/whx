<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VoteActivityUrl.aspx.cs" Inherits="DTcms.Web.admin.VoteSystem.VoteActivityUrl" %>


<%@ Import namespace="DTcms.Common" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,initial-scale=1.0,user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<title>公示确认</title>
<link rel="stylesheet" type="text/css" href="../skin/icon/iconfont.css" />
<link rel="stylesheet" type="text/css" href="../skin/default/style.css" />
<script type="text/javascript" charset="utf-8" src="../../scripts/jquery/jquery-1.11.2.min.js"></script>
<script type="text/javascript" charset="utf-8" src="../js/common.js"></script>
<script type='text/javascript' src='http://cdn.staticfile.org/jquery/2.1.1/jquery.min.js'></script> 
<script type="text/javascript" src="http://cdn.staticfile.org/jquery.qrcode/1.0/jquery.qrcode.min.js"></script> 

<script type="text/javascript">
//生成二维码
    $(function () {
        var urlstr = "<%=urlstr %>";
 //       alert(urlstr);
 //       $('#urlstr').attr('href', urlstr);
        $("#urlstr").text(urlstr);
        jQuery('#qrcode').qrcode({ width: 300, height: 300, text: urlstr });
    });
</script>
</head>

<body>
<form id="form2" runat="server">
<div class="div-content">
  <center>
  <dl>
    <dt>链接</dt>
    <dd>
        <a id="urlstr"></a>
    </dd>
  </dl>
  <dl>
    <dt>二维码</dt>
    <dd>
          <div id="qrcode"></div> 
    </dd>
  </dl>
  </center>
</div>
</form>
</body>
</html>