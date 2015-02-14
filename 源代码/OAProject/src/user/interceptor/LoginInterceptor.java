package user.interceptor;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;
/**
 * 拦截器
 * @author xia-z
 *
 */
public class LoginInterceptor implements Interceptor{

	public void destroy() {
	
	}

	public void init() {
		
	}

	public String intercept(ActionInvocation ai) throws Exception {
		ActionContext actionContext=ai.getInvocationContext();		
		Object action=ai.getAction();//获取当前请求访问的Action对象
		action.getClass().getName();
		ai.getProxy().getMethod();//获取当前请求执行的action的方法
		Map sessionMap=actionContext.getSession();
		if (sessionMap.get("user")==null) {
			return "login";
		}else {
			return ai.invoke();//
		}

	}

}
