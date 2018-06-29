<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>宛先情報登録</title>
<link rel="stylesheet" type="text/css" href="./css/miamiburger.css">
<link rel="stylesheet" type="text/css" href="./css/address.css">
</head>
<body>
<div class="wrapper">
	<jsp:include page="header.jsp" />
	
		<div id="titleBox">
			<h2>以下の内容で登録します。よろしいですか？</h2>
		</div>
	
		<div id="confirmBox">
			名前<br>
			<div class="confirmText"><s:property value="destinationInfoDTO.getFamilyName()" />　<s:property value="destinationInfoDTO.getFirstName()" /></div><br>
			ふりがな<br>
			<div class="confirmText"><s:property value="destinationInfoDTO.getFamilyNameKana()" />　<s:property value="destinationInfoDTO.getFirstNameKana()" /></div><br>
			メールアドレス<br>
			<div class="confirmText"><s:property value="destinationInfoDTO.getEmail()" /></div><br>
			電話番号<br>
			<div class="confirmText"><s:property value="destinationInfoDTO.getTelNumber()" /></div><br>
			住所<br>
			<div class="confirmText"><s:property value="destinationInfoDTO.getUserAddress()" /></div><br>
	
			<a href="<s:url action='AddressCompleteAction'/>">登録する</a><br>
			<a href="<s:url action='AddressCreateAction'/>">戻る</a>
		</div>
	<div class="push"></div>
	</div>	
<jsp:include page="footer.jsp" />

</body>
</html>