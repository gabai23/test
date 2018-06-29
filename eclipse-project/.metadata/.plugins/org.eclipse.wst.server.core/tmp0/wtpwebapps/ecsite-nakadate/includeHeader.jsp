<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%String id = (String)session.getAttribute("userId");%> --%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" type="text/css" href="http://netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.css">
	<meta http-equiv="Content-Script-Type" content="text/javascript"/>
	<%-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script> --%>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>


</head>

<style>

		/* * {
			font-family:'AXIS','Hiragino Kaku Gothic Pro W3','Hiragino Kaku Gothic ProN',Meiryo,sans-serif;
			text-decoration:none;

		} */

		a {
			/*水色*/
			color:#245fbb;
		}

		a:hover {
			/*オレンジ*/
			color:#F99F48;
		}



		#header {
			width:100%;
			height:80px;
			background-color:#071D26;
		}

		.logo {
			color:#fff;
			opacity:0.9;
			float:left;
			font-size:28px;
			line-height:80px;
			padding-left:10px;
		}

		.main {
			min-height:500px;
		}

		#main {
			min-height:700px;
		}

		#search {
			width:50%;
			height:auto;
			float:left;
			margin-top:22.5px;
			margin-left:5%;
		}

		#right {
			float:right;
		}


	/*ログイン*/
		#hello {
			position:relative;
			height:70px;
			width:150px;
			float:left;
			margin-top:5px;
			margin-left:10px;
		}

		.helloUser {
			/* position:absolute;
			top:0;
			left:0; */
			display:block;
			color:#fff;
			opacity:0.9;
			height:auto;
			text-align:center;
			font-size:10px;
			margin-top:0;
			margin-bottom:0;
			/* line-height:0; */
			/* border:1px solid rgba(255, 255, 255, 0.5); */
		}

		.login {
			display:block;
			width:auto;
			color:#fff;
			opacity:0.9;
			height:30px;
			line-height:30px;
			/* margin-top:30px; */
			font-size:18px;
			text-align:center;
			margin-left:10px;
			/* border:1px solid rgba(255, 255, 255, 0.5); */
		}


	/*ログアウト*/
		.logout {
			display:block;
			width:auto;
			color:#fff;
			opacity:0.9;
			height:30px;
			line-height:30px;
			margin-right:30px;
			font-size:18px;
			text-align:center;
			margin-left:10px;
			/* border:1px solid rgba(255, 255, 255, 0.5); */
		}

	/*カート*/
		#cart {
			position:relative;
			height:50px;
			width:150px;
			float:left;
			margin-top:20px;
			/* margin-left:10px; */
		}

		/* #cart:hover {
			position:relative;
			height:50px;
			width:150px;
			float:left;
			margin-top:20px;
			margin-left:10px;
			border:1px solid rgba(255, 255, 255, 0.5);
			border-radius:4px;
		} */

		.cartItems {
			position:absolute;
			top:7px;
			left:22px;
			color:#000;
			opacity:0.9;
			height:auto;
			margin-left:10px;
			font-size:14px;
			text-align:center;
			line-height:0;
			z-index:1;
		}

		.cart {
			display:block;
			width:80px;
			height:30px;
			color:#fff;
			text-align:left;;
			font-size:18px;
			opacity:0.9;
			margin-top:17px;
			margin-left:60px;
		}



	/*マイページ*/
		#mypage {
			position:relative;
			height:70px;
			width:100px;
			float:left;
			margin-top:5px;
			margin-right:10px;
			/* margin-left:10px; */

		}

		.mypage {
			display:inline-block;
			width:100%;
			color:#fff;
			opacity:0.9;
			height:30px;
			line-height:30px;
			margin-top:30px;
			font-size:18px;
			text-align:left;
			/* margin-left:10px; */
			/* border:1px solid rgba(255, 255, 255, 0.5); */
		}

		a:hover {
			opacity:1;
		}

		#headerSpan {
			color:#fff;
		}
	/*アイコン*/
		.icon {
			color:#fff;
			position:absolute;
			top:0;
			left:0;
			margin-left:10px;

		}

		#cartHover:hover .icon {
			transition: transform 0.3s;
			transform:rotate(-10deg);
		}

	/*ふきだし*/
		#list {
			position:absolute;
			top:70px;
			left:-100px;
			display:none;
			border-radius:4px;
		}

		#list:before {
			content: "";
			position: absolute;
			top: -30px;
			left: 75%;
			margin-left: -15px;
			border: 15px solid transparent;
			border-bottom: 15px solid #fff;

		}

		#hello:hover #list {
			display:inline-block;
			opacity:1;
			background-color:#fff;
			box-shadow: 0 0 8px #909096;

			height:200px;
			width:250px;

		}


		/*検索ボタン*/
		.searchButton {
			width:5%;
			height:35px;
			float:left;
			background-color:#F99F48;
			border:none;
			border-top-right-radius:4px;
			border-bottom-right-radius:4px;
		}

		/*検索フィールド*/
		.textfield {
			width:60%;
			height:35px;
			float:left;
			border:none;
			box-sizing:border-box;
		}
		/*検索カテゴリー*/
		.btn-select {
			width: auto;
			height:35px;
			position: relative;
			float:left;
			z-index:5;
		}

		.label {
			color: #444444;
			background-color:#dcdcdc;

			position: absolute;
			top:0;
			width: 100%;
			height:35px;

			text-align:center;
			line-height:35px;

			margin-top:0;
			display: block;
			z-index: 1;
			white-space: nowrap;
			cursor:pointer;

			font-size:16px;

			border-top-left-radius:4px;
			border-bottom-left-radius:4px;
		}

		.btn-select .select {
			-webkit-appearance: none;
			-moz-appearance: none;
			appearance: none;

			display: block;
			cursor: pointer;

			width: 100%;
			height:35px;

			border: none;
			padding-right: 80px;
			opacity: 0;
			position: relative;
			z-index: 2;
			white-space: nowrap;
		}


		/*検索アイコン*/
		.searchIcon {
			font-size:16px;
		}

		/*矢印アイコン*/
		.sort-down {
			position:absolute;
			top:20%;
			right:3%;
			font-size:16px;
			color:#444444;
		}


		/* IE10以上で矢印を消す */
		.select::-ms-expand {
			display: none;
		}

		/* フォーカス時 */
		.select:focus {
			z-index: -1;
			opacity: 1;
		}





</style>

<body>
<header>
	<div id="header">
				<div id="left">

				<s:if test="session.loginFlg == true && session.masterFlg == true">
					<a class="logo" href='<s:url action="GoMasterAction"/>'>Home</a>
				</s:if>

				<s:else>
					<a class="logo" href='<s:url action="StartAction"/>'>Home</a>
				</s:else>

				<!-- 商品検索 -->
				<div id="search">
				<s:form action="ItemSearchAction" theme="simple">

				<div class="btn-select">
						<p class="label">すべて<i class="fa fa-sort-down sort-down"></i></p>
						<select class='select' name="categoryId" id="category">
								<option value=1>全てのカテゴリー</option>
								<option value=2>文房具</option>
								<option value=3>生活雑貨</option>
								<option value=4>調理用品</option>
								<option value=5>美容健康</option>
						</select>
				</div>
				<s:textfield cssClass="textfield" name="searchWord" value=""/>
				<button type="submit" class="searchButton"><i class='fa fa-search searchIcon'></i></button>

				</s:form>
				</div>

				<div id="right">

					<!-- ゲストユーザーのとき -->

					<s:if test="session.loginFlg == false || session.loginFlg == null">

						<!-- ログイン -->
						<div id="hello">
							<p class="helloUser">こんにちは。<br>ゲストユーザーさん</p>

							<a class="login" href='<s:url action="GoLoginAction"/>'>ログイン</a>

							<div id="list">
							アカウントサービス
							<s:form action="GoLoginAction">
									<button type="submit">ログイン</button>
							</s:form>
							初めてご利用ですか？<a href='<s:url action="GoUserCreateAction"/>'>新規登録はこちら</a>
							<br>
							<a href='<s:url action="BuyItemHistoryAction"/>'>注文履歴</a>
							</div>
						</div>

						<!-- カート内商品種類数 -->

						<div id="cart">
							<s:if test="session.cartListSize == null || session.cartListSize == 0">
								<p class="cartItems">0</p>
							</s:if>
							<s:else>
								<p class="cartItems"><s:property value="session.cartListSize"/></p>
							</s:else>

							<div id="cartHover">
							<i class="fa fa-shopping-cart icon fa-4x"></i>

							<!-- カート -->
							<a class="cart" href='<s:url action="GoCartAction"/>'>カート</a>
							</div>
						</div>
					</s:if>


					<!-- ログインユーザーのとき -->
					<s:if test="session.loginFlg == true && session.masterFlg != true">

						<!-- ログアウト -->
						<div id="hello">
							<p class="helloUser">こんにちは。<br><s:property value="session.login_user_id"/>さん</p>

							<a class="logout" href='<s:url action="LogoutAction"/>'>ログアウト</a>

							<div id="list">
							アカウントサービス
							<s:form action="LogoutAction">
									<button type="submit">ログアウト</button>
							</s:form>
							初めてご利用ですか？<a href='<s:url action="GoUserCreateAction"/>'>新規登録はこちら</a>
							<br>
							<a href='<s:url action="BuyItemHistoryAction"/>'>注文履歴</a>
							</div>

						</div>

						<!-- カート内商品種類数 -->

						<div id="cart">
							<s:if test="session.cartListSize == null || session.cartListSize == 0">
								<p class="cartItems">0</p>
							</s:if>
							<s:else>
								<p class="cartItems"><s:property value="session.cartListSize"/></p>
							</s:else>

							<div id="cartHover">
							<i class="fa fa-shopping-cart icon fa-4x"></i>

							<!-- カート -->
							<a class="cart" href='<s:url action="GoCartAction"/>'>カート</a>
							</div>
						</div>

						<!-- マイページ -->
						<div id="mypage">
							<a class="mypage" href='<s:url action="MyPageAction"/>'>マイページ</a>
						</div>
					</s:if>


					<!-- 管理者のとき -->
					<s:if test="session.loginFlg == true && session.masterFlg == true">
					<p class="helloUser">こんにちは。<br>マスター</p>

					<!-- ログアウト -->
					<a class="logout" href='<s:url action="LogoutAction"/>'>ログアウト</a>
					</s:if>



				</div>


				</div>
		</div>
</header>

<script type="text/javascript">

$('.select').on('change', function(){

  var $this = $(this)
  var $option = $this.find('option:selected');
  $('.label').text($option.text());
  $('.label').append('<i class="fa fa-sort-down sort-down"></i>');

  // onchange後にフォーカスしてるのが嫌な場合
  $this.blur();

});

</script>

</body>