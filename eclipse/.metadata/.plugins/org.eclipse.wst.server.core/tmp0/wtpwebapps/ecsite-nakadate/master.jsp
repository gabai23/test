<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="Content-Style-Type" content="text/css"/>
	<link rel="stylesheet" type="text/css" href="./CSS/master-style.css">
	<meta http-equiv="Content-Script-Type" content="text/javascript"/>
	<meta http-equiv="imagetoolbar" content="no"/>
	<meta name="description" content=""/>
	<meta name="keywords" content=""/>

	<title>管理者画面</title>


</head>
<body>
		<!-- ヘッダー -->
		<jsp:include page="includeHeader.jsp"/>

		<div id="main">
		<div id="top">
			<p>管理者画面</p>
		</div>

				<div class="clearfix">
						<div>
								<a href='<s:url action="GoInsertAction"/>'>商品の追加</a>
								<a href='<s:url action="GoItemUpdateAction"/>'>商品情報の更新</a>
								<a href='<s:url action="GoItemDeleteAction"/>'>商品の削除</a>
						</div>
						<br>
						<div id="errorMessage">
								<s:property value="errorMessage"/>
						</div>
						<s:form action="MasterAction">

										<s:iterator value="session.itemList">
										<div id="itemInsert" class="clearfix">
										<div id="itemDetail" class="ratio-1_1">

												<!-- 商品名 -->
												<h3><s:property value="itemName"/></h3>
												<br>

												<!-- 画像 -->
												<div class="image-container">
												<img  id="image" src='<s:property value="image_file_name"/>' alt="画像なし"/>
												</div>

												<!-- 在庫 -->
												<span>在庫</span>

												<!-- 在庫数が50個以上なら黒 -->
												<s:if test="item_stock >= 50">
													<s:property value="item_stock"/>
												</s:if>

												<!-- 在庫数が50個以下なら赤 -->
												<s:elseif test="item_stock < 50">
													<span id="red">
														<s:property value="item_stock"/>
													</span>
												</s:elseif>

												<br>
												<span>商品在庫追加数</span>
												<br>

												<select name="count">

														<script>
														for(i = 0; i <= 100; i++){
														document.write("<option>");
						 								document.write(i);
														document.write("</option>")
														}
														</script>

												</select>

										</div>
										</div>
										</s:iterator>

										<!-- <div id="button"> -->
											<s:submit value="在庫追加"/>
										<!-- </div> -->


						</s:form>
				</div>
		</div>



		<!-- フッター -->
		<jsp:include page="includeFooter.jsp"/>

</body>
</html>