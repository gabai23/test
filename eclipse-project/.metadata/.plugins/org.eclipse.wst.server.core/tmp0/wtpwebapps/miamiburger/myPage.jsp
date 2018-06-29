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
<link rel="stylesheet" type="text/css" href="./css/myPage.css">
<title>MyPage画面</title>
<style type="text/css"></style>
</head>
<body>
		<div class="header">
			<jsp:include page="header.jsp" />
		</div>
		<div class="main">
			<h1>―マイページ―</h1>
			<div class="inner">
				<div class="user_info">
					<p>■　ユーザー情報</p>
					<div class="character">
						<b>姓:</b><s:property value="session.new_familyName" />
					</div>
					<div class="character">
						<b>名:</b><s:property value="session.new_firstName" />
					</div>
					<div class="character">
						<b>ふりがな:</b><s:property value="session.new_familyNameKana" /><s:property value="session.new_firstNameKana" />
					</div>
					<div class="character">
						<b>性別:</b><s:property value="session.old_sex_Name" />
					</div>
					<div class="character">
						<b>メールアドレス:</b><s:property value="session.new_email" />
					</div>
				</div>
				<div class="button">
				<!-- ユーザー情報変更画面への遷移 -->
				<input type="button"
					onclick="location.href='<s:url action="UserUpdateAction" />'"
					value="ユーザー情報変更" class="submitBtn"/><br>

				<!-- パスワード再設定画面への遷移 -->
				<input type="button"
					onclick="location.href='<s:url action="MyPageChangePasswordAction" />'"
					value="パスワード変更" class="submitBtn" /><br>

				<!-- 購入履歴画面への遷移 -->
				<input type="button"
					onclick="location.href='<s:url action="PurchaseHistoryAction" />'"
					value="購入履歴" class="submitBtn" /><br>
				</div>
			</div>
		</div>
		<jsp:include page="footer.jsp" />
</body>
</html>
