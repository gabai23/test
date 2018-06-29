<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css" href="./css/miamiburger.css">
<link rel="stylesheet" type="text/css" href="./css/purchaseHistory.css">
<title>購入履歴</title>
</head>
<body>
<div class="wrapper">
	<div class="header">
		<jsp:include page="header.jsp" />
	</div>
	<div class="PH-main">
		<div class="PH-title">
			<h1>購入履歴 時間別</h1>
		</div>

		<s:if test="emptyMessage == null">
			<s:iterator value="purchaseListDTOList">
				<div class="PH-inner">
					<div class="text">
						購入日時：
						<s:property value="registDate" />
						<br> 合計金額:
						<s:property value="totalPrice" />
						円
					</div>
					<div class="submit">
						<s:form action="PurchaseHistoryDetailsAction">
							<s:hidden name="allPurchaseListNumber" />
							<s:submit value="詳細" class="details-submit" />
						</s:form>
					</div>
				</div>
			</s:iterator>
			<div class="clear"></div>
			<div class="Del-submit">
				<s:form action="PurchaseHistoryAction">
					<input type="hidden" name="deleteFlg" value=true />
					<s:submit value="削除" class="decision-submit" />
				</s:form>
			</div>
		</s:if>
		<s:else>
			<CENTER><s:property value="emptyMessage" /></CENTER>
		</s:else>

	</div>

<div class="push"></div>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>