require.config({
    urlArgs: "bust=" + (new Date()).getTime(),
    paths: {
        "jquery": "/scripts/jquery1/jquery-3.3.1.min",
        "crypto-core": "/scripts/crypto-js/components/core",
        "crypto-aes": "/scripts/crypto-js/rollups/aes",
    },
    waitSeconds: 0
})
define(["jquery", "crypto-core", "crypto-aes"], function ($) {
    /*
     * ajax的psot调用 
     * @param url 服务地址
     * @param data 服务需要的json数据
     * then() 成功后执行
     */
    function post(url, data) {
        var us = url.split('/');
        if (us.length > 0) {
            if (us[us.length - 1].indexOf('.') == -1) {
                if (us.length - 2 >= 0) {
                    if (us[us.length - 2].indexOf('.') == -1) {
                        us[us.length - 1] = ".aspx?" + us[us.length - 1];
                    }
                    else {
                        us[us.length - 1] = "?" + us[us.length - 1];
                    }
                }
                else {
                    us[us.length - 1] = "?" + us[us.length - 1];
                }
            }
        }
        var url = "";
        for (var i = 0; i < us.length; i++) {
            if (i == us.length - 1) {
                if (url.length > 0) {
                    url = url.substr(0, url.length - 1) + us[i];
                }
                else {
                    url = url + us[i];
                }
            }
            else {
                url = url + us[i] + "/";
            }
        }
        // alert(url);
        var dtd = $.Deferred();
        $.ajax({
            type: "post", url: url,
            data: AESEncrypt(JSON.stringify(data)),
            error: function (XMLHttpRequest, textStatus, errorThrow) {
                console.log(XMLHttpRequest.responseText,
                    'color: red;font-weight:bold;', 'color: blue;',
                    'color: red;font-weight:bold;', 'color: blue;',
                    'color: red;font-weight:bold;', 'color: blue;',
                    'color: red;font-weight:bold;', 'color: blue;');
            }
        }).then(function (data) {
            dtd.resolve($.parseJSON(AESDecrypt(data)));
            debugger;
        }).catch(function () {
            dtd.resolve(XMLHttpRequest);
        });
        return dtd.promise();
    }
    return {
        post: post,
        AESEncrypt: AESEncrypt,
        AESDecrypt: AESDecrypt,
        UrlParam: getUrlParam,
        NewGuid: newGuid,
        goBack: goBack,
        formatDate: formatDate
    };
    /**
     * 格式化为日期格式yyyy-MM-dd
     * @param {any} date
     */
    function formatDate(date) {
        var year = date.getFullYear();
        var month = date.getMonth() + 1;
        var mon = month >= 10 ? "" + month : "0" + month;
        var day = date.getDate();
        var dd = day >= 10 ? "" + day : "0" + day;

        return year + "-" + mon + "-" + day;
    }

    /*
     * AES加密 
     * @param str 明文字符串
     * @return 加密后的字符串
     */
    function AESEncrypt(str) {
        var key = CryptoJS.enc.Utf8.parse("12345678900000001234567890000000"); //32位
        var iv = CryptoJS.enc.Utf8.parse("1234567890000000"); //16位
        var srcs = CryptoJS.enc.Utf8.parse(str);
        var encrypted = CryptoJS.AES.encrypt(srcs, key, {
            iv: iv,
            mode: CryptoJS.mode.CBC,
            padding: CryptoJS.pad.Pkcs7
        });
        return encrypted.ciphertext.toString();
    }
    /*
     * AES解密 
     * @param str 密文字符串
     * @return 解密后的字符串
     */
    function AESDecrypt(str) {
        var key = CryptoJS.enc.Utf8.parse("12345678900000001234567890000000"); //32位
        var iv = CryptoJS.enc.Utf8.parse("1234567890000000"); //16位
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
    /*
     * 获得地址栏参数 
     * @param name 参数名
     * @return 参数值
     */
    function getUrlParam(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
        var r = window.location.search.substr(1).match(reg);  //匹配目标参数
        if (r != null) {
            return unescape(r[2]);
        }
        return null; //返回参数值
    }

    /*
     *生成一个唯一码
     */
    function newGuid() {
        function S4() {
            return (((1 + Math.random()) * 0x10000) | 0).toString(16).substring(1);
        }
        return (S4() + S4() + "-" + S4() + "-" + S4() + "-" + S4() + "-" + S4() + S4() + S4());
    }
    /*
     *生成一个唯一码
     */
    function goBack(func) {
        window.history.pushState(null, null, "#");
        if (window.history && window.history.pushState) {
            $(window).on('popstate', function () {
                func();
            });
        }
    }
});