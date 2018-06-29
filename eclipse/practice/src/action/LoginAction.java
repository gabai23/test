package action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

public class LoginAction　extends ActionSupport implements SessionAware {

	private String categoryId;
	private String loginId;
	private String password;
	
	private boolean savedLoginId;
	private List<MCategoryDTO> mCategoryDtoList = new ArrayList<MCategoryDTO>();
	private List<String> loginErrorMessageList = new ArrayList<String>();
	private List<String> passwordErrorMessageList = new ArrayList<String>();
	
	private Map<String,Object> session;
	
	public String execute(){
		String result = ERROR;
		
		if(savedLoginId == true){
			session.put("savedLoginId",true);
			session.put("loginId",loginId);
		}else{
			session.put("savedLoginId",false);
			session.remove("loginId",loginId);
		}
		
		InputChecker inputChecker = new InputChecker();
		loginIdErrorMessageList = inputChecker.doCheck("ログインID",loginId,)
		
	}
	
}
