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
<link rel="stylesheet" type="text/css" href="./css/userUpdate.css">
<title>ユーザー情報変更入力画面</title>

</head>
<body>
<div class="wrapper">
	<div class="header">
		<jsp:include page="header.jsp" />
	</div>
	<div class="main">
		<h1>ユーザー情報変更</h1>
		<div class="inner">
			<s:form action="UserUpdateConfirmAction">
				<table class="user_info">
					<tr>
						<td class="character"><b>姓:</b>※16文字以内</td>
						<td class="character"><input name="new_familyName"
							maxlength="16"
							value="<s:property value="session.new_familyName" />"></td>
						<td><s:if test="!(errorName.equals(''))">
								<span class="error">エラー 詳細はこちら</span>
								<span class="tooltip"><s:property value="errorName" /></span>
							</s:if></td>
					</tr>
					<tr>
						<td class="character"><b>名:</b>※16文字以内</td>
						<td class="character"><input name="new_firstName"
							maxlength="16"
							value="<s:property value="session.new_firstName" />"></td>
					</tr>

					<tr>
						<td class="character"><b>姓（かな）:</b>※16文字以内</td>
						<td class="character"><input name="new_familyNameKana"
							maxlength="16"
							value="<s:property value="session.new_familyNameKana" />"></td>
						<td><s:if test="!(errorNameKana.equals(''))">
								<span class="error">エラー 詳細はこちら</span>
								<span class="tooltip"><s:property value="errorNameKana" /></span>
							</s:if></td>
					</tr>
					<tr>
						<td class="character"><b>名（かな）:</b>※16文字以内</td>
						<td class="character"><input name="new_firstNameKana"
							maxlength="16"
							value="<s:property value="session.new_firstNameKana" />"></td>
					</tr>
					<tr>
						<td class="character"><b>性別:</b></td>
						<s:if test="session.get('new_sex') == 0 ">
							<td><input type="radio" name="new_sex" value="0" checked>男性</td>
							<td><input type="radio" name="new_sex" value="1">女性</td>
						</s:if>
						<s:else>
							<td><input type="radio" name="new_sex" value="0">男性</td>
							<td><input type="radio" name="new_sex" value="1" checked>女性</td>
						</s:else>
					</tr>
					<tr>
						<td class="character"><b>Eメール</b>※14文字～32文字</td>
						<td class="character"><input name="new_email" maxlength="32"
							value="<s:property value="session.new_email" />"></td>
						<td><s:if test="!(errorEmail.equals(''))">
								<span class="error">エラー 詳細はこちら</span>
								<span class="tooltip"><s:property value="errorEmail" /></span>
							</s:if></td>
					</tr>
					<tr>
						<td class="character"><b>秘密の質問</b></td>
						<td class="character"><s:if
								test="session.new_secretQuestion==1">
								<select name="new_secretQuestion">
									<option value="1" selected>好きな食べ物</option>
									<option value="2">好きな動物</option>
								</select>
							</s:if> <s:elseif test="session.new_secretQuestion==2">
								<select name="new_secretQuestion">
									<option value="1">好きな食べ物</option>
									<option value="2" selected>好きな動物</option>
								</select>
							</s:elseif></td>
					</tr>
					<tr>
						<td class="character"><b>秘密の答え</b></td>
						<td class="character"><input name="new_secretAnswer"
							maxlength="10"
							value="<s:property value="session.new_secretAnswer" />"></td>
						<td><s:if test="!(errorAnswer.equals(''))">
								<span class="error">エラー 詳細はこちら</span>
								<span class="tooltip"><s:property value="errorAnswer" /></span>
							</s:if></td>
					</tr>
					<tr>
						<td></td>
						<td><br></td>
						<td><s:submit value="確認画面へ" class="submitBtn" /></td>
					</tr>
				</table>
			</s:form>
		</div>
	</div>

	<!-- マイページ画面への遷移 -->
	<p align="center">
		<a href='<s:url action="MyPageAction" />'>マイページ戻る</a>
	</p>
	<div class="push"></div>
</div>
	<jsp:include page="footer.jsp" />

	<script>
		$(function() {
			$('span.tooltip').css({
				opacity : '0.9',
				position : 'absolute',
				display : 'none'
			});
			$('span.error').mouseover(function() {
				$(this).parent().find('span.tooltip').fadeIn();
			}).mouseout(function() {
				$(this).parent().find('span.tooltip').fadeOut();
			}).mousemove(function(e) {
				$(this).parent().find('span.tooltip').css({
					"top" : (e.pageY) + 10 + "px",
					"left" : (e.pageX) + 10 + "px"
				});
			});
		});
	</script>

</body>
</html>