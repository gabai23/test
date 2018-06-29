<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="./css/cart.css">
<link rel="stylesheet" type="text/css" href="./css/miamiburger.css">
<title>カート内容</title>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="header.jsp" />

		<div class="main">
			<div class="inner">
				<div class="text">
					<h1>カート内容</h1>
					<h3>
						カート合計金額：
						<s:property value="totalPrice" />
						<span>円</span>
					</h3>

					<div class="error"><s:property value='errorMes' /></div>

					<s:if
						test="!#session.cartList.isEmpty() && #session.containsKey('userInfoDTO')">
						<s:form action="AddressSelectAction">
							<s:submit value="決済" class="p" />
						</s:form>
					</s:if>
					<s:elseif test="!#session.cartList.isEmpty()">
						<s:form action="LoginAction">
							<s:submit value="決済" class="p" />
						</s:form>
					</s:elseif>
				</div>
				<s:form action="CartDeleteAction">
				<s:iterator value="#session.cartList">

					<div class="cart_info">
						<img src='<s:property value="imageFilePath"/>' width="100"
							height="100" alt=<s:property value="imageFileName"/> /> <b>商品名:<s:property
								value="productName" /></b><br>
						<div class="ruby">
							ふりがな:
							<s:property value="productNameKana" />
						</div>
						値段:
						<s:property value="price" />
						円<br> 購入個数合計金額:
						<s:property value="totalPrice" />
						円 (
						<s:property value="productCount" />
						個購入)<br> 発売年月日：
						<s:property value="releaseDate" />
						<div class="button">


								<label><input type="checkbox" name ="cartId" value="<s:property value='cartId' />"/>削除</label>


						</div>
						<div class="clear"></div>
					</div>

				</s:iterator>
			<div class="button">
				<s:if test ="!(#session.cartList.isEmpty())">
					<s:submit value="削除" class="delete" />
				</s:if>
			</div>
			</s:form>

				<s:if test="cartList.isEmpty()">
					<!--カートリストが空(0)の時、trueを返す-->
					<h1>カートの中は空です</h1>
				</s:if>

				<div class="clear"></div>
			</div>
		</div>
		<div class="push"></div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>