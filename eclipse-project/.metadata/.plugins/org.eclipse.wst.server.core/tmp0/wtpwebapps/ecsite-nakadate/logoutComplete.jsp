<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="Content-Style-Type" content="text/css"/>
	<link rel="stylesheet" type="text/css" href="./CSS/logoutComplete-style.css">
	<meta http-equiv="Content-Script-Type" content="text/javascript"/>
	<meta http-equiv="imagetoolbar" content="no"/>
	<meta name="description" content=""/>
	<meta name="keywords" content=""/>

	<title>ログアウト画面</title>


</head>
<body>
		<!-- ヘッダー -->
		<jsp:include page="includeHeader.jsp"/>

		<div id="main">
				<div id="top">
						<p>ログアウト</p>
				</div>
				<div>
						<!-- ログアウト完了 -->


						<s:form action="StartAction">


							<div class="logoutComplete">
							<h1>ログアウトしました</h1>
							</div>

							<div class="toplink">
							<button type="submit">
								<span>TOPページへ</span>
							</button>
							</div>


						</s:form>



				</div>
		</div>

		<!-- フッター -->
		<jsp:include page="includeFooter.jsp"/>

</body>

</html>