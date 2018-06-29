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



<link rel="stylesheet" href="./css/home.css">
<link rel="stylesheet" href="./css/homeanime.css">


<title>ホーム</title>

</head>
<body>
	<div class="header">
		<jsp:include page="header.jsp" />
	</div>

	<div class="bg1">
		<div class="neonbox">
			<div class="neon">
				MIAMI<br>BURGER
			</div>
			<div class="flux">
				miami taste humburger shopsite <br>
				__________________________________
				<!-- 				________________________________________________ -->
			</div>
		</div>
		<img src="./images/bg4.jpg" class="layer">
	</div>


	<div class="bg3">
		<img src="./images/bg2.jpg">
	</div>

	<jsp:include page="footer.jsp" />

	<!-- <div class="bg3"></div> -->
	<!-- <div class="bg4"></div> -->
</body>
</html>