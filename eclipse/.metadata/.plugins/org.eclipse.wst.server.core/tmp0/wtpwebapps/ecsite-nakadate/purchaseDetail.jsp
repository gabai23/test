<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="Content-Style-Type" content="text/css"/>
	<link rel="stylesheet" type="text/css" href="./CSS/buyItemHistory-style.css">
	<meta http-equiv="Content-Script-Type" content="text/javascript"/>
	<meta http-equiv="imagetoolbar" content="no"/>
	<meta name="description" content=""/>
	<meta name="keywords" content=""/>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

	<title>注文詳細</title>


</head>
<body>
		<!-- ヘッダー -->
		<jsp:include page="includeHeader.jsp"/>

		<div id="main" class="clearfix">

				<div id="top">
						<p>注文詳細</p>
				</div>


				<!-- 注文詳細 -->
				<div id="itemContainer" class="clearfix">

				<!-- 宛先情報 -->
				<div class="destinationContainer clearfix">

				<s:if test="message != null">
					<s:property value="message"/>
				</s:if>

				<s:form theme="simple">
				<s:iterator value="destinationList">
					<div class="box">
						<div class="destination_title">
							お届け先
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
				</s:form>

				<s:form action="GoDestinationChangeAction">
						<s:submit value="お届け先の変更"/>
				</s:form>

				</div>

				<s:iterator value="session.purchaseDetailList">

						<div id="itemDetail" class="ratio-1_1">

							<!-- 注文日 -->
							<div id="date">
									<p>
											<fmt:parseDate var="date" value="${insertDate}" pattern="yyyy-MM-dd HH:mm:ss.SS" />
											<fmt:formatDate value="${date}" pattern="yyyy年M月d日 HH:mm"/>
											ご注文分
									</p>
							</div>

							<!-- 画像 -->
							<div id="imageContainer">
									<img id ="image" src="<s:property value='itemImage'/>">
							</div>

							<!-- 金額 -->
							<div class="price">
									<span>価格: &yen; </span>
									<fmt:formatNumber value="${price}" />

									<br>

									<s:property value="count"/>点
							</div>



						</div>



				</s:iterator>

				</div>


				<!-- マイページに戻る -->
				<div class=link>
						<s:form action="BuyItemHistoryAction" class="button">
							<s:submit value="購入履歴に戻る"/>
						</s:form>
				</div>
		</div>


</body>
</html>