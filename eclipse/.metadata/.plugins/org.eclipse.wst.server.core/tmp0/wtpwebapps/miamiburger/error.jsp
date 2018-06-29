<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="refresh" content="5;URL='StartAction'" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="refresh" content=";URL=<s:url action="HomeAction"/>">
<link rel="stylesheet" type="text/css" href="./css/miamiburger.css">
<link rel="stylesheet" type="text/css" href="./css/default.css">
<title>エラー</title>
</head>
<body>
<div class="wrapper">
	<jsp:include page="header.jsp" />

	<div id="titleBox">
		<h1>エラー</h1>
	</div>

	<div class="inner">
		<h2>5秒後に<a href='<s:url action="HomeAction"/>'>Home</a>に戻ります。</h2>
	</div>

	<div class="push"></div>
</div>
<jsp:include page="footer.jsp" />

</body>
</html>