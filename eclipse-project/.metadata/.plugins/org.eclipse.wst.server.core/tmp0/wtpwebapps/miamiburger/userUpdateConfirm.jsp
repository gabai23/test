<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="Content-Style-Type" content="text/css" />
		<meta http-equiv="Content-Script-Type" content="text/javascript" />
		<meta http-equiv="imagetoolbar" content="no" /> <meta name="description" content="" />
		<link rel="stylesheet" type="text/css" href="./css/userUpdateConfirm.css">
		<meta name="keywords" content="" />
		<title>ユーザー情報変更画面</title>

	</head>
	<body>
<div class="wrapper">
	<div class="header">
		<jsp:include page="header.jsp" />
	</div>
	<div class="main">
		<h1>変更内容確認</h1>
		<div class="inner_1">
		<p>これまでのユーザー情報</p>
				<div class="character">
					<b>姓:</b><s:property value="session.old_familyName" />
				</div>
				<div class="character">
					<b>名:</b><s:property value="session.old_firstName" />
				</div>
				<div class="character">
					<b>姓（かな）:</b><s:property value="session.old_familyNameKana" />
				</div>
				<div class="character">
					<b>名（かな）:</b><s:property value="session.old_firstNameKana" />
				</div>
				<div class="character">
					<b>性別:</b><s:property value="session.old_sex_Name" />
				</div>
				<div class="character">
					<b>Eメール:</b><s:property value="session.old_email" />
				</div>
				<div class="character">
					<b>秘密の質問:</b><s:if test="session.old_secretQuestion==1">好きな食べ物</s:if><s:if test="session.old_secretQuestion==2">好きな動物</s:if>
				</div>
				<div class="character">
					<b>答え:</b><s:property value="session.old_secretAnswer" />
				</div>
		</div>
		<img class="img" src="./images/yajirusi.png" width="100px" height="100px">
		<div class="inner_2">
			<p>これからのユーザー情報</p>
				<div class="character">
					<b>姓:</b><s:property value="session.new_familyName" />
				</div>
				<div class="character">
					<b>名:</b><s:property value="session.new_firstName" />
				</div>
				<div class="character">
					<b>姓（かな）:</b><s:property value="session.new_familyNameKana" />
				</div>
				<div class="character">
					<b>名（かな）:</b><s:property value="session.new_firstNameKana" />
				</div>
				<div class="character">
					<b>性別:</b><s:property value="session.new_sex_Name" />
				</div>
				<div class="character">
					<b>Eメール:</b><s:property value="session.new_email" />
				</div>
				<div class="character">
					<b>秘密の質問:</b><s:if test="session.new_secretQuestion==1">好きな食べ物</s:if><s:if test="session.new_secretQuestion==2">好きな動物</s:if>
				</div>
				<div class="character">
					<b>答え:</b><s:property value="session.new_secretAnswer" />
				</div>
		</div>
		<div class="clear"></div>
			<div class="button">
				<input type="button"
					onclick="location.href='<s:url action="UserUpdateAction" />'"
					value="変更画面へ戻る" class="submitBtn"/>

				<input type="button"
					onclick="location.href='<s:url action="UserUpdateCompleteAction" />'"
					value="変更完了" class="submitBtn"/>
			</div>
	</div>
	<div class="push"></div>
</div>
	<jsp:include page="footer.jsp" />
	</body>
</html>