//=====================初始化代码======================
$(function () {
    //检查是否注册条款
    if($("#chkAgree").length > 0){
        $("#btnSubmit").prop("disabled", true);
    }
    //同意条款
	$("#chkAgree").click(function () {
		if ($(this).is(":checked")) {
			$("#btnSubmit").prop("disabled", false);
		} else {
			$("#btnSubmit").prop("disabled", true);
		}
	});

    //初始化验证表单
	$("#regForm").mvalidate({
		type:1,
        onKeyup:true,
        sendForm:false,
        firstInvalidFocus:true,
        valid:function(event,options){
			$.ajax({
				type:"post",
				url:$("#regForm").attr("url"),
				data:$("#regForm").serialize(),
				dataType:"json",
                beforeSend: showRequest,
                success: showResponse,
                error: showError,
                timeout: 60000
            });
            return false;
		},conditional:{
            confirmpwd:function(){
                return $("#txtPassword").val()==$("#txtPassword1").val();
            }
        },descriptions:{
            confirmpassword:{
                required:'请再次输入密码',
                conditional:'两次密码不一致'
            }
        }
	});

    //表单提交前
    function showRequest(formData, jqForm, options) {
		$("#btnSubmit").val("正在提交...")
        $("#btnSubmit").prop("disabled", true);
    }
    //表单提交后
    function showResponse(data, textStatus) {
        if (data.status == 1) { //成功
            weui.alert(data.msg, function(){
                location.href = data.url;
            });
        } else { //失败
            weui.alert(data.msg, function(){
                $("#btnSubmit").val("重新提交");
                $("#btnSubmit").prop("disabled", false);
            });
        }
    }
    //表单提交出错
    function showError(XMLHttpRequest, textStatus, errorThrown) {
        weui.alert('状态：' + textStatus + '；出错提示：' + errorThrown, function(){
            $("#btnSubmit").val("重新提交");
            $("#btnSubmit").prop("disabled", false);
        });
    }
});