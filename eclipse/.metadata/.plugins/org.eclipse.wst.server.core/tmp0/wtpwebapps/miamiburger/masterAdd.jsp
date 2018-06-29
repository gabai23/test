<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
if(!(session.getAttribute("admin") == "admin")){
  out.println("本ページへのアクセスは認められていません");
  out.close();
}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="Content-Style-Type" content="text/css" />
		<meta http-equiv="Content-Script-Type" content="text/javascript" />
		<meta http-equiv="imagetoolbar" content="no" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<title>管理画面</title>
		<link rel="stylesheet" type="text/css" href="./css/masterAdd.css">
		<style type="text/css"></style>
	</head>
	<body>
	<div class="header">
		<jsp:include page="header.jsp" />
	</div>
	<div class="main">
		<h1>商品情報を入力してください</h1>
		<div class="inner">
			<div class="product_info">
				<s:form action="MasterAddConfirmAction" >
					<div class="character">
						<b>商品名:</b><input name="productName" placeholder="商品名" value="<s:property value="session.productName"/>" required><br>
					</div>
					<div class="character">
						<b>商品かな:</b><input name="productNameKana"placeholder="商品かな" value="<s:property value="session.productNameKana"/>" required><br>
					</div>
					<div class="character">
						<b>商品詳細:</b><textarea name="productDescription" placeholder="商品詳細" required><s:property value="session.productDescription"/></textarea><br>
					</div>
					<div class="character">
						<b>カテゴリ:</b><br>
						<s:if test="session.categoryId==1">
										<input type="radio" name="categoryId" value="1" checked>ハンバーガー<br>
										<input type="radio" name="categoryId" value="2" >飲み物<br>
										<input type="radio" name="categoryId" value="3" >サイドメニュー<br>
										<input type="radio" name="categoryId" value="4" >セット<br>
						</s:if>
						<s:elseif test="session.categoryId==2">
										<input type="radio" name="categoryId" value="1" >ハンバーガー<br>
										<input type="radio" name="categoryId" value="2" checked>飲み物<br>
										<input type="radio" name="categoryId" value="3" >サイドメニュー<br>
										<input type="radio" name="categoryId" value="4" >セット<br>
						</s:elseif>
						<s:elseif test="session.categoryId==3">
										<input type="radio" name="categoryId" value="1" >ハンバーガー<br>
										<input type="radio" name="categoryId" value="2" >飲み物<br>
										<input type="radio" name="categoryId" value="3" checked>サイドメニュー<br>
										<input type="radio" name="categoryId" value="4" >セット<br>
						</s:elseif>
						<s:elseif test="session.categoryId==4">
										<input type="radio" name="categoryId" value="1" >ハンバーガー<br>
										<input type="radio" name="categoryId" value="2" >飲み物<br>
										<input type="radio" name="categoryId" value="3" >サイドメニュー<br>
										<input type="radio" name="categoryId" value="4" checked>セット<br>
						</s:elseif>
						<s:else>
										<input type="radio" name="categoryId" value="1" checked>ハンバーガー<br>
										<input type="radio" name="categoryId" value="2" >飲み物<br>
										<input type="radio" name="categoryId" value="3" >サイドメニュー<br>
										<input type="radio" name="categoryId" value="4" >セット<br>
						</s:else>
					</div>
					<div class="character">
						<b>値段:</b><input type ="number" name="price" placeholder="1000" min="0" max="10000" value="<s:property value="session.price"/>" required><span>円</span><br>
					</div>
					<div class="character">
						<b>発売日:</b><input type ="date" name="releaseDate" placeholder="2000-01-01 00:00:00" value="<s:property value="session.releaseDate"/>" required><br>
					</div>
					<div class="character">
						<s:if test="session.Status==0">
						<b>ステータス:</b><input type="radio" name="Status" value="0" checked>無効<input type="radio" name="Status" value="1">有効<br>
						</s:if>
						<s:elseif test="session.Status==1">
						<b>ステータス:</b><input type="radio" name="Status" value="0">無効<input type="radio" name="Status" value="1" checked>有効<br>
						</s:elseif>
						<s:else>
						<b>ステータス:</b><input type="radio" name="Status" value="0">無効<input type="radio" name="Status" value="1" checked>有効<br>
						</s:else>
					</div>

					<s:submit value="確認画面へ" />
				</s:form>
			</div>
			<div class="file">
				<b>※画像をはじめにアップロードしてください</b><br>
				<b>ファイル名：</b><s:property value="session.image_file_name"/><br/>
				<img src="<s:property value="session.image_file_path"/>" width="100" height="100"/>
				<s:form action="MasterAddAction" method="post" enctype="multipart/form-data">
					<s:file name="userImage" />
					<s:submit value="アップロード" align="center" />
				</s:form>
			<div class="clear"></div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>