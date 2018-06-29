<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="Content-Style-Type" content="text/css"/>
	<link rel="stylesheet" type="text/css" href="./CSS/itemInsert-style.css">
	<meta http-equiv="Content-Script-Type" content="text/javascript"/>
	<meta http-equiv="imagetoolbar" content="no"/>
	<meta name="description" content=""/>
	<meta name="keywords" content=""/>

	<title>商品追加画面</title>


</head>
<body>
		<!-- ヘッダー -->
		<jsp:include page="includeHeader.jsp"/>

		<div id="main">
				<div id="top">
						<p>商品追加</p>
				</div>

				<div>
						<h3>追加する商品情報を入力してください。</h3>
						<s:form action="ItemInsertAction">
								<tr>
										<td>
											商品名：
										</td>
										<td>
											<input type="text" name="itemName">
										</td>
								</tr>

								<tr>
										<td>
											商品かな：
										</td>
										<td>
											<input type="text" name="itemNameKana">
										</td>
								</tr>

								<tr>
										<td>
											商品詳細：
										</td>
										<td>
											<input type="text" name="itemDescription">
										</td>
								</tr>

								<tr>
										<td>
											カテゴリーID：
										</td>
										<td>
											<!-- <input type="text" name="categoryId"> -->
											<div class="select">
											<select name="categoryId">
													<option>選択してください</option>
													<option value="2">文房具</option>
													<option value="3">生活雑貨</option>
													<option value="4">調理用品</option>
													<option value="5">美容健康</option>
											</select>
										</td>
								</tr>

								<tr>
										<td>
											商品価格：
										</td>
										<td>
											<input type="text" name="itemPrice">
										</td>
								</tr>

								<tr>
										<td>
											在庫：
										</td>
										<td>
											<input type="text" name="itemStock">
										</td>
								</tr>

								<tr>
										<td>
											商品画像：
										</td>
										<td>
											<input type="file" accept="image/*" name="imageFileName">
										</td>
								</tr>
								<tr>
										<td>
											<s:submit value="追加"/>
										</td>
								</tr>

						</s:form>

						<div>
								<p><a href='<s:url action="GoMasterAction"/>'>戻る</a></p>
						</div>
				</div>
		</div>

		<!-- フッター -->
		<jsp:include page="includeFooter.jsp"/>

</body>
</html>