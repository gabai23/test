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
<link rel="stylesheet" href="./css/miamiburger.css">
<link rel="stylesheet" href="./css/productInfo.css">
<title><s:property value="session.productName" /></title>

<style>
</style>
</head>
<body>
<div class="wrapper">
	<div class="header">
		<jsp:include page="header.jsp" />
	</div>
	<div class="main">

		<!-- 商品詳細 -->


		<div class="inner">
			<div class="PI-productcontainer">
				<h1>
					<s:property value="session.productName" />
				</h1>
				<div class="PI-descriptionbox">
					<div class="ruby">
						<s:property value="session.productNameKana" />
					</div>
					商品名：<span class="pname"><s:property
							value="session.productName" /></span> <br>  発売年月日：
					<s:property value="session.releaseDate" />

					<br> 商品詳細情報：
					<div class="descriptionletter">
						<s:property value="session.productDescription" />
					</div>

					<br>
					値段：
					<b><s:property value="session.price" />
					円 </b><br>
					<s:form action="InsertCartAction">
						<s:hidden name="productId" />
						<s:hidden name="price" />
				個数： <select name="productCount">
							<s:iterator value="htmlList">
								<option value=<s:property value="count"/>><s:property
										value="count" />個
								</option>
							</s:iterator>
						</select>
						<s:submit value="カートに追加"  class="details-submit" />
					</s:form>
				</div>

				<div class="PI-imagebox">
					<img src='<s:property value="session.imageFilePath" />'
						alt=<s:property value="session.imageFileName" /> />
				</div>
			</div>



			<!-- おすすめ商品 -->
			<div class="PI-productcontainer">
				<h2>おすすめ商品</h2>
				<s:iterator value="sugestList">
					<div class="PI-productlist_container">
						<div class="PI-list">
							<a
								href="<s:url action="ProductInfoDescriptionAction">
							<s:param name="productId" value="%{productId}"/>
							<s:param name="categoryId" value="%{categoryId}"/>
							<s:param name="price" value="%{price}"/>
							</s:url>">

								<img src="<s:property value= 'imageFilePath'/>"> <br>
								<span><s:property value="productName" /></span> <br> <span>
									<s:property value="productNameKana" />
							</span> <br> <span><s:property value="price" />円</span>
							</a>
						</div>
					</div>
				</s:iterator>
			</div>
		</div>
	</div>
<div class="push"></div>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>