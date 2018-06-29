<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="Content-Style-Type" content="text/css" />
		<meta http-equiv="Content-Script-Type" content="text/javascript" />
		<meta http-equiv="imagetoolbar" content="no" /> <meta name="description" content="" />
		<meta name="keywords" content="" />
		<title>パスワード変更画面</title>
		<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
		<link rel="stylesheet" type="text/css" href="./css/myPageChangePassword.css">
		<style type="text/css"></style>
	</head>
	<body>
	<div class="header">
		<jsp:include page="header.jsp" />
	</div>
	<div class="main">
		<h1>パスワード変更</h1>
		<div class="inner">
		<!-- ユーザー情報変更フォーム -->
			<div class="character">
				<b>旧パスワード</b><br>
			<div class="character">
				<s:property value="session.passCon"/>
			</div>
			</div>
			<div class="character">
				<b>新規パスワード</b>
			</div>
				<s:form action="MyPageChangePasswordCompleteAction">
			<div class="character">
				<b>1回目</b>
				<input type="password" pattern="^[0-9A-Za-z]+$" name="new_password_1" placeholder=" 半角英数字 " maxlength="16"><br>
			</div>
			<div class="character">
				<b>2回目</b>
				<input type="password" pattern="^[0-9A-Za-z]+$" name="new_password_2" placeholder=" 半角英数字 " maxlength="16"><br>
			</div>
			<div class="character">
				<s:if test="!errorPass.equals('')">
					<span class="error">エラー 詳細はこちら</span><span class="tooltip"><s:property value="errorPass" /></span>
				</s:if>
			</div>

				<s:submit value="パスワード変更完了" class="submitBtn"/>

			</s:form>
		</div>
	</div>

<!-- マイページ画面への遷移 -->
	<p><a href='<s:url action="MyPageAction" />'>マイページ戻る</a></p>
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
					"left":(e.pageX )+10+"px"
				});
			});
		});
	</script>
	</body>
</html>