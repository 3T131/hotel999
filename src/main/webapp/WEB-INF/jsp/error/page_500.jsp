<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>生亦酒店系统500 </title>

    <link rel="stylesheet" href="/static/bootstrap/css/bootstrap.css" type="text/css"></link>
    <link rel="stylesheet" href="/static/bootstrap/custom.min.css" type="text/css"></link>
  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <!-- page content -->
        <div class="col-md-12">
          <div class="col-middle">
            <div class="text-center">
              <h1 class="error-number">生亦酒店系统500</h1>
              <h2>Internal Server Error</h2>
              <p>发生了以下错误 <a href="${path}/StayRegister/tolist.do">返回?</a>
              </p>
              <p>${exception.message}</p>
            </div>
          </div>
        </div>
        <!-- /page content -->
      </div>
    </div>

  </body>
</html>