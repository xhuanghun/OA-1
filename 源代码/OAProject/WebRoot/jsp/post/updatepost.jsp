﻿<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>修改公告</title>

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
		
	
		var content=document.getElementsByName('content')[1];
	

		if(content.value.length<=0){
			alert("公告内容必须填");
			return false;
		}
		
		
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
  	
  		var tbody = document.getElementById("tbd");
			var childs = tbody.childNodes;
			if(childs.length>=3){
				alert("附件数量已有3个,不能添加附件,请先删除其中的一些附件");
				return ;
			}else{
		
		var newtr=tbd.insertRow();
		var newtd1=newtr.insertCell();
		newtd1.innerHTML="<input type='file' name='upload' />";
		var newtd2=newtr.insertCell();
		newtd2.innerHTML="<input type='button' value='删除' onclick=deletenotfile(this) />";
			
		}
	
	}function deletenotfile(pid){
		filesize--;
		var td=pid.parentNode;
		var tr=td.parentNode;
		var tb=tr.parentNode;
		tb.removeChild(tr);
	}
	function deleterows(pid){
		
		
		
		var tbody = document.getElementById("tbd");
			var tr = document.getElementById("tr"+pid);
			
			createXMLHttp();
	
			var url = "<%=path%>/post/postFileAction.action?postFileId="+pid+"&date="
			+ new Date().getTime();
			
			XmlHttp.open("get", url, true);
			//指定回调的方法
			XmlHttp.onreadystatechange = function(){
				if (XmlHttp.readyState == 4) {
					if (XmlHttp.status == 200) {
						var text = XmlHttp.responseText;
						
						tbody.removeChild(tr);
					}
				}
			};
			XmlHttp.send();
		
	}
  	//ajax代码
		var XmlHttp = null;
	function createXMLHttp() {
	if (window.ActiveXObject) {
		XmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	} else if (window.XMLHttpRequest) {
		XmlHttp = new XMLHttpRequest();
	}
}
  
  
  </script>
	<body>
		<s:form action="postAction!update" namespace="/post" name="form1"
			method="post" enctype="multipart/form-data" theme="simple"
			onsubmit="return testsubmit()">
			<table border="1" width="800">
				<tr bgcolor="#3399FF">
					<td colspan="2" align="center">
						修改公共
					</td>
				</tr>
				<tr>
					<td>
						公告标题
					</td>
					<td>
						<s:hidden name="postbean.postid"
							value="%{#request.postBean1.postid}" />
						<s:textfield name="stitle" id="stitle"
							value="%{#request.postBean1.stitle}" />
						<font color="red">*提示：公共标题不能为空，不能超过15个字</font>
					</td>
				</tr>
				<tr>
					<td>
						生效时间
					</td>
					<td>
						<s:textfield name="begindate"
							value="%{begindate}"
							onfocus="javascript:{show_cele_date(this,'','',this);}" />
						<font color="red">*提示：公共生成时间，不能小于当前时间</font>
					</td>
				</tr>
				<tr>
					<td>
						失效时间
					</td>
					<td>
						<s:textfield name="enddate" value="%{enddate}"
							onfocus="javascript:{show_cele_date(this,'','',this);}" />
						<font color="red">*提示：公共失效时间，不能小于生成时间</font>
					</td>
				</tr>


				<tr height="200">
					<td colspan="2">
						<FCK:editor instanceName="EditorDefault" inputName="content"
							basePath="/fckeditor" value="${content}" />
					</td>
				</tr>
				<tr>
					<td>
						上传附件
					</td>
					<td>
						<input type="button" value="添加附件" onclick="addrows()" />
					</td>
				</tr>
				<tbody id="tbd">

					<s:iterator value="#attr.postFileBeans" var="postFile">
						<tr id="tr${postFile.nid}">
							<td>

								<s:property value="#postFile.soldname" />
							</td>
							<td>
								<input type="button" value="删除附件"
									onclick="deleterows(${postFile.nid})" />

							</td>
						</tr>


					</s:iterator>
				</tbody>
				<tr>
					<td colspan="2" align="center">
						<s:submit value="修改" />
						<s:reset value="重置" />
					</td>
				</tr>



			</table>



		</s:form>
	</body>
</html>
