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
    
    <title>My JSP 'role_list.jsp' starting page</title>
    
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
  </head>
  
  <body>
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="15" height="30"><img src="main/tab/images/tab_03.gif" width="15" height="30" /></td>
        <td width="1101" background="main/tab/images/tab_05.gif"><img src="main/tab/images/tb.gif" width="16" height="16" /> <span class="STYLE4">你当前的位置:[<a href="<%=path %>/oa/rolelist!view">角色管理</a>]-[<a href="<%=path %>/oa/rolelist!view">角色列表</a>]</span></td>
        <td width="281" background="main/tab/images/tab_05.gif"><table border="0" align="right" cellpadding="0" cellspacing="0">
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
        <s:form action="rolelist!view" name="page_form_search" id="page_form_search" theme="simple" namespace="/oa">
	        <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1">       
	          <tr>
		          <td class="STYLE4" align="center">
		           	       角色名称：<s:textfield name="rolename" id="rolename"></s:textfield>					     
					        <input value="查询" type="submit" class="STYLE4">
		         </td>
	          </tr>
	         
	        </table>
	        </s:form>
        </td>
        <td width="9" background="images/tab_16.gif">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
   <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="9" background="images/tab_12.gif">&nbsp;</td>
        <td bgcolor="#f3ffe3"><table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#c0de98" onmouseover="changeto()"  onmouseout="changeback()">       
          <tr>
     
            <td width="5%" height="26" background="main/tab/images/bg.gif" class="STYLE2 STYLE1"><div align="center" class="STYLE1">序号</div></td>
            <td width="30%" height="18" background="main/tab/images/bg.gif" class="STYLE2 STYLE1"><div align="center" class="STYLE1">角色名称</div></td>
            <td width="40%" height="18" background="main/tab/images/bg.gif" class="STYLE2 STYLE1"><div align="center" class="STYLE1">角色描述</div></td>
            <td width="25%" height="18" background="main/tab/images/bg.gif" class="STYLE2 STYLE1">
            <div align="center" class="STYLE1">操作 <img src="main/tab/images/22.gif" width="9" height="9" />
            <span class="STYLE1"> [</span><a href="<%=path %>/oa/role!doinit"><span class="STYLE4" style="color:red"> 添加角色</span></a><span class="STYLE1">]</span></div></td>
            
          </tr>
           <s:if test="result.result.size()==0">
          	<tr>
               <td colspan="9" height="18" bgcolor="#FFFFFF" class="STYLE2"><div style="color: red" align="center" class="STYLE2 STYLE1">无此信息!!!</div></td>
           </tr>
          </s:if>
          <s:iterator value="result.result" var="role" status="i">
           <tr>         
            <td height="18" bgcolor="#FFFFFF" class="STYLE2"><div align="center" class="STYLE2 STYLE1"><s:property value="#i.count"/></div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1"><s:property value="rolename"/></div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1"><s:property value="roleinfo"/></div></td>          
            <td height="18" bgcolor="#FFFFFF">
	            <div align="center">	
	            	<s:if test="roleid==1">
	            		  <img src="main/tab/images/edt.gif" width="9" height="9" /><span class="STYLE1"> [</span><span class="STYLE2 STYLE1" style="color:red">无权</span><span class="STYLE1">]</span>								
	            	</s:if> 
	            	<s:else>	
		            <img src="main/tab/images/edt.gif" width="9" height="9" /><span class="STYLE1"> [</span><a href="<%=path %>/oa/role!updatePage?roleid=<s:property value="roleid"/>">修改</a><span class="STYLE1">]</span>								
					</s:else>  
					<s:if test="roleid==1">
	            		  <img src="main/tab/images/del.gif" width="9" height="9" /><span class="STYLE1"> [</span><span class="STYLE2 STYLE1" style="color:red">无权</span><span class="STYLE1">]</span>								
	            	</s:if> 
	            	<s:else>	         
					<img src="main/tab/images/del.gif" width="9" height="9" /><span class="STYLE1">[</span><a href="<%=path %>/oa/role!delete?roleid=<s:property value="roleid"/>">删除</a><span class="STYLE1">]</span>			
					</s:else>
				</div>
			</td>          
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
