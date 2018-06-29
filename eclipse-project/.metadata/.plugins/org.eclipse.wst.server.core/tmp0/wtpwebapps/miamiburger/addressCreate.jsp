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
<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
</head>
<body>
<div class="wrapper">
	<jsp:include page="header.jsp" />
		<div id="titleBox">
			<h1>宛先情報登録</h1>
		</div>

		<div id="formBox">
			<s:form action="AddressConfirmAction">
				<table>
					<tr>
						<td>●お名前</td>
					</tr>
					<tr>
						<td>姓:</td>
						<td><input type="text" name="family_name" <s:if test="errorSei.equals('')">value=<s:property value="session.destinationInfoDTO.getFamilyName()"/> </s:if> ></td>
						<td> <s:if test="!errorSei.equals('')"><span class="error">エラー 詳細はこちら</span><span class="tooltip"><s:property value="errorSei"/></span></s:if></td>
					</tr>
					<tr>
						<td>名:</td>
						<td><input type="text" name="first_name" <s:if test="errorMei.equals('')">value=<s:property value="session.destinationInfoDTO.getFirstName()"/> </s:if> ></td>
						<td><s:if test="!errorMei.equals('')"><span class="error">エラー 詳細はこちら</span><span class="tooltip"><s:property value="errorMei"/></span></s:if></td>
					</tr>

					<tr>
						<td>姓ふりがな:</td>
						<td><input type="text" name="family_name_kana" <s:if test="errorSeiKana.equals('')">value=<s:property value="session.destinationInfoDTO.getFamilyNameKana()"/> </s:if> ></td>
						<td><s:if test="!errorSeiKana.equals('')"><span class="error">エラー 詳細はこちら</span><span class="tooltip"><s:property value="errorSeiKana"/></span></s:if></td>
					</tr>
					<tr>
						<td>名ふりがな:</td>
						<td><input type="text" name="first_name_kana" <s:if test="errorMeiKana.equals('')">value=<s:property value="session.destinationInfoDTO.getFirstNameKana()"/> </s:if> ></td>
						<td><s:if test="!errorMeiKana.equals('')"><span class="error">エラー 詳細はこちら</span><span class="tooltip"><s:property value="errorMeiKana"/></span></s:if></td>
					</tr>
					<tr>
						<td>●メールアドレス</td>
						<td><input type="text" name="email" size="50" <s:if test="errorEmail.equals('')">value=<s:property value="session.destinationInfoDTO.getEmail()"/> </s:if> ></td>
						<td><s:if test="!errorEmail.equals('')"><span class="error">エラー 詳細はこちら</span><span class="tooltip"><s:property value="errorEmail"/></span></s:if></td>
					</tr>
					<tr>
					<td>●電話番号</td>
						<td><input type="text" name="tel_number" <s:if test="errorTelNumber.equals('')">value=<s:property value="session.destinationInfoDTO.getTelNumber()"/> </s:if> ></td>
						<td><s:if test="!errorTelNumber.equals('')"><span class="error">エラー 詳細はこちら</span><span class="tooltip"><s:property value="errorTelNumber"/></span></s:if></td>
					</tr>
					<tr>
						<td>●住所</td>
						<td><input type="text" name="user_address" size="50" <s:if test="errorUserAddress.equals('')">value=<s:property value="session.destinationInfoDTO.getUserAddress()"/> </s:if> ></td>
						<td><s:if test="!errorUserAddress.equals('')"><span class="error">エラー 詳細はこちら</span><span class="tooltip"><s:property value="errorUserAddress"/></span></s:if></td>
					</tr>
					<tr>
						<td></td>
						<td><s:submit value="送信" class="submitBtn"/></td>
						<td></td>
					</tr>
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