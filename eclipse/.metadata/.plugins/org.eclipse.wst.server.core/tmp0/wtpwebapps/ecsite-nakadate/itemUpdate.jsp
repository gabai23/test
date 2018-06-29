<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="Content-Style-Type" content="text/css"/>
	<link rel="stylesheet" type="text/css" href="./CSS/itemUpdate-style.css">
	<meta http-equiv="Content-Script-Type" content="text/javascript"/>
	<meta http-equiv="imagetoolbar" content="no"/>
	<meta name="description" content=""/>
	<meta name="keywords" content=""/>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

	<title>商品更新画面</title>

<script type="text/javascript">
	function submitAction(url) {
		$('form').attr('action', url);
		$('form').submit();
	}
</script>

</head>
<body>
		<!-- ヘッダー -->
		<jsp:include page="includeHeader.jsp"/>

		<div id="main">

				<div id="top">
						<p>商品更新</p>
				</div>

				<div id="errorMessage">
						<s:property value="errorMessage"/>
				</div>
						<s:form action="ItemUpdateAction">

								<s:iterator value="session.itemList">

								<div id="itemInsert" class="clearfix">
								<div id="itemDetail" class="ratio-1_1">
										<!-- 商品名 -->
										<div id="title">
										<h3><s:property value="itemName"/></h3>
										</div>

										<!-- 画像 -->
										<div class="image-container">
										<img  id="image" src='<s:property value="image_file_name"/>' alt="画像なし"/>
										</div>

										<br>

										<div id="radio">
										<input type="radio" name="id" value="<s:property value='item_id'/>">

										</div>
								</div>
								</div>

								</s:iterator>

								<s:submit value="選択"/>

						</s:form>

						<input type="button" value="戻る" onclick="submitAction('GoMasterAction')"/>

		</div>

		<!-- フッター -->
		<jsp:include page="includeFooter.jsp"/>

</body>
</html>