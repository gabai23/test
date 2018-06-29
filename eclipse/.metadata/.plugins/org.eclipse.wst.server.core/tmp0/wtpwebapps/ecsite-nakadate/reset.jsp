<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="Content-Style-Type" content="text/css"/>
	<link rel="stylesheet" type="text/css" href="./CSS/resetPassword-style.css">
	<meta http-equiv="Content-Script-Type" content="text/javascript"/>
	<meta http-equiv="imagetoolbar" content="no"/>
	<meta name="description" content=""/>
	<meta name="keywords" content=""/>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

	<title>ユーザー情報再設定画面</title>

<%-- 	<script type="text/javascript">
			function submitAction(url) {
				$('form').attr('action',url);
				$('form').submit();
			}
	</script> --%>

</head>
<body>
		<!-- ヘッダー -->
		<jsp:include page="includeHeader.jsp"/>

		<div id="main">

				<div id="top">
						<p>ユーザー情報再設定</p>
				</div>

				<div id="container">

						<s:iterator value="errorMessageList">
								<s:property />
						</s:iterator>

						<s:if test="message != null">
							<s:property value="message"/>
						</s:if>

						<s:form action="ResetConfirmAction" theme="simple">

						<!-- 氏名 -->
						<s:if test="session.reset.equals('name')">
							<span>姓</span>
							<input type="text" autofocus name="familyName" value="" placeholder="姓を入力">
							<br>

							<span>名</span>
							<input type="text" name="firstName" value="" placeholder="名を入力">
							<br>

							<span>姓ふりがな</span>
							<input type="text" name="familyNameKana" value="" placeholder="姓ふりがなを入力">
							<br>

							<span>名ふりがな</span>
							<input type="text" name="firstNameKana" value="" placeholder="姓ふりがなを入力">
							<br>

							<!-- 確認ボタン -->
							<button type="submit">
									<span>確認画面へ</span>
							</button>

						</s:if>

						<!-- 性別 -->
						<s:elseif test="session.reset.equals('sex')">
							<span>性別</span>
							<s:radio name="sex" list="#{'0': '男性　　', '1': '女性'}" value="0"/>
							<br>

							<!-- 確認ボタン -->
							<button type="submit">
									<span>確認画面へ</span>
							</button>
						</s:elseif>

						<!-- メールアドレス -->
						<s:elseif test="session.reset.equals('email')">
							<span>メールアドレス</span>
							<input type="text" autofocus name="email" value="" placeholder="メールアドレスを入力">
							<br>

							<!-- 確認ボタン -->
							<button type="submit">
									<span>確認画面へ</span>
							</button>
						</s:elseif>

						<!-- ID -->
						<s:elseif test="session.reset.equals('userId')">
							<span>ID</span>
							<input type="text" autofocus name="userId" value="" placeholder="IDを入力">
							<br>

							<!-- 確認ボタン -->
							<button type="submit">
									<span>確認画面へ</span>
							</button>
						</s:elseif>

						</s:form>

						<!-- 宛先情報 -->
						<s:elseif test="session.reset.equals('destination')">

						<s:if test="destinationInfoList.size() == 0">
								宛先情報がありません
								<s:form action="GoDestinationInsertAction">
								<s:submit value="宛先情報の新規登録"/>
								<input type="hidden" name="where" value="fromReset"/>
							</s:form>
						</s:if>

						<s:else>
						<s:form action="DestinationChangeAction" theme="simple">
							<s:iterator value="destinationInfoList">
								<div class="box">
									<div class="destination_title">
											<input type="radio" name="destinationId" value="<s:property value="id"/>" checked="checked"/>
									</div>
									お届け先
									<div class="destination_box">
									ふりがな:
									<s:property value="familyNameKana"/>
									<s:property value="firstNameKana"/>
									<br>
									名前:
									<s:property value="familyName"/>
									<s:property value="firstName"/>
									<br>
									住所:
									<s:property value="userAddress"/>
									<br>
									電話番号:
									<s:property value="telNumber"/>
									<br>
									メールアドレス:
									<s:property value="email"/>
									<br>
									</div>
								</div>

							</s:iterator>
							<button type='submit' name='action' value='update'>宛先情報の更新</button>
 							<button type='submit' name='action' value='delete' id="onclick">宛先情報の削除</button>
						</s:form>


							<!-- 追加ボタン -->
							<s:form action="GoDestinationInsertAction">
								<s:submit value="宛先情報の新規登録"/>
								<input type="hidden" name="where" value="fromReset"/>
							</s:form>
						</s:else>

						</s:elseif>

						<%-- </s:form> --%>
						<!-- マイページに戻る -->
						<div class=link>
								<s:form action="MyPageAction" class="button">
									<s:submit value="マイページに戻る"/>
								</s:form>
						</div>

				</div>



		</div>

		<!-- フッター -->
		<jsp:include page="includeFooter.jsp"/>

<%-- <script type="text/javascript">

		//全件削除確認
		function allDel(){

			if(window.confirm('全件削除しますか？')){

				return true;

			} else {

				return false;

			}
		}

		//セレクター
		$(function(){

			  $("#submit_select").change(function(){

			    $("#submit_form").submit();

			  });

			});

</script> --%>

<script type="text/javascript">
document.getElementById("onclick").onclick = function() {



	// 「OK」時の処理開始 ＋ 確認ダイアログの表示
	if(window.confirm('削除してもよろしいですか？')){

		return true;

	}
	// 「OK」時の処理終了

	// 「キャンセル」時の処理開始
	else{

		window.alert('キャンセルされました'); // 警告ダイアログを表示
		return false;

	}
	// 「キャンセル」時の処理終了

}
</script>

</body>
</html>