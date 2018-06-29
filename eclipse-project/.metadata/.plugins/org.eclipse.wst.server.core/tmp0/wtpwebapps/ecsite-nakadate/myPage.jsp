<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="Content-Style-Type" content="text/css"/>
	<link rel="stylesheet" type="text/css" href="./CSS/myPage-style.css">
	<meta http-equiv="Content-Script-Type" content="text/javascript"/>
	<meta http-equiv="imagetoolbar" content="no"/>
	<meta name="description" content=""/>
	<meta name="keywords" content=""/>

	<title>マイページ画面</title>


</head>
<body>
		<!-- ヘッダー -->
		<jsp:include page="includeHeader.jsp"/>

		<div id="main">

				<div id="top">
						<p>マイページ</p>
				</div>

				<div>
						<s:iterator value="myPageList">

						<table>
								<tr>
										<td>
											氏名：
										</td>
										<td>
											<s:property value="familyName"/>
											<s:property value="firstName"/>
											（<s:property value="familyNameKana"/>
											<s:property value="firstNameKana"/>）
										</td>
										<td>
											<s:form action="ResetAction">

												<button type='submit' name="reset" value="name">変更</button>

											</s:form>
										</td>
								</tr>

								<tr>
										<td>
											性別：
										</td>
										<td>
											<p>
												<s:if test="sex==0">男性</s:if>
												<s:else>女性</s:else>
											</p>
										</td>
										<td>
											<s:form action="ResetAction">

												<button type='submit' name="reset" value="sex">変更</button>

											</s:form>
										</td>
								</tr>
								<tr>
										<td>
											メールアドレス：
										</td>
										<td>
											<s:property value="email"/>
										</td>
										<td>
											<s:form action="ResetAction">

												<button type='submit' name="reset" value="email">変更</button>

											</s:form>
										</td>
								</tr>

								<tr>
										<td>
											ID：
										</td>
										<td>
											<s:property value="userId"/>
										</td>
										<td>
											<s:form action="ResetAction">

												<button type='submit' name="reset" value="userId">変更</button>

											</s:form>
										</td>
								</tr>
								<tr>
										<td>
											パスワード：
										</td>
										<td>
											<p>
												<s:property value="session.hiddenPassword"/>
											</p>
										</td>
										<td>
											<s:form action="ResetPasswordAction">
												<s:submit value="変更"/>
											</s:form>
										</td>
								</tr>

								<tr>
										<td>
											登録お届け先件数：
										</td>
										<td>
											<s:property value="destinationCount"/>件
										</td>
										<td>
											<s:form action="ResetAction">

												<button type='submit' name="reset" value="destination">変更</button>

											</s:form>
										</td>
								</tr>

						</table>
						</s:iterator>


						<s:form action="BuyItemHistoryAction" class="button">
							<s:submit value="購入履歴"/>
						</s:form>

				</div>

<%-- ユーザー情報変更使うかも				<div>
						<s:if test="myPageList == null">
								<h3>ご購入情報はありません。</h3>
						</s:if>

						<s:elseif test="message == null">

								<h3>ご購入情報は以下になります。</h3>

								<table border="1">
								<tr>
										<th>商品名</th>
										<th>値段</th>
										<th>購入個数</th>
										<th>支払い方法</th>
										<th>購入日</th>
								</tr>

								<s:iterator value="myPageList">

									<tr>
										<td><s:property value="itemName"/></td>
										<td><s:property value="totalPrice"/><span>円</span></td>
										<td><s:property value="totalCount"/><span>個</span></td>
										<td><s:property value="payment"/></td>
										<td><s:property value="insert_date"/></td>
									</tr>

								</s:iterator>

								</table>



						</s:elseif>


				</div> --%>

		</div>

		<!-- フッター -->
		<jsp:include page="includeFooter.jsp"/>

</body>
</html>