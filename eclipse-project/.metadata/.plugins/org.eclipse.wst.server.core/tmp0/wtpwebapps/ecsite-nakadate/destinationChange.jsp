<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="Content-Style-Type" content="text/css"/>
	<link rel="stylesheet" type="text/css" href="./CSS/buyItemConfirm-style.css">
	<meta http-equiv="Content-Script-Type" content="text/javascript"/>
	<meta http-equiv="imagetoolbar" content="no"/>
	<meta name="description" content=""/>
	<meta name="keywords" content=""/>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<title>宛先変更画面</title>


	<script type="text/javascript">
			function submitAction(url) {
				$('form').attr('action',url);
				$('form').submit();
			}
	</script>
</head>
<body>
		<!-- ヘッダー -->
		<jsp:include page="includeHeader.jsp"/>

		<div id="main">
				<div id="top">
						<p>宛先変更</p>
				</div>


				<!-- 宛先情報 -->
				<div class="destinationContainer clearfix">

				<s:form action="DestinationChangeAction">
				<s:iterator value="session.destinationList">
					<div class="box">
						<div class="destination_title">

							<label>
									<input type="radio" name="destinationId" value="${id}" checked="checked"/>
								お届け先
							</label>
						</div>

						<div class="destination_box">
							ふりがな:
							<s:property value="familyNameKana"/>
							<s:property value="firstNameKana"/>
							<br>
							名前:
							<s:property value="familyName"/>
							<s:property value="firstName"/>
							<br>
							住所:
							<s:property value="userAddress"/>
							<br>
							電話番号:
							<s:property value="telNumber"/>
							<br>
							メールアドレス:
							<s:property value="email"/>
							<br>
						</div>
					</div>

				</s:iterator>
					<button type='submit' name='action' value='change'>宛先の変更</button>
				</s:form>

				</div>

				<div class="box2">
					<div class="btn_1">
						<s:form action="GoDestinationInsertAction">
							<s:submit value="宛先情報の新規登録"/>
							<input type="hidden" name="where" value="fromDestinationChange"/>
						</s:form>

					</div>


				</div>
		</div>

		<!-- フッター -->
		<jsp:include page="includeFooter.jsp"/>

</body>
</html>