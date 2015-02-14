<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户类表</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
	body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.STYLE1 {font-size: 12px}
.STYLE21 {font-size: 12px}
.STYLE4 {
	font-size: 12px;
	color: #1F4A65;
	font-weight: bold;
}

a:link {
	font-size: 12px;
	color: #06482a;
	text-decoration: none;

}
a:visited {
	font-size: 12px;
	color: #06482a;
	text-decoration: none;
}
a:hover {
	font-size: 12px;
	color: #FF0000;
	text-decoration: underline;
}
a:active {
	font-size: 12px;
	color: #FF0000;
	text-decoration: none;
}
.STYLE7 {font-size: 12}
	
</style>
<script>
	function doupdate(userid){
	    
		location.href="<%=path %>/oa/user!updatePage?userid="+userid;
	}
	function dofreeze(userid){	
	 
		location.href="<%=path %>/oa/user!dostatus?userid="+userid;
	}
	function dodelete(userid){	
		if(confirm("确定要删除该用户吗?")){
			location.href="<%=path %>/oa/user!deleteuser?userid="+userid;
		}
		
	}
</script>
  </head>
  
  <body>
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="15" height="30"><img src="main/tab/images/tab_03.gif" width="15" height="30" /></td>
        <td width="1101" background="main/tab/images/tab_05.gif"><img src="main/tab/images/tb.gif" width="16" height="16" /> <span class="STYLE4">你当前的位置:[<a href="<%=path %>/oa/userlist!view">用户管理</a>]-[<a href="<%=path %>/oa/userlist!view">用户列表</a>]</span></td>
                
                <td width="281" background="main/tab/images/tab_05.gif"><table border="0" align="right" cellpadding="0" cellspacing="0">
		           <tr>
		           	 
		              <td width="85"><table width="100%" border="0" cellpadding="0" cellspacing="0">
		                  <tr>
		                    <td class="STYLE1"><div align="center"><img src="main/tab/images/22.gif" width="14" height="14" /></div></td>
		                    <td class="STYLE4"><div align="center"><a href="<%=path %>/oa/user!init">添加用户</a></div></td>
		                  </tr>
		              </table></td>
		              
		            </tr>
		        </table></td>
        <td width="14"><img src="main/tab/images/tab_07.gif" width="14" height="30" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="9" background="main/tab/images/tab_12.gif">&nbsp;</td>
        <td>
        <s:form action="userlist!view" name="page_form_search" id="page_form_search" theme="simple" namespace="/oa">
	        <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1">       
	          <tr>
		          <td class="STYLE4" align="center">
		           	        账号：<s:textfield name="username" id="username"></s:textfield>
					        姓名：<s:textfield name="realname" id="realname"></s:textfield>
					        部门    <s:select id="did" list="datalist.{? #this.dpid==3}" name="deptno" headerKey="0" headerValue="请选择" listKey="did" listValue="dname"></s:select>
					        <input value="查询" type="submit" class="STYLE4">
		         </td>
	          </tr>
	        </table>
	        </s:form>
        </td>
        <td width="9" background="main/tab/images/tab_15.gif">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  
    <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="9" background="main/tab/images/tab_12.gif">&nbsp;</td>
        <td bgcolor="#f3ffe3"><table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#c0de98" onmouseover="changeto()"  onmouseout="changeback()">       
          <tr>          
            <td width="4%" height="18" background="main/tab/images/bg.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">序号</div></td>
            <td width="8%" height="18" background="main/tab/images/bg.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">账号</div></td>
            <td width="9%" height="18" background="main/tab/images/bg.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">真实姓名</div></td>
            <td width="10%" height="18" background="main/tab/images/bg.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">性别</div></td>
            <td width="14%" height="18" background="main/tab/images/bg.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">手机</div></td>
            <td width="24%" height="18" background="main/tab/images/bg.gif" class="STYLE1"><div align="center" class="STYLE2">地址</div></td>
            <td width="7%" height="18" background="main/tab/images/bg.gif" class="STYLE1"><div align="center" class="STYLE2">用户状态</div></td>
            <td width="7%" height="18" background="main/tab/images/bg.gif" class="STYLE1"><div align="center" class="STYLE2">修改</div></td>
            <td width="7%" height="18" background="main/tab/images/bg.gif" class="STYLE1"><div align="center" class="STYLE2">冻结/解冻</div></td>
            <td width="7%" height="18" background="main/tab/images/bg.gif" class="STYLE1"><div align="center" class="STYLE2">删除</div></td>
          </tr>
          <s:if test="result.result.size()==0">
          	<tr>
               <td colspan="9" height="18" bgcolor="#FFFFFF" class="STYLE2"><div style="color: red" align="center" class="STYLE2 STYLE1">无此信息!!!</div></td>
           </tr>
          </s:if>
          <s:iterator value="result.result" var="user" status="i">
           <tr> 
	           <td height="18" bgcolor="#FFFFFF" class="STYLE2"><div align="center" class="STYLE2 STYLE1"><s:property value="#i.count"/></div></td>
	           <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1"><s:property value="username"/></div></td>
	           <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1"><s:property value="realname"/></div></td>
	           <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1"><s:property value="sex==1?'男':'女'"/></div></td>
	           <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1"><s:property value="mobilephone"/></div></td>           
	           <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1"><s:property value="address"/></div></td>      
	           <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1"> <s:property value="freeze==0?'正常':'冻结'"/></div></td>   
	           <td height="18" bgcolor="#FFFFFF"><div align="center"><img src="main/tab/images/33.gif" width="9" height="9" /><span class="STYLE1"> [</span><a href="javascript:doupdate(<s:property value="userid"/>);">修改</a><span class="STYLE1">]</span></div></td>
	           <td height="18" bgcolor="#FFFFFF"><div align="center"><span class="STYLE2"><img src="main/tab/images/edt.gif" width="9" height="9" /> </span><span class="STYLE1">[</span><a href="javascript:dofreeze(<s:property value="userid"/>);"><s:property value="freeze==0?'冻结':'解冻'"/></a><span class="STYLE1">]</span></div></td>    
               <td height="18" bgcolor="#FFFFFF"><div align="center"><img src="main/tab/images/del.gif" width="9" height="9" /><span class="STYLE1"> [</span><a href="javascript:dodelete(<s:property value="userid"/>);">删除</a><span class="STYLE1">]</span></div></td>
          </tr>
          </s:iterator>
        </table></td>
        <td width="9" background="main/tab/images/tab_15.gif">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
   <tr>
    <td height="29"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="20" height="29"><img src="main/tab/images/tab_18.gif" width="15" height="29" /></td>
        <td width="100%" height="29" background="main/tab/images/tab_19.gif">
        	
        </td>
        <td width="20"><img src="main/tab/images/tab_20.gif" width="14" height="29" /></td>
      </tr>
    </table></td>
  </tr>
  </table>
  <table border="0" width="100%">
<tr>
<td class="STYLE21">
<%@ include file="/jsp/user/pagebar.jsp" %>
</td>
</tr>
</table>
  </body>
</html>
