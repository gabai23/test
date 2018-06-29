<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="imagetoolbar" content="no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<meta charset="utf-8">
<title>ユーザー情報入力画面</title>
<link rel="stylesheet" type="text/css" href="miamiburger.css">
<link rel="stylesheet" type="text/css" href="./css/userCreate.css">
<link rel="stylesheet" type="text/css" href="userCreate.html">
<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
</head>
<body>
<div class="wrapper">
		<jsp:include page="header.jsp" />


	<div class="main">
		<h1>ユーザー登録</h1>
		<div class="inner">
			<h3>情報を入力してください</h3>


			<s:form action="UserCreateConfirmAction">
<table>
				<!-- ユーザーID -->
				<tr>

					<td>ログインID:</td> <td><input type="text" name="userId" placeholder="半角英数字 "
						maxlength="8" value=<s:property value="session.userId" />></td>
					<td><s:if test="!errorId.equals('')"><span class="error">エラー 詳細はこちら</span><span class="tooltip"><s:property value="errorId" /></span>
					</s:if></td>
				</tr>


				<!-- パスワード -->
				<tr>
					<td>パスワード:</td> <td><input type="password" name="password" placeholder=" 半角英数字 "
						maxlength="16"></td>
					<td><s:if test="!errorPass.equals('')"><span class="error">エラー 詳細はこちら</span><span class="tooltip"><s:property value="errorPass" /></span>
					</s:if></td>
				</tr>


				<!-- 名前 -->
				<tr>
					<td>姓:</td> <td><input type="text" name="familyName"
						placeholder=" 漢字,ひらがな,半角英字 " maxlength="16"
						value=<s:property value="session.familyName"/>></td>
					<td>
					<s:if test="!errorSei.equals('')"><span class="error">エラー 詳細はこちら</span><span class="tooltip"><s:property value="errorSei" /></span>
					</s:if></td>
				</tr>

				<tr>
					<td>名:</td> <td><input type="text" name="firstName" placeholder=" 漢字,ひらがな,半角英字 "
						maxlength="16" value=<s:property value="session.firstName"/>></td>
					<td><s:if test="!errorMei.equals('')"><span class="error">エラー 詳細はこちら</span><span class="tooltip"><s:property value="errorMei" /></span>
					</s:if></td>
				</tr>


				<!-- なまえ -->
				<tr>
					<td>姓ふりがな:</td> <td><input type="text" name="familyNameKana" placeholder=" ひらがな"
						maxlength="16" value=<s:property value="session.familyNameKana"/>></td>
					<td><s:if test="!errorSeiKana.equals('')"><span class="error">エラー 詳細はこちら</span><span class="tooltip"><s:property value="errorSeiKana" /></span>
					</s:if></td>
				</tr>
				<tr>
					<td>名ふりがな:</td> <td><input type="text" name="firstNameKana" maxlength="16"
						placeholder=" ひらがな"
						value=<s:property value="session.firstNameKana"/>></td>
					<td><s:if test="!errorMeiKana.equals('')"><span class="error">エラー 詳細はこちら</span><span class="tooltip"><s:property value="errorMeiKana" /></span>
					</s:if></td>
				</tr>
				<!-- 性別 -->

				<tr><td>	性別:</td>
				<td>	<s:if test="#session.sex==0">

						<input type="radio" name="sex" value="0" checked="checked">男 <input
							type="radio" name="sex" value="1">女

				</s:if>
					<s:if test="#session.sex==1">
						<input type="radio" name="sex" value="0">男 <input
							type="radio" name="sex" value="1" checked="checked">女

				</s:if>

				</td></tr>

				<!-- メールアドレス -->
				<tr>

					<td>メールアドレス:</td> <td><input type="text" name="email" placeholder=" 半角英数字,記号 "
						maxlength="32" value=<s:property value="session.email"/>></td>
					<td><s:if test="!errorEmail.equals('')"><span class="error">エラー 詳細はこちら</span><span class="tooltip"><s:property value="errorEmail" /></span>
					</s:if></td>
				</tr>
				<tr><td>	秘密の質問:</td>

				<td>	<s:if test="#session.secretQuestion==1">
						<select name="secretQuestion" class="form">
							<option value="1" selected>好きな食べ物</option>
							<option value="2">好きな動物</option>
						</select>
					</s:if>

					<s:elseif test="#session.secretQuestion==2">
						<select name="secretQuestion" class="form">
							<option value="1">好きな食べ物</option>
							<option value="2" selected>好きな動物</option>
						</select>
					</s:elseif>

					<s:else>
						<select name="secretQuestion" class="form">
							<option value="1" selected>好きな食べ物</option>
							<option value="2">好きな動物</option>
						</select>
					</s:else></td>

					<td><s:if test="!errorQuestion.equals('')"><span class="error">エラー 詳細はこちら</span><span class="tooltip"><s:property value="errorQuestion" /></span>
					</s:if></td>
				</tr>
				<!-- 質問の答え -->

				<tr>

				<td>	答え:</td> <td><input type="text" name="secretAnswer"
						placeholder="漢字,ひらがな,半角英数字,記号 " maxlength="10" size="25"
						value=<s:property value="session.secretAnswer"/>></td>
					<td>
					<s:if test="!errorAnswer.equals('')"><span class="error">エラー 詳細はこちら</span><span class="tooltip"><s:property value="errorAnswer" /></span>
					</s:if></td>
				</tr>

				<tr><td><s:submit value="登録確認" class="submitBtn"/></td></tr>
</table>

			</s:form>
		</div>
			</div>
<div class="push"></div>
</div>
<jsp:include page="footer.jsp" />
	<script>
		$(function(){
			$('span.tooltip').css({
				opacity:'0.9',
				position:'absolute',
				display:'none'
			});
			$('span.error').mouseover(function(){
				$(this).parent().find('span.tooltip').fadeIn();
			}).mouseout(function(){
				$(this).parent().find('span.tooltip').fadeOut();
			}).mousemove(function(e){
				$(this).parent().find('span.tooltip').css({
					"top":(e.pageY -300)+10+"px",
					"left":(e.pageX - $(window).width()*(30/100))+10+"px"
				});
			});
		});
	</script>

</body>
</html>