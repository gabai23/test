<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
if(!(session.getAttribute("admin") == "admin")){
  out.println("本ページへのアクセスは認められていません");
  out.close();
}
%>
<!DOCTYPE html>
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="Content-Style-Type" content="text/css" />
		<meta http-equiv="Content-Script-Type" content="text/javascript" />
		<meta http-equiv="imagetoolbar" content="no" /> <meta name="description" content="" />
		<meta name="keywords" content="" />
		<title>完了画面</title>
		<link rel="stylesheet" type="text/css" href="./css/masterAddComplete.css">
		<style type="text/css"></style>
</head>
<body>
<div class="wrapper">
<jsp:include page="header.jsp" />
	<div class="main">
	<h1>登録が完了しました</h1>
	<p><a href='<s:url action="GoMasterAction" />'>管理画面へ</a></p>
	</div>
<div class="push"></div>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>