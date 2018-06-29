<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="./css/purchaseHistorydelete.css">
<title>商品履歴削除完了</title>
</head>
<body>
<div class="wrapper">
<jsp:include page="header.jsp" />


<div class="inner">

<h1>削除が完了しました。</h1>
<div class="text">
<a href="<s:url action="MyPageAction"/>">マイページに戻る</a>
</div>
</div>

<div class="push"></div>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>