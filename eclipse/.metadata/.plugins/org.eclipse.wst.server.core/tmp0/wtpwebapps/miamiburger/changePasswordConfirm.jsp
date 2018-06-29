<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="imagetoolbar" content="no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="stylesheet" type="text/css" href="./css/default.css">
<title>パスワード再設定確認画面</title>
</head>


<script>
	function goChangePasswordAction() {
		document.getElementById('form-action').action = 'ChangePasswordAction';
	}
	function goChangePasswordCompleteAction() {
		document.getElementById('form-action').action = 'ChangePasswordCompleteAction';
	}
</script>
<body>
	<div class="wrapper">
		<div class="UC-header">
			<jsp:include page="header.jsp" />
		</div>

		<div id="titleBox">
			<h1>パスワード再設定</h1>
		</div>




		<div class="inner">
			<s:form id="form-action">
				<table>
					<tr>
						<th>ユーザーID</th>
						<td><s:property value="userId" escape="false" /></td>
					</tr>

					<tr>
						<th>パスワード</th>
						<td><s:property value="passCon1" escape="false" /></td>
					</tr>

					<tr>
						<th>再確認用パスワード</th>
						<td><s:property value="passCon2" escape="false" /></td>
					</tr>

					<tr>
						<th>秘密の質問</th>
						<td><s:if test="secretQuestion==1">好きな食べ物</s:if> <s:if
								test="secretQuestion==2">好きな動物</s:if></td>
					</tr>

					<tr>
						<th>質問の答え</th>
						<td><s:property value="secretAnswer" escape="false" /></td>
					</tr>
				</table>

				<!-- 送る -->
				<s:hidden name="userId" />
				<s:hidden name="password1" />
				<s:hidden name="password2" />
				<s:hidden name="secretQuestion" />
				<s:hidden name="secretAnswer" />

			<s:if test="userId.equals('null')">
			エラー<a href="<s:url action="HomeAction"/>">ホームに戻る</a>
			</s:if>
			<s:else>
				<div id="button">

					<s:submit value="訂正" onclick="goChangePasswordAction();"
						class="submitBtn" />
					<s:submit value="送信" onclick="goChangePasswordCompleteAction();"
						class="submitBtn" />

				</div>
			</s:else>


			</s:form>
		</div>
		<div class="push"></div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>