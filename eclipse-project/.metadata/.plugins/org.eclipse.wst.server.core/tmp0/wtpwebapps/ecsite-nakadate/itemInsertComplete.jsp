<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="Content-Style-Type" content="text/css"/>
	<link rel="stylesheet" type="text/css" href="./CSS/itemInsertComplete-style.css">
	<meta http-equiv="Content-Script-Type" content="text/javascript"/>
	<meta http-equiv="imagetoolbar" content="no"/>
	<meta name="description" content=""/>
	<meta name="keywords" content=""/>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>



	<title>商品追加完了画面</title>

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
						<p>商品追加完了</p>
				</div>

				<div>
						<p>以下の商品を追加しました。</p>
						<s:form>
						<table border = 1>
								<tr>
									<th>商品名</th>
									<th>商品名かな</th>
									<th>商品詳細</th>
									<th>カテゴリーID</th>
									<th>値段</th>
									<th>在庫</th>
									<th>商品画像</th>
								</tr>

								<tr>
									<td><s:property value="session.itemName"/></td>
									<td><s:property value="session.itemNameKana"/></td>
									<td><s:property value="session.itemDescription"/></td>
									<td>
										<s:if test="categoryId == 2">
										文房具
										</s:if>
										<s:if test="categoryId == 3">
										生活雑貨
										</s:if>
										<s:if test="categoryId == 4">
										調理用品
										</s:if>
										<s:if test="categoryId == 5">
										美容健康
										</s:if>
									</td>
									<td><s:property value="session.itemPrice"/><span>円</span></td>
									<td><s:property value="session.itemStock"/><span>点</span></td>
									<td><img src="<s:property value='session.imageFileName'/>"></td>
								</tr>

						</table>
						<br>
						</s:form>
						<div>
								<input type="button" value="管理画面へ戻る" onclick="submitAction('GoMasterAction')"/>
						</div>
				</div>
		</div>

		<!-- フッター -->
		<jsp:include page="includeFooter.jsp"/>

</body>
</html>