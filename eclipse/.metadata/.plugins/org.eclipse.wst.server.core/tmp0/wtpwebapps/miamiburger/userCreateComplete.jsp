<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<%-- <meta http-equiv="refresh"  content="5;URL=<s:url action="HomeAction"/>"> --%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="imagetoolbar" content="no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<title>登録完了画面</title>
<link rel="stylesheet" type="text/css" href="./css/miamiburger.css">
<link rel="stylesheet" type="text/css" href="./css/userCreateComplete.css">


</head>
<body>
<div class="wrapper">
<jsp:include page="header.jsp" />

<div class="titleBox">
	<h1>ユーザーの登録が完了しました。</h1>
</div>

<div class="inner">

       <div class="UCComplete-text">
          <h2>5秒後に<a href='<s:url action="HomeAction"/>'>Home</a>に戻ります。</h2>

</div>
</div>
<div class="push"></div>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>