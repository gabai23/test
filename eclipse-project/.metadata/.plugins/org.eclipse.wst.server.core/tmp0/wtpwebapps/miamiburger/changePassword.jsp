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
<title>パスワード変更</title>
<link rel="stylesheet" type="text/css" href="./css/miamiburger.css">
<link rel="stylesheet" type="text/css" href="./css/default.css">
<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
</head>
<body>
<div class="wrapper">
<div class="UC-header">
	<jsp:include page="header.jsp" />
</div>

<div id="titleBox">
<h1>秘密の質問に答えてください</h1>
</div>

<div class="inner">
<s:if test = "!(errorMessage.isEmpty())">
	<span><s:property value ="errorMessage" /></span>
</s:if>

<s:form action ="ChangePasswordConfirmAction">
<table>
	<tr>
		<td>あなたのログインID：</td>
		<td><input type="text" name="userId" size="8"></td>
		<s:if test="!(errorId.equals(''))">
				<td><span class="error">エラー 詳細はこちら</span><span class="tooltip"><s:property value="errorId" /></span></td>
		</s:if>

	</tr>

	<tr>
		<td>秘密の質問：</td>

		<td><select name="secretQuestion">
		<option value = "1">好きな食物</option>
		<option value = "2">好きな生物</option>
		</select></td>
	</tr>

	<tr>
		<td>秘密の質問の答え：</td>
		<td><input type= "text" name="secretAnswer" size="16"></td>

		<s:if test="!(errorAnswer.equals(''))">
				<td><span class="error">エラー 詳細はこちら</span><span class="tooltip"><s:property value="errorAnswer" /></span></td>
		</s:if>
	<tr>

	<tr>
		<td>パスワード：</td>
		<td><input type= "password" name="password1" size="16"></td>

		<s:if test="!(errorPass.equals(''))">
				<td><span class="error">エラー 詳細はこちら</span><span class="tooltip"><s:property value="errorPass" /></span></td>
		</s:if>
	</tr>

	<tr>
		<td>再確認パスワード：</td>
		<td><input type= "password" name="password2" size="16"></td>

		<s:if test="!(errorRePass.equals(''))">
			<td><span class="error">エラー 詳細はこちら</span><span class="tooltip"><s:property value="errorRePass" /></span></td>
		</s:if>
	</tr>

	<tr><td><s:submit value="送信" class="submitBtn"/></td></tr>
</table>

	</s:form>
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
					"top":(e.pageY)+10+"px",
					"left":(e.pageX)+10+"px"
				});
			});
		});
	</script>
</body>
</html>