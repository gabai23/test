<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="imagetoolbar" content="no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<title>完了画面</title>
<style type="text/css"></style>
<link rel="stylesheet" type="text/css" href="./css/myPageChangePasswordComplete.css">
</head>
<body>
<div class="wrapper">
	<jsp:include page="header.jsp" />
	<div class="main">
	<h1>登録が完了しました</h1>
	<p><a href='<s:url action="MyPageAction" />'>マイページへ</a></p>
	</div>
	<div class="push"></div>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>