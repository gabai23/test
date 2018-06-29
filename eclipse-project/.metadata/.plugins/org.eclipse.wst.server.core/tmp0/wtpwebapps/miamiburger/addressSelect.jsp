<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>決済確認</title>
<link rel="stylesheet" type="text/css" href="./css/miamiburger.css">
<link rel="stylesheet" type="text/css" href="./css/address.css">
<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
</head>
<body>
<div class="wrapper">
<jsp:include page="header.jsp" />

	<div id="titleBox">
		<h1>決済確認</h1>
	</div>
	
	<div class="inner">
		<div id="selectCartContainer">
			<h2>カート内容</h2>
			<s:iterator value="#session.cartList">
				<div class="selectCart">
					<img src=<s:property value="imageFilePath"/> alt=<s:property value="imageFileName"/>/>
					商品名：
					<s:property value="productName" />
					<br> 個数：
					<s:property value="productCount" />
					<br> 金額：￥
					<s:property value="totalPrice" />
					（1個あたりの価格：￥
					<s:property value="price" />)<br>
					<div class="clearLeft"></div>
				</div>
				<div class="floatReset"></div>
			</s:iterator>
		</div>
	</div>
	
	<div id="addressBox">
		<h3>宛先を選択してください</h3>
		<h3>宛先一覧：<a href=<s:url action="AddressCreateAction"/>>新規宛先作成</a></h3>

		<s:form action="SettlementCompleteAction" id="addressFormBox">
			<s:iterator value="#session.destinationDTOList" status="status">
				<div class="destinationContainer">
					姓：
					<s:property value="familyName" />
					　名：
					<s:property value="firstName" />
					<br>
					ふりがな：
					<s:property value="familyNameKana" />
					<s:property value="firstNameKana" />
					<br>
					メールアドレス:
					<s:property value="email" />
					<br>
					住所：<span class="addrss"><s:property
							value="userAddress" /></span> <br>
					電話番号：
					<s:property value="telNumber" /><br>
					<s:if test="#status.first">
						<label><input type ="radio" name="eachSelectAddress" value=<s:property value="userAddress" /> checked="checked" >この宛先を使用する</label>
					</s:if>
					<s:else>
						<label><input type ="radio" name="eachSelectAddress" value=<s:property value="userAddress" /> >この宛先を使用する</label>
					</s:else>
				</div>
			</s:iterator>
			<s:if test="#session.destinationDTOList.isEmpty()">
					宛先がありません。<a href=<s:url action="AddressCreateAction"/>>宛先を作成してください。</a>
				</s:if>
				<s:else>
					<s:submit value="決済" class="submitBtn"/>
				</s:else>
		</s:form>
	</div>
	
<div class="push"></div>
</div>	
<jsp:include page="footer.jsp" />
</body>
</html>