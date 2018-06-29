<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>クリエイトバーガー</title>
<link rel="stylesheet" type="text/css" href="./css/miamiburger.css">
<link rel="stylesheet" type="text/css" href="./css/createBurger.css">
<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
</head>
<body>
<div class="wrapper">
<jsp:include page="header.jsp" />

	<div class="createBox">
		<h1>CreateBurger ～Please take your choice！～</h1>
	</div>

		<s:if test="errorMessage!=null">
			<div class="error">
				<s:property value="errorMessage"/>
			</div>
		</s:if>

<!-- 		クリエイトバーガーとまな板 -->
		<img src="./images/CuttingBoard.png" class="cuttingBoard"/>

		<div id="burgerContainer"></div>
<!-- 		-------------------------------- -->

		<div id="displayBox">
			<div class="selectStyle">
				<h3>your choice</h3>
				<ul id="selectContainer">
					<s:iterator value="#session.htmlCreaterList">
						<li class="hiddenHTML"><span class="selectText"></span> <div class="optionDeleteBtn">remove<span class="idNum"><s:property value="count"/></span></div></li>
					</s:iterator>
				</ul>
			</div>

			<div class="formBox">
			<s:form action="CreateBurgerConfirmAction">
											<!-- 	選択したオプションをhiddenで送信。入力がない時はvalueに-1を入れ判別する。 -->
					<s:iterator value="#session.htmlCreaterList">
						<input type="hidden" name=<s:property value="option"/> value="-1" id=<s:property value="hiddenOption"/> />
					</s:iterator>
				<h3>金額：<span id="price">0</span>円</h3>
				<h3>購入個数：<select name="product_count" id="product_count">
					<option value=1 selected>1</option>
					<option value=2 >2</option>
					<option value=3 >3</option>
					<option value=4 >4</option>
					<option value=5 >5</option>
				</select>個</h3>
				<h3>合計金額：<span id="totalPrice">0</span>円</h3>

				<input type ="image" name="submit" class="submitBtn" src="./images/hukidashi.png" alt=" 作成">
				<img src="./images/cook.png" class="imgCook"/>
			</s:form>
			</div>
		</div>

		<ul id="optionList">
			<s:iterator value="#session.burgerOptionsList">
				<li class="option">
					<h3>
						<span class="optionName"><s:property value="optionName" /></span>
					</h3>
					￥<span class="price"><s:property value="optionPrice" /></span>
					<div class="option_id"><s:property value="id"/></div>
				</li>
			</s:iterator>
		</ul>
	<div class="push"></div>
</div>
	<jsp:include page="footer.jsp" />

	<script>
	var maxCount = 10;// 			オプションの選択可能数は10個とする。

//		リストの合計値を算出するファンクション
	var sum = function(list){
		var sum = 0;
		for(var i = 0; i < list.length; i++){
			sum +=list[i];
		};
		return sum;
	};

//		セッションに格納されたoptionListDateをオブジェクトとして配列に格納する。
	var optionDataList = [];
	var optionCount = 0;
	<s:iterator value="#session.burgerOptionsList">
		optionDataList[optionCount] ={id:<s:property value="id"/> , optionName:"<s:property value='optionName'/>" , optionPrice:<s:property value="optionPrice"/> , imgUrl:"<s:property value='imgUrl'/>" , comment:"<s:property value='comment'/>"};
		optionCount++;
	</s:iterator>

//		引数にidを入力することでそのidを持ったオプションのオブジェクトを得ることができるファンクション
	var getOptionData = function(id){
		for(var i= 0 ; i < optionDataList.length ; i++){
			if( id === optionDataList[i].id){
				return optionDataList[i];
			};
		};
	};

// 	ハンバーガー作成用ファンクション
	var burgerMake = function(selectIdList){
		$('#burgerContainer img').remove();
		for(var i = 0; i < selectIdList.length; i++){
			$('#burgerContainer').prepend('<img src="'+getOptionData(selectIdList[i]).imgUrl+'" class="img'+(i+1)+'"/>');
		};
	};

//	オプションのidリストからオプションの合計金額を計算する。その後、HTMLへの挿入とformへの入力。
	var priceCal = function(selectIdList){
		var priceList = [];
		for(var i = 0; i < selectIdList.length; i++){
			priceList.push(getOptionData(selectIdList[i]).optionPrice);
		};
		document.getElementById('price').textContent = sum(priceList);
		return sum(priceList);
	};
// 	金額×個数を算出。priceCal()ファンクションを内部で使用しているのでこのファンクションを使用する場合、新しくpriceCal()ファンクションを呼び出す必要はない。
	var totalPriceCal = function(selectIdList){
		document.getElementById('totalPrice').textContent = priceCal(selectIdList)*(document.getElementById('product_count').value);
	};
// 	selectContanerへ選択したオプションを格納していく
	var displaySelectContaner = function(selectIdList){
		for(var i=0; i<selectIdList.length; i++){
			document.querySelector('#selectContainer li:nth-child('+(i+1)+') .selectText').textContent = getOptionData(selectIdList[i]).optionName;
			$('#selectContainer li:nth-child('+(i+1)+')').removeClass("hiddenHTML");
			document.getElementById('hiddenOption'+(i+1)).value = selectIdList[i];
		};
// 		オプションが選択されていないものはformのhiddenに-1を入れる。
		for(var l = selectIdList.length; l < maxCount; l++){
			document.getElementById('hiddenOption'+(l+1)).value = -1;
		};

	};

		var selectIdList = []; //選択したオプションのidを格納していく。

		$(function(){
// 			オプションを選択したときの動作
			$('.option').on('click',function() {
				if(selectIdList.length < maxCount){
					//選択したオプションのidを格納していく。
					selectIdList.push(parseInt($(this).find(".option_id").text()));

					totalPriceCal(selectIdList);

					displaySelectContaner(selectIdList);

					burgerMake(selectIdList);

				};
			});

// 			削除ボタンを押したときの動作
			$('.optionDeleteBtn').on('click',function(){
				for(var i = 0; i < selectIdList.length; i++){
					if(selectIdList !== 0){
						$('#selectContainer li:nth-child('+(i+1)+')').addClass("hiddenHTML")
					};
				};
				var deleteSelect = parseInt($(this).find(".idNum").text())-1;
				selectIdList.splice(deleteSelect,1);

				totalPriceCal(selectIdList);

				displaySelectContaner(selectIdList);

				burgerMake(selectIdList);
			});

		});

// 		個数を選択したときに合計金額を変える。
		document.getElementById('product_count').onchange = function(){
			totalPriceCal(selectIdList);
		};

// 		作成ボタンの画像切り替え
		$(function(){
		     $('.submitBtn').hover(function(){
		        $(this).attr('src', $(this).attr('src').replace('./images/hukidashi.png', './images/ok.png'));
		          }, function(){
		             if (!$(this).hasClass('currentPage')) {
		             $(this).attr('src', $(this).attr('src').replace('./images/ok.png', './images/hukidashi.png'));
		        }
		   });
		});

	</script>

</body>
</html>