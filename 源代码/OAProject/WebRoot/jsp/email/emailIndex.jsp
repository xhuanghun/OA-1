<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK"%>
<%
	request.setAttribute("path", request.getContextPath());
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>邮件中心</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<SCRIPT type="text/javascript">
	
</SCRIPT>
</head>
<style type="text/css">
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}

.STYLE1 {
	font-size: 25px;
	font-family: 楷体
}

.STYLE3 {
	font-size: 15px;
	font-weight: bold;
}

.STYLE4 {
	color: blue;
	font-size: 30px;
}

A.ACLASS:link {
	font-size: 15px;
	color: blue;
	text-decoration: none
}

A.ACLASS:hover {
	font-size: 15px;
	color: blue;
	text-decoration: none
}

A.ACLASS:visited {
	font-size: 15px;
	color: blue;
	text-decoration: none
}

A.ACLASS:active {
	font-size: 15px;
	color: blue;
	text-decoration: none
}

A.ACLASS2:link {
	font-size: 30px;
	color: #9A32CD;
	text-decoration: none
}

A.ACLASS2:hover {
	font-size: 35px;
	color: purple;
	text-decoration: underline;
}

A.ACLASS2:visited {
	font-size: 30px;
	color: #9A32CD;
	text-decoration: none
}

A.ACLASS2:active {
	font-size: 30px;
	color: #9A32CD;
	text-decoration: none
}
</style>

<body>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="30"
				background="<%=request.getContextPath()%>/main/tab/images/tab_05.gif"><table
					width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="12" height="30"><img
							src="<%=request.getContextPath()%>/main/tab/images/tab_03.gif"
							width="12" height="30" /></td>
						<td><div align="center">
								<img src="<%=request.getContextPath()%>/main/tab/images/tb.gif"
									width="16" height="16" />
							</div></td>
						<td width="95%"><span class="STYLE3">你当前的位置</span>：[<a
							class="ACLASS"
							href="<%=request.getContextPath()%>/email/emailAction.action">邮件中心</a>]</td>

						<td width="16"><img
							src="<%=request.getContextPath()%>/main/tab/images/tab_07.gif"
							width="16" height="30" /></td>
					</tr>
				</table></td>
		</tr>
		<tr height="800px" valign="top">
			<td width="100%"><table width="100%" height="100%" border="0"
					cellspacing="0" cellpadding="0">
					<tr valign="top">
						<td width="8"
							background="<%=request.getContextPath()%>/main/tab/images/tab_12.gif">&nbsp;</td>
						<td><table width="100%" border="0" cellpadding="0"
								cellspacing="0" bgcolor="#FFFFFF">
								<tr>
									<td height="100px"></td>
								</tr>
								<tr>
									<td width="100%"><table width="100%" border="0"
											cellpadding="0" cellspacing="0">
											<tr>
												<td width="150px"><div>
														<span class="STYLE1"></span>
													</div></td>
												<td width="250px"><div>
														<span class="STYLE1">欢迎来到邮件中心：</span>
													</div></td>
												<td><div>
														<span class="STYLE4">${user.username}</span>
													</div></td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td height="20px"></td>
								</tr>
								<tr>
									<td width="100%"><table width="100%" border="0"
											cellpadding="0" cellspacing="0">
											<tr>
												<td width="50px"><div>
														<span class="STYLE1"></span>
													</div></td>
												<td width="250px"><div>
														<span class="STYLE1">您有  <b style="color: red;font-family: 宋体 ;font-size: 35px" >${unreadCount}</b> 封未读邮件</span>
													</div></td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td height="20px"></td>
								</tr>
								<tr>
									<td width="100%"><table width="100%" border="0"
											cellpadding="0" cellspacing="0" >
											<tr height="40px">
												<td width="10%"></td>
												<td width="10%" align="center"><div><span><a class="ACLASS2" href="${request.path}/email/emailAction!drafts.action">写信</a></span></div></td>
												<td width="10%" align="center"><div><span><a class="ACLASS2" href="${request.path}/email/emailAction!emaillist.action?type=0">草稿箱</a></span></div></td>
												<td width="10%" align="center"><a class="ACLASS2" href="${request.path}/email/emailAction!emaillist.action?type=1">已发送</a></td>
												<td width="10%" align="center"><a class="ACLASS2" href="${request.path}/email/emailAction!emaillist.action?type=2">收件箱</a></td>
												<td width="10%" align="center"><a class="ACLASS2" href="${request.path}/email/emailAction!emaillist.action?type=3">垃圾箱</a></td>
												<td width="40%"></td>
											</tr>
										</table>
									</td>
								</tr>
							</table></td>
						<td width="8"
							background="<%=request.getContextPath()%>/main/tab/images/tab_15.gif">&nbsp;</td>
					</tr>
				</table></td>
		</tr>
		<!-- 底部 -->
		<tr>
			<td height="35"
				background="<%=request.getContextPath()%>/main/tab/images/tab_19.gif"><table
					width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="12" height="35"><img
							src="<%=request.getContextPath()%>/main/tab/images/tab_18.gif"
							width="12" height="35" /></td>
						<td width="100%"></td>
						<td width="16"><img
							src="<%=request.getContextPath()%>/main/tab/images/tab_20.gif"
							width="16" height="35" /></td>
					</tr>
				</table></td>
		</tr>
	</table>

</body>
</html>
