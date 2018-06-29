<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="Content-Style-Type" content="text/css"/>
	<link rel="stylesheet" type="text/css" href="./CSS/buyItem-style.css">
	<meta http-equiv="Content-Script-Type" content="text/javascript"/>
	<meta http-equiv="imagetoolbar" content="no"/>
	<meta name="description" content=""/>
	<meta name="keywords" content=""/>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

	<title>商品一覧</title>



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

		<div id="main" class="clearfix">
				<div id="top">
						<p>商品一覧</p>
				</div>

				<div id="Container" class="clearfix">

					<%-- <!-- 商品検索 -->
					<s:form action="ItemSearchAction">

						<select name="categoryId" class="pulldown">
								<option value=1 selected="selected">全てのカテゴリー</option>
								<option value=2>文房具</option>
								<option value=3>生活雑貨</option>
								<option value=4>調理用品</option>
								<option value=5>美容健康</option>
						</select>

						<tr>
								<td>
										<s:textfield name="searchWord" value=""/>
								</td>

								<td>
										<s:submit value="検索"/>
								</td>
						</tr>

					</s:form> --%>
					<!-- ソート -->
					<s:form action="ItemSearchAction" name="form">
							<s:if test="sort == 0">
								<select class="sort" id="Sort" name="sort" onchange="submit(this.form)">
										<option value="0" selected>発売が新しい順</option>
										<option value="1">発売が古い順</option>
										<option value="2">価格が高い順</option>
										<option value="3">価格が安い順</option>
								</select>
							</s:if>
							<s:elseif test="sort == 1">
								<select class="sort" id="Sort" name="sort" onchange="submit(this.form)">
										<option value="0">発売が新しい順</option>
										<option value="1" selected>発売が古い順</option>
										<option value="2">価格が高い順</option>
										<option value="3">価格が安い順</option>
								</select>
							</s:elseif>
							<s:elseif test="sort == 2">
								<select class="sort" id="Sort" name="sort" onchange="submit(this.form)">
										<option value="0">発売が新しい順</option>
										<option value="1">発売が古い順</option>
										<option value="2" selected>価格が高い順</option>
										<option value="3">価格が安い順</option>
								</select>
							</s:elseif>
							<s:elseif test="sort == 3">
								<select class="sort" id="Sort" name="sort" onchange="submit(this.form)">
										<option value="0">発売が新しい順</option>
										<option value="1">発売が古い順</option>
										<option value="2">価格が高い順</option>
										<option value="3" selected>価格が安い順</option>
								</select>
							</s:elseif>

						</s:form>

					<!-- カテゴリー表示 -->
					<h1>
						<s:if test="session.categoryId == 1">
							<span class="category">全てのカテゴリー</span>
						</s:if>
						<s:if test="session.categoryId == 2">
							<span class="category">文房具</span>
						</s:if>
						<s:if test="session.categoryId == 3">
							<span class="category">生活雑貨</span>
						</s:if>
						<s:if test="session.categoryId == 4">
							<span class="category">調理用品</span>
						</s:if>
						<s:if test="session.categoryId == 5">
							<span class="category">美容健康</span>
						</s:if>
					</h1>

					<s:iterator value="session.messageList">
						<h1><s:property /></h1>
					</s:iterator>

					<!-- エラーメッセージ -->
					<s:if test="session.itemSearchDTOList.size()==0">
						<h1>検索結果がありません</h1>
					</s:if>


					<!-- 商品一覧 -->
					<div id="itemContainer" class="clearfix">


						<div>
							<%-- <s:iterator value="#session.itemList"> --%>
							<s:iterator value="session.itemSearchDTOList">

							<!-- 商品詳細ページ -->
							<div id="itemDetail"  class="ratio-1_1">
									<!-- URL作成 -->
									<s:url id="url" action="GoItemPageAction">
											<s:param name="id" value="%{item_id}"/>
									</s:url>

									<!-- リンク -->
									<s:a class="image-container" href="%{url}">
											<!-- 画像 -->
											<img  id="image" src='<s:property value="image_file_name"/>' alt="画像なし"/>

									</s:a>

									<!-- 商品名 -->
									<s:a class="name" href="%{url}">
											<s:property value="itemName"/>
									</s:a>

									<!-- 価格 -->
									<s:a class="price" href="%{url}">
									<span>&yen;</span>
									<fmt:formatNumber value="${itemPrice}"/>
									</s:a>


							</div>

								</s:iterator>
						</div>



					<!-- ページング -->
					<div id="paging">

						<s:iterator value="session.searchResultPageList" var="pages">

							<!-- URL作成 -->
							<s:url id="url" action="Paging">
									<s:param name="page" value="#pages"/>
							</s:url>

							<!-- 表示ページと一致していたら -->
							<s:if test="page == #pages">
								<span><s:property value="page"/></span>
							</s:if>

							<s:else>
							<s:a href="%{url}"><s:property value="#pages"/></s:a>
							</s:else>
						</s:iterator>



					</div>

				</div>

				</div>

		<!-- フッター -->
		<jsp:include page="includeFooter.jsp"/>

		</div>

		<script type="text/javascript">

		//セレクター
		$(function(){

			  $("#submit_select").change(function(){

			    $("#submit_form").submit();

			  });

			});

		</script>


</body>
</html>