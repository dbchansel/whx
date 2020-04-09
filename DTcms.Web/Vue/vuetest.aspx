<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="vuetest.aspx.cs" Inherits="DTcms.Web.Vue.vuetest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<script src="/scripts/vue.js"></script>
<script src="/scripts/vue-resource.js"></script>
<script src="/scripts/ElementUI/element-ui.js"></script>
<script src="/scripts/CommonJS.Helper.js"></script>
<link href="/Content/ElementUI/element-ui.css" rel="stylesheet" />

    <title>管理系统</title>
    
    <style>
        .el-row {
            margin-bottom: 20px;
        }
 
        .login-box {
            margin-top: 20%;
            margin-left: 40%;
        }
    </style>
</head>
<body>
    <div class="login-box" id="app">
        <el-row>
            <el-col :span="8">
                <el-input id="name" v-model="name" placeholder="请输入帐号">
                    <template slot="prepend">
                        帐号
                    </template>
                </el-input>
            </el-col>
        </el-row>
        <el-row>
            <el-col :span="8">
                <el-input id="password" v-model="password" type="password" placeholder="请输入密码">
                    <template slot="prepend">
                        密码
                    </template>
                </el-input>
            </el-col>
        </el-row>
        <el-row>
            <el-col :span="8">
                <el-button id="login" v-on:click="check" style="width:100%" type="primary" v-loading.fullscreen.lock="logining">登录</el-button>
            </el-col>
        </el-row>
    </div>
</body>

    <script type="text/javascript">

 //      function post(url, data) {
 //           var dtd = $.Deferred();
 //           $.ajax({
 //               type: "post", url: url,
 //               data: AESEncrypt(JSON.stringify(data)),
 //               error: function (XMLHttpRequest, textStatus, errorThrow) {
 //                   console.log(XMLHttpRequest.responseText, 'color: red;font-weight:bold;', 'color: blue;', 'color: red;font-weight:bold;', 'color: blue;');
 //               }
 //           }).then(function (data) {
 //                   dtd.resolve($.parseJSON(AESDecrypt(data)));
 //               }).catch(function () {
 //                   dtd.resolve(XMLHttpRequest);
 //               });
 //           return dtd.promise();
 //       }
        
    const  key = CryptoJS.enc.Utf8.parse("12345678900000001234567890000000"); //32位
    const  iv = CryptoJS.enc.Utf8.parse("1234567890000000"); //16位
    /*
     * AES加密 
     * @param str 明文字符串
     * @return 加密后的字符串
     */
	function AESEncrypt(str) {
		let srcs = CryptoJS.enc.Utf8.parse(str);
		let encrypted = CryptoJS.AES.encrypt(srcs, key, {
			iv: iv,
			mode: CryptoJS.mode.CBC,
			padding: CryptoJS.pad.Pkcs7
		});
		return encrypted.ciphertext.toString().toUpperCase();;
	}
    /*
     * AES解密 
     * @param str 密文字符串
     * @return 解密后的字符串
     */
    function AESDecrypt(str) {
        var encryptedHexStr = CryptoJS.enc.Hex.parse(str);
        var srcs = CryptoJS.enc.Base64.stringify(encryptedHexStr);
        var decrypted = CryptoJS.AES.decrypt(srcs, key, {
            iv: iv,
            mode: CryptoJS.mode.CBC,
            padding: CryptoJS.pad.Pkcs7
        });
        var decryptedStr = decrypted.toString(CryptoJS.enc.Utf8);
        return decryptedStr.toString();
    }

    window.onload = function () {
        TSVUE = new Vue({
            el: '#app',
            data: {
                name: '',
                password: '',
                logining: false
            },
            methods: {
                check: function (event) {
                    //获取值
                    var url = '/tools/vue_ajax.ashx/loginvue?account=1&password=2';
                    var aesStr = AESEncrypt(JSON.stringify({ "local": "11111" }));
                    //debugger;
                    //var desStr = JSON.parse(AESDecrypt(aesStr));
                    //debugger;
                    //var url = 'Vue/vuetest/Login?account=1&password=2';
                    //this.$http.post(url, JSON.stringify({local:"11111"}), { headers: { 'Content-Type': 'application/x-www-form-urlencoded' } })
                    this.$http.post(url, aesStr, { headers: { 'Content-Type': 'application/x-www-form-urlencoded' } })
                    //his.$http.post(url, {local:"11111"})
                        .then(
                            (response) => {
                            debugger;
                                if (response != null && response.bodyText != "") {
                                    var stringss = AESDecrypt(response.bodyText.toString());
                                debugger;
                                var jqobj = $.parseJSON(stringss)
                                var ssss = JSON.parse(AESDecrypt(response.bodyText.toString()));
                                debugger;
                            }
                        }
                        );
                }
            }
        })
    }

</script>
</html>
