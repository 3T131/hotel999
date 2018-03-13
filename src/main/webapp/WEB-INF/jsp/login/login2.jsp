<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>生亦酒店登录 </title>

    <link rel="stylesheet" href="/static/bootstrap/css/bootstrap.css" type="text/css"></link>
    <link rel="stylesheet" href="/static/bootstrap/custom.min.css" type="text/css"></link>
    <link rel="stylesheet" href="/static/bootstrap/animate.min.css" type="text/css"></link>

</head>

<body class="login">
<div>
    <input type="hidden" id="path" value="${path}" >
    <a class="hiddenanchor" id="signup"></a>
    <a class="hiddenanchor" id="signin"></a>

    <div class="login_wrapper">
        <div class="animate form login_form">
            <section class="login_content">
                <form method="post" action="${path}/user/login.do">
                    <h1>登录</h1>
                    <h1 style="color: red">${error}</h1>
                    <div>
                        <input style="height: 30px;width: 270px;" type="text" name="contactPhoneNUmber" value="122" class="form-control" placeholder="用户名/手机号" required="" />
                    </div>
                    <div>
                        <input style="height: 30px;width: 270px;" type="password" name="teamCode" value="55555" class="form-control" placeholder="密码" required="" />
                    </div>
                    <div>
                        <input type="submit" class="btn btn-default submit" value="登录"/>
                        <a class="reset_pass" href="#">忘记密码?</a>
                    </div>

                    <div class="clearfix"></div>

                    <div class="separator">
                        <div class="clearfix"></div>
                        <br />
                        <div>
                            <h1><i class="fa fa-paw"></i> 生亦酒店系统</h1>
                            <p>©2017 All Rights Reserved. Zeliang's supermarket order system USES Bootstrap</p>
                        </div>
                    </div>
                </form>
            </section>
        </div>
    </div>
</div>
</body>
</html>