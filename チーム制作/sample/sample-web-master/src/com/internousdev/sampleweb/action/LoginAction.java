package com.internousdev.sampleweb.action;

import java.sql.SQLException;//俺が本当に最初の機能につながるから。要注意。
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.sampleweb.dao.CartInfoDAO;
import com.internousdev.sampleweb.dao.DestinationInfoDAO;
import com.internousdev.sampleweb.dao.MCategoryDAO;
import com.internousdev.sampleweb.dao.UserInfoDAO;
import com.internousdev.sampleweb.dto.DestinationInfoDTO;
import com.internousdev.sampleweb.dto.MCategoryDTO;
import com.internousdev.sampleweb.dto.UserInfoDTO;
import com.internousdev.sampleweb.util.InputChecker;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport implements SessionAware{
	private String categoryId;//よくわからん→headerのアイテムカテゴリーはsessionで保持してるからよくわからん
	private String loginId;
	private String password;
	//booleanな。true or false な。
	private boolean savedLoginId;
	//マスターカテゴリーのDTOがリストにつまっている
	private List<MCategoryDTO> mCategoryDtoList = new ArrayList<MCategoryDTO>();
	//それぞれ２つのエラー分のリスト　インスタンス化
	private List<String> loginIdErrorMessageList = new ArrayList<String>();
	private List<String> passwordErrorMessageList = new ArrayList<String>();
	//ここは共通→Objectってなんでもok　trueでもええんやね
	private Map<String, Object> session;
	
	public String execute() {
		String result = ERROR;
		//保存されているIdがあってれば
		if(savedLoginId==true) {
			session.put("savedLoginId", true);
			session.put("loginId", loginId);
		}else {
			session.put("savedLoginId", false);
			//login.jspの画面で入力されたloginIdを消す。
			session.remove("loginId", loginId);
		}
		//inputcheckerのインスタンス化
		InputChecker inputChecker = new InputChecker();
		//inputcheckerのメソッド
		loginIdErrorMessageList = inputChecker.doCheck("ログインID", loginId, 1, 8, true, false, false, true, false, false, false);
		passwordErrorMessageList = inputChecker.doCheck("パスワード", password, 1, 16, true, false, false, true, false, false, false);

		if(loginIdErrorMessageList.size()!=0//ここはListの個数を指定している
		&& passwordErrorMessageList.size()!=0) {//つまりエラーが出たときに
			/*sessionはメソッド外のクラスで定義されているから、ガンガン利用可能
			おそらく、sessionは何個でも疲れるのであろう。*/
			session.put("loginIdErrorMessageList", loginIdErrorMessageList);
			session.put("passwordErrorMessageList", passwordErrorMessageList);
			session.put("logined", 0);//loginされているのが０件→だれもログインされている状態になってない。
		}
		/*もう一個、条件分岐していく！containskeyメソッドはMapのメソッドね。そもそもif()の中身はtrue falseのどっちかを返す*/
		/*"mCaegoryList"というキーが存在していたらtrueを返すメソッドがcontainsKeyメソッド*/
		if(!session.containsKey("mCategoryList")) {
			MCategoryDAO mCategoryDao = new MCategoryDAO();
			mCategoryDtoList = mCategoryDao.getMCategoryList();
			session.put("mCategoryDtoList", mCategoryDtoList);
		}
		
		UserInfoDAO userInfoDao = new UserInfoDAO();
		if(userInfoDao.isExistsUserInfo(loginId, password)) {
			/*if(userInfoDao.login(loginId, password) > 0) {*/
				UserInfoDTO userInfoDTO = userInfoDao.getUserInfo(loginId, password);
				session.put("loginId", userInfoDTO.getUserId());
				
				int count=0;
				CartInfoDAO cartInfoDao = new CartInfoDAO();

				count = cartInfoDao.linkToLoginId(String.valueOf(session.get("tempUserId")),loginId);
				if(count > 0) {
					DestinationInfoDAO destinationInfoDao = new DestinationInfoDAO();
					try {
						List<DestinationInfoDTO> destinationInfoDtoList = new ArrayList<DestinationInfoDTO>();
						destinationInfoDtoList = destinationInfoDao.getDestinationInfo(loginId);
						Iterator<DestinationInfoDTO> iterator = destinationInfoDtoList.iterator();
						if(!(iterator.hasNext())) {
							destinationInfoDtoList = null;
						}
						session.put("destinationInfoDtoList", destinationInfoDtoList);
					} catch (SQLException e) {
						e.printStackTrace();
					}
					result = "settlement";
				}else {
					result = SUCCESS;
				}
			/*}*/
				session.put("loginFlg", true);//ここでtrueにすることでheaderにログアウトが表示されるようになる
		}
		return result;
	}

	public String getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}

	public String getLoginId() {
		return loginId;
	}
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}


	public boolean isSavedLoginId() {
		return savedLoginId;
	}

	public void setSavedLoginId(boolean savedLoginId) {
		this.savedLoginId = savedLoginId;
	}

	public List<String> getLoginIdErrorMessageList() {
		return loginIdErrorMessageList;
	}
	public void setLoginIdErrorMessageList(List<String> loginIdErrorMessageList) {
		this.loginIdErrorMessageList = loginIdErrorMessageList;
	}
	public List<String> getPasswordErrorMessageList() {
		return passwordErrorMessageList;
	}
	public void setPasswordErrorMessageList(List<String> passwordErrorMessageList) {
		this.passwordErrorMessageList = passwordErrorMessageList;
	}
	public Map<String, Object> getSession() {
		return session;
	}
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

}
