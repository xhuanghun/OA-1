﻿<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'addpost.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	</head>
	<script language="javascript" src="js/calendar.js"></script>
	<script type="text/javascript">
  function testsubmit(){
  var d=new Date();
  var year=d.getFullYear();
  var month=d.getMonth()+1;
  var day=d.getDate();
  if(month<10) month="0" + month
  if(day<10) month="0" + day
  var now=year+"-"+month+"-"+day;
  
   
  	var form=document.forms.form1;
		var stitle=form.stitle;
		if(stitle.value.length<1){
			alert("标题必须填");
			return false;
		}
		var begindate=form.begindate;
		if(begindate.value.length<1){
			alert("生效时间必须填");
			return false;
		}
		var enddate=form.enddate;
		if(enddate.value.length<1){
			alert("失效时间必须填");
			return false;
		}
		
		var content=document.getElementsByName('content')[0];
		
		
		
		if(begindate.value<now){
			alert("生效时间必须大于当前时间");
			return false;
		}
		if(enddate.value<begindate.value){
			alert("失效时间必须大于生效时间");
			return false;
		}
	}	
	var filesize=1;
	
  	function addrows(){
  	
		if(filesize<3){
		var newtr=tbd.insertRow();
		var newtd1=newtr.insertCell();
		newtd1.innerHTML="<input type='file' name='upload' />";
		var newtd2=newtr.insertCell();
		newtd2.innerHTML="<input type='button' value='删除' onclick=deleterows(this) />";
			filesize++;
		}else{
		
		alert("最多添加3个");
		}
	
	}
	function deleterows(bt){
		filesize--;
		var td=bt.parentNode;
		var tr=td.parentNode;
		var tb=tr.parentNode;
		tb.removeChild(tr);
		
	}
  
  
  </script>
	<body>
		<s:form action="postAction!addpost" namespace="/post" name="form1"
			method="post" enctype="multipart/form-data" theme="simple" onsubmit="return testsubmit()">
			<table border="1" width="800">
				<tr bgcolor="#3399FF">
					<td colspan="2" align="center">
						发布公共
					</td>
				</tr>
				<tr>
					<td colspan="2">
						公告标题
						<s:textfield name="postbean.stitle"  id="stitle"/>
						<font color="red">*提示：公共标题不能为空，不能超过15个字</font>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						生效时间
						<s:textfield name="begindate" id="begindate"
							onfocus="javascript:{show_cele_date(this,'','',this);}"  />
						<font color="red">*提示：公共生成时间，不能小于当前时间</font>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						失效时间
						<s:textfield name="enddate" id="enddate"
							onfocus="javascript:{show_cele_date(this,'','',this);}" />
						<font color="red">*提示：公共失效时间，不能小于生成时间</font>
					</td>
				</tr>
				<tr height="200">
					<td colspan="2">
						<FCK:editor  instanceName="EditorDefault" inputName="content"
							basePath="/fckeditor"  />	
				
			
					</td>
				</tr>
				<tr>
					<td colspan="2">
						上传附件
						<input type="button" value="添加附件" onclick="addrows()" />
					</td>
				</tr>
				<tbody id="tbd">
					<tr>
						<td>
							<input type="file" name="upload" />
						</td>
					</tr>

				</tbody>
				<tr>
					<td colspan="2" align="center">
						<s:submit value="添加" />
						<s:reset value="重置" />
					</td>
				</tr>



			</table>

			 <s:if test="actionErrors != null">
			<s:property value="actionErrors[0]" />
			</s:if>
				


		</s:form>
	</body>
</html>
