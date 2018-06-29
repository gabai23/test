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
<title>メニュー</title>

</head>
<body>
<div class="wrapper">
	<div class="header">
		<jsp:include page="header.jsp" />
	</div>


	<div class="inner">

		<div class="PI-productcontainer">
			<h1>MENU</h1>
			<s:if test="errorMessage != null">
				<div class="errorBox">
					<s:property value="errorMessage" />
				</div>
			</s:if>

			<!-- 引き出した商品情報を 3×3 で表示（現在CSSで3列制御中） -->
			<s:iterator value="productInfoList">
				<div class="PI-productlist_container">
					<div class="PI-list">
						<a
							href="<s:url action="ProductInfoDescriptionAction">
					<s:param name="id" value="%{id}"/>
					<s:param name="productId" value="%{productId}"/>
					<s:param name="productName" value="%{productName}"/>
					<s:param name="productNameKana" value="%{productNameKana}"/>
					<s:param name="productDescription" value="%{productDescription}"/>
					<s:param name="categoryId" value="%{categoryId}"/>
					<s:param name="price" value="%{price}"/>
					<s:param name="imageFilePath" value="%{imageFilePath}"/>
					<s:param name="imageFileName" value="%{imageFileName}"/>
					<s:param name="releaseDate" value="%{releaseDate}"/>
					<s:param name="status" value="%{status}"/>
					<s:param name="registDate" value="%{registDate}"/>
					<s:param name="UpdateDate" value="%{UpdateDate}"/>
				</s:url>">
							<img src="<s:property value= 'imageFilePath' />"> <br>
							<span><b><s:property value="productName" /></b></span> <br>
							<span> <s:property value="productNameKana" /></span> <br> <span><s:property
									value="price" />円</span> <br>
						</a>
					</div>
				</div>
			</s:iterator>
		</div>
		<div class="PI-pagingbox">
			<!-- ページセレクト（1ページ目では"前へ"を表示しない、最終ページでは"次へ"を表示しない） -->
			<s:if test="pageSelect > 0">
				<form action="ProductInfoAction">
					<s:hidden name="pageSelect" value="%{pageSelect - 1}" />

					<s:hidden name="categoryId" value="%{#session.categoryId}"/>
					<s:hidden name="search" value="%{#session.search}"/>

					<s:submit value=" 前へ"  class="details-submit"/>
				</form>
			</s:if>

			<s:if test="pageSelect < mainList.size() -1">
				<form action="ProductInfoAction" method="post">
					<s:hidden name="pageSelect" value="%{pageSelect + 1}"/>

					<s:hidden name="categoryId" value="%{#session.categoryId}"/>
					<s:hidden name="search" value="%{#session.search}"/>

					<s:submit value=" 次へ"  class="details-submit" />
				</form>
			</s:if>
		</div>
	</div>



<div class="push"></div>
</div>
<jsp:include page="footer.jsp" />


</body>
</html>