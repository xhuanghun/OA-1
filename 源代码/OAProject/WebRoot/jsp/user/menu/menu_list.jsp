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
    
    <title>菜单列表</title>
    
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
	color: ##AAFFEE;
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
	color: #FFFFFF;
	text-decoration: none;
}
.STYLE7 {font-size: 12}
</style>
<SCRIPT type="text/javascript">
  function refresh(){
	  
	  window.parent.frames['I2'].location='<%=path %>/oa/menu!getUserRoleMenu';
  }
</SCRIPT>
  </head>
  
  <body onload="refresh()">
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="15" height="30"><img src="main/tab/images/tab_03.gif" width="15" height="30" /></td>
        <td width="1101" background="main/tab/images/tab_05.gif"><img src="main/tab/images/tb.gif" width="16" height="16" /> <span class="STYLE4">你当前的位置:[<a href="<%=path %>/oa/menulist!view">菜单管理</a>]-[<a href="<%=path %>/oa/menulist!view">菜单列表</a>]</span></td>
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
        <td bgcolor="#f3ffe3"><table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#c0de98" onmouseover="changeto()"  onmouseout="changeback()">       
          <tr>
     
            <td width="5%" height="26" background="main/tab/images/bg.gif" class="STYLE2 STYLE1"><div align="center" class="STYLE1">序号</div></td>
            <td width="27%" height="18" background="main/tab/images/bg.gif" class="STYLE2 STYLE1"><div align="center" class="STYLE1">菜单名称</div></td>
            <td width="25%" height="18" background="main/tab/images/bg.gif" class="STYLE2 STYLE1"><div align="center" class="STYLE1">菜单链接</div></td>
            <td width="10%" height="18" background="main/tab/images/bg.gif" class="STYLE2 STYLE1"><div align="center" class="STYLE1">父类ID</div></td>
            <td width="18%" height="18" background="main/tab/images/bg.gif" class="STYLE2 STYLE1"><div align="center" class="STYLE1">排序</div></td>
            <td width="15%" height="18" background="main/tab/images/bg.gif" class="STYLE2 STYLE1">
            <div align="center" class="STYLE1">操作 <img src="main/tab/images/22.gif" width="9" height="9" />
            <span class="STYLE1"> [</span><a href="<%=path %>/oa/menu!init"><span class="STYLE4" style="color:red"> 添加菜单</span></a><span class="STYLE1">]</span></div></td>
            
          </tr>
          <%int a=1; %>
          <s:iterator value="menulist.{? #this.pid==0}" var="menu" status="max">
          
           <tr>         
            <td height="18" bgcolor="#FFFFFF" class="STYLE2"><div align="center" class="STYLE2 STYLE1"><%=a++ %></div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="left"" class="STYLE2 STYLE1"><input type="text" readonly="readonly" name="menuname" value="${ menuname}" border="0"></div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1"><s:property value="link"/></div></td>    
            <td height="18" bgcolor="#FFFFFF"><div align="left" class="STYLE2 STYLE1"><s:property value="pid"/></div></td>   
            <s:if test="#max.first">
            	<td height="18" bgcolor="#FFFFFF"><div align="left" class="STYLE2 STYLE1"><a href="<%=path %>/oa/menu!down?orderid=${orderid}&pid=${pid}&menuid=${menuid}" onclick=" window.parent.frames['I2'].location='<%=path %>/oa/menu!getUserRoleMenu';">下移</a></div></td>      
            </s:if>
             <s:elseif test="#max.last">
            	<td height="18" bgcolor="#FFFFFF"><div align="left" class="STYLE2 STYLE1"><a href="<%=path %>/oa/menu!up?orderid=${orderid}&pid=${pid}&menuid=${menuid}" onclick=" window.parent.frames['I2'].location='<%=path %>/oa/menu!getUserRoleMenu';" />上移</a></div></td>      
            </s:elseif>
            <s:else>
            <td height="18" bgcolor="#FFFFFF"><div align="left" class="STYLE2 STYLE1"><a href="<%=path %>/oa/menu!up?orderid=${orderid}&pid=${pid}&menuid=${menuid}" onclick=" window.parent.frames['I2'].location='<%=path %>/oa/menu!getUserRoleMenu';" />上移</a>|<a href="<%=path %>/oa/menu!down?orderid=${orderid}&pid=${pid}&menuid=${menuid}" onclick=" window.parent.frames['I2'].location='<%=path %>/oa/menu!getUserRoleMenu';"/>下移</a></div></td>         
            </s:else>
            <td height="18" bgcolor="#FFFFFF">
	            <div align="center">	            	
		            <img src="main/tab/images/edt.gif" width="9" height="9" /><span class="STYLE1"> [</span><a href="<%=path %>/oa/menu!updatePage?menuid=${menuid }">修改</a><span class="STYLE1">]</span>								
					<img src="main/tab/images/del.gif" width="9" height="9" /><span class="STYLE1">[</span><a href="<%=path %>/oa/menu!delete?menuid=${menuid }&pid=${pid}">删除</a><span class="STYLE1">]</span>			
				</div>
			</td>          
          </tr>
          
          <s:iterator value="menulist.{? #this.pid==#menu.menuid}" var="min" status="j">
          	
          	<tr>         
            <td height="18" bgcolor="#FFFFFF" class="STYLE2"><div align="center" class="STYLE2 STYLE1"><%=a++ %></div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="right" class="STYLE2 STYLE1"><input readonly="readonly" type="text" name="menuname" value="${ menuname}" border="0"></div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1"><s:property value="link"/></div></td>    
            <td height="18" bgcolor="#FFFFFF"><div align="right" class="STYLE2 STYLE1"><s:property value="pid"/></div></td>                     
            
             <s:if test="#j.first&&#j.last">
            	<td height="18" bgcolor="#FFFFFF"><div align="right" class="STYLE2 STYLE1"><a href="<%=path %>/oa/menu!down?orderid=${orderid}&pid=${pid}&menuid=${menuid}" /></a></div></td>      
            </s:if>
            <s:else>
	            <s:if test="#j.first">
	            	<td height="18" bgcolor="#FFFFFF"><div align="right" class="STYLE2 STYLE1"><a href="<%=path %>/oa/menu!down?orderid=${orderid}&pid=${pid}&menuid=${menuid}" onclick=" window.parent.frames['I2'].location='<%=path %>/oa/menu!getUserRoleMenu';"/>下移</a></div></td>      
	            </s:if>
	             <s:elseif test="#j.last">
	            	<td height="18" bgcolor="#FFFFFF"><div align="right" class="STYLE2 STYLE1"><a href="<%=path %>/oa/menu!up?orderid=${orderid}&pid=${pid}&menuid=${menuid}" onclick=" window.parent.frames['I2'].location='<%=path %>/oa/menu!getUserRoleMenu';"/>上移</a></div></td>      
	            </s:elseif>
	           
	            <s:else>
	            <td height="18" bgcolor="#FFFFFF"><div align="right" class="STYLE2 STYLE1"><a href="<%=path %>/oa/menu!up?orderid=${orderid}&pid=${pid}&menuid=${menuid}" onclick=" window.parent.frames['I2'].location='<%=path %>/oa/menu!getUserRoleMenu';">上移</a>|<a href="<%=path %>/oa/menu!down?orderid=${orderid}&pid=${pid}&menuid=${menuid}" onclick=" window.parent.frames['I2'].location='<%=path %>/oa/menu!getUserRoleMenu';"/>下移</a></div></td>         
	            </s:else> 
            </s:else>     
            <td height="18" bgcolor="#FFFFFF">
	            <div align="center">	            	
		            <img src="main/tab/images/edt.gif" width="9" height="9" /><span class="STYLE1"> [</span><a href="<%=path %>/oa/menu!updatePage?menuid=${menuid }">修改</a><span class="STYLE1">]</span>								
					<img src="main/tab/images/del.gif" width="9" height="9" /><span class="STYLE1">[</span><a href="<%=path %>/oa/menu!delete?menuid=${menuid }&pid=${pid}">删除</a><span class="STYLE1">]</span>			
				</div>
			</td>          
          </tr>	
          </s:iterator>
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
  </body>
</html>
