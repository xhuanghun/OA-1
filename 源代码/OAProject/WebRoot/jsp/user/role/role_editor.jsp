<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'role_editor.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script src="<%=path %>/js/jquery-1.4.4.min.js" type="text/javascript"></script>
	<script src="<%=path %>/js/formValidator-4.1.3.js" type="text/javascript" charset="UTF-8"></script>
	<script src="<%=path %>/js/formValidatorRegex.js" type="text/javascript" charset="UTF-8"></script>
	<script language="javascript" src="<%=path %>/js/DateTimeMask.js" type="text/javascript"></script>
<script>
		function selectCheck(){
			
		}
		//选中孩子
		function selectChild(o){
		
			//获得本菜单的tr
			var otr = o.parentElement.parentElement;
			
			//获得子菜单的tr
			var otrmenu = otr.nextSibling;			
			//遍历子菜单的checkbox
			for(var i=0;i<otrmenu.all.length;i++)	{
				if(otrmenu.all[i].type=="checkbox"){
					otrmenu.all[i].checked = o.checked;
				}
			}		
		}	
		//选中根点节(适用一级)
		function selectRoot(o){
		
			//t=true默认找到
			var t= false;
			//获得本菜单的tr
			var otr = o.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement;
			
			//获得父菜单的tr
			var otrmenu = otr.previousSibling;
			//遍历子菜单的checkbox,验证是否全选
			for(var i=0;i<otr.all.length;i++)	{
				if(otr.all[i].type=="checkbox" && otr.all[i].checked){
					t = true;
					break;
				}
			}		
				//设置父类的checkbox状态
			if(t){
				for(var i=0;i<otrmenu.all.length;i++)	{
				if(otrmenu.all[i].type=="checkbox"){
					otrmenu.all[i].checked = "checked";				
					break;
					}
				}
			}else{
				for(var i=0;i<otrmenu.all.length;i++)	{
				if(otrmenu.all[i].type=="checkbox"){
					otrmenu.all[i].checked = "";
					break;
					}
				}
			}		
			
		}
		//菜单的显示与隐藏
		function setDisplay(o){
			if(o.style.display==""){
				o.style.display="none";
			}else{
				o.style.display="";
			}
		}
		
</script>
<script type="text/javascript">
$(document).ready(function(){

	$.formValidator.initConfig({formID:"form2",onError:function(){alert("校验没有通过，具体错误请看错误提示")}});
	
		$("#rolename").formValidator({onShow:"请输入角色名",onFocus:"角色名称至少要输入3个汉字",onCorrect:"该角色名可以注册"}).inputValidator({min:3,onError:"你输入的角色名非法,请确认"}).regexValidator({regExp:"chinese",dataType:"enum",onError:"角色名格式不正确"})
	    .ajaxValidator({
		type : "get",
        dataType : "html",
        async : true,
        cache:false,
        contentType:"application/x-www-form-urlencoded;charset=utf-8",
		url : "<%=path %>/oa/role!checkRolename.action?date =" + new Date().getTime(),
		success : function(data){
	        if( data == "0" ) return true;
			return "该角色名不可用，请更换角色名";
		},
		buttons: $("#button"),
		error: function(jqXHR, textStatus, errorThrown){alert("服务器没有返回数据，可能服务器忙，请重试"+errorThrown);},
		onError : "该角色名不可用，请更换角色名",
		onWait : "正在对角色名进行合法性校验，请稍候..."
	});
	
	$("#description").formValidator({onShow:"请输入你的描述",onFocus:"描述至少要输入3个汉字或6个字符",onCorrect:"恭喜你,你输对了"}).inputValidator({min:6,onError:"你输入的描述长度不正确,请确认"});	
	$("#yy").formValidator({relativeID:"qq5",tipID:"midTip",tipCss :{"left":"116px"},onShow:"请为其授予角色（至少选一个）",onFocus:"你至少选择1个",onCorrect:"恭喜你,你选对了"}).inputValidator({min:1,onError:"你选的个数不对"});
});
</script>
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
        <td width="1101" background="main/tab/images/tab_05.gif"><img src="main/tab/images/tb.gif" width="16" height="16" /> <span class="STYLE4">你当前的位置:[<a href="<%=path %>/oa/rolelist!view">角色管理</a>]-[<a href="<%=path %>/oa/role!doinit">角色添加<a>]</span></td>
        <td width="281" background="main/tab/images/tab_05.gif"><table border="0" align="right" cellpadding="0" cellspacing="0">
		        </table></td>
        <td width="14"><img src="main/tab/images/tab_07.gif" width="14" height="30" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
   <s:form action="role!saveOrUpdate" name="form2" id="form2" theme="simple" namespace="/oa">
    			<table width="670" height="150px" align="center" border="1">
    			<s:hidden name="roleid" id="roleid"></s:hidden>
				<tr bgcolor="#FFFFFF">
					<td width="120" bgcolor="#FFFFFF">
						角色名称：
					</td>
					<td width="200">
						<s:textfield name="rolename" id="rolename" ></s:textfield>
					</td>
					<td><div id="rolenameTip" style="width:280px"></td>
				</tr>
				<tr bgcolor="#FFFFFF">
					<td width="30%">
						角色描述：
					</td>
					<td width="7%">
						<s:textarea name="roleinfo" id="description" rows="4" cols="15"></s:textarea>
					</td>
					<td><div id="descriptionTip" style="width:280px"></div></td>
				</tr>
				<tr bgcolor="#FFFFFF">
					<td width="30%">
						功能：
					</td>
					
					<td width="7%">
						<table width="181" height="171">		
							<s:iterator value="menulist.{? #this.pid==0}" var="item" id="p">
								<tr>
									<td height="12">
										<input type="checkbox" name="mid" id="xx"
											value="<s:property value="menuid"/>"
											<s:if test="menuid in midlist"> checked="checked"</s:if>
											onclick="selectChild(this);">
										${p.menuname }
									</td>
								</tr>
								<tr id="m1_menu">
									<td height="12">
										<table>
											<s:iterator value="menulist.{? #this.pid==#p.menuid}" var="item">
												<tr>
													<td>
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														<input type="checkbox" name="mid" id="yy"
															value="<s:property value="menuid"/>"
															<s:if test="menuid in midlist"> checked="checked"</s:if>
															onclick="selectRoot(this);">
														<s:property value="menuname" />
													</td>
												</tr>
											</s:iterator>											
										</table>
										</td>
									</tr>
							</s:iterator>
						</table>
					</td>
					<td><div id="midTip" style="width:350px"></td>
				</tr>			
				<tr bgcolor="#FFFFFF">
					<td colspan="3" align="center">
						<s:submit value="%{roleid>0?'修改':'新增'}"></s:submit>
						<input type="button" value="返回" onclick="history.go(-1);">
					</td>

				</tr>
			</table>
			</s:form>
  </tr>
  </table>
  </body>
</html>
