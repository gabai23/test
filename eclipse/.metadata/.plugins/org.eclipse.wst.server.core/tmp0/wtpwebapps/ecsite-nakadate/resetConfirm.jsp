<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="Content-Style-Type" content="text/css"/>
	<link rel="stylesheet" type="text/css" href="./CSS/userUpdateConfirm-style.css">
	<meta http-equiv="Content-Script-Type" content="text/javascript"/>
	<meta http-equiv="imagetoolbar" content="no"/>
	<meta name="description" content=""/>
	<meta name="keywords" content=""/>

	<title>ユーザー情報変更画面</title>


</head>
<body>
		<!-- ヘッダー -->
		<jsp:include page="includeHeader.jsp"/>

		<div id="main">

				<div id="top">
						<p>ユーザー情報変更</p>
				</div>

				<div>
						<h3>変更する内容は以下でよろしいですか。</h3>
						<table>
								<s:form action="ResetCompleteAction">

								<div class="member-form-title">

								<!-- 氏名 -->
								<s:if test="session.reset.equals('name')">

										名前　　　　　　:　
										<s:property value="familyName"/>
										<s:hidden name="familyName" value="%{familyName}"/>
										<s:property value="firstName"/>
										<s:hidden name="firstName" value="%{firstName}"/>

										<br>
										ふりがな　　　　:　
										<s:property value="familyNameKana"/>
										<s:hidden name="familyNameKana" value="%{familyNameKana}"/>
										<s:property value="firstNameKana"/>
										<s:hidden name="firstNameKana" value="%{firstNameKana}"/>

										<br>
								</s:if>

								<!-- 性別 -->
								<s:elseif test="session.reset.equals('sex')">
										性別　　　　　　:　
										<s:if test="sex==0">
										男性
										</s:if>
										<s:else>
										女性
										</s:else>
										<s:hidden name="sex" value="%{sex}"/>

										<br>
								</s:elseif>

								<!-- メールアドレス -->
								<s:elseif test="session.reset.equals('email')">
										メールアドレス　:
										<s:property value="email"/>
										<s:hidden name="email" value="%{email}"/>

										<br>
								</s:elseif>

								<!-- ID -->
								<s:elseif test="session.reset.equals('userId')">
										ID　　　　:　
										<s:property value="userId"/>
										<s:hidden name="userId" value="%{userId}"/>

										<br>
								</s:elseif>

										<div class="button">
												<button type="submit">登録情報を確定</button>
										</div>

										<br>

										<div>
											<span>前画面に戻る場合は</span>
												<a class="" href='<s:url action="MyPageAction"/>'>こちら</a>
										</div>

								</div>
								</s:form>
						</table>
				</div>


		</div>

		<!-- フッター -->
		<jsp:include page="includeFooter.jsp"/>

</body>
</html>