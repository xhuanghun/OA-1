<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
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

		<title>My JSP 'shenhepost.jsp' starting page</title>

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
	<body>



		<s:form action="postAction!shenghepost" namespace="/post" name="form1"
			method="post" theme="simple" onsubmit="return true">
			<table>
				<tr>
					<td>
						公共标题：
						<s:textfield name="stitle" />
					</td>
					<td>
						发布时间：
						<s:textfield name="begindate"
							onfocus="javascript:{show_cele_date(this,'','',this);}" />
					</td>
					<td>
						到
						<s:textfield name="enddate"
							onfocus="javascript:{show_cele_date(this,'','',this);}" />
					</td>
					<td>
						<s:submit value="查询" />
					</td>
				</tr>
			</table>
		</s:form>
		
		<s:form theme="simple">
			<table border="1">
				<tr bgcolor="#3399FF">
					<td colspan="7" align="center" background="main/images/tab_05.gif">
						公告审核
					</td>
				</tr>
				<tr bgcolor="#CCCCCC">
					<td width="80">
						公告标题
					</td>
					<td width="220">
						公告内容
					</td>
					<td width="100">
						生成时间
					</td>
					<td width="100">
						失效时间
					</td>
					<td width="80">
						发布者
					</td>
					<td width="100">
						状态
					</td>
					<td width="100">
						审核
					</td>
				</tr>
				<s:iterator value="#attr.postlist" var="bean">
					<tr>
						<td>
							<s:property value="#bean.stitle" />
						</td>
						<td>
							<DIV
								STYLE="width: 200px; height: 20px;   overflow: hidden; text-overflow: ellipsis">
								<NOBR>
									<s:property value="#bean.scontentstr" />
								</NOBR>
							</DIV>
						</td>
						<td>
							<DIV
								STYLE="width: 70px; height: 20px; overflow: hidden; text-overflow: ellipsis">
								<NOBR>
									<s:property value="#bean.begindate" />
								</NOBR>
							</DIV>
						</td>
						<td>
							<DIV
								STYLE="width: 70px; height: 20px; overflow: hidden; text-overflow: ellipsis">
								<NOBR>
									<s:property value="#bean.enddate" />
								</NOBR>
							</DIV>
						</td>
						<td>
							<s:property value="#bean.suser" />
						</td>
						<td>

							<s:if test="#bean.nstatus==0">
								未审核
							</s:if>
							<s:if test="#bean.nstatus==1">
								通过
							</s:if>
							<s:if test="#bean.nstatus==2">
								未通过
							</s:if>
						</td>
						<td>
							<s:if test="#bean.nstatus==0">
								<input type="button" value="通过"
									onclick="javascript:window.location.href='<%=request.getContextPath()%>/post/postAction!shenghe?postid=${ bean.postid}&shenghe=1'" />

								<input type="button" value="不通过"
									onclick="javascript:window.location.href='<%=request.getContextPath()%>/post/postAction!shenghe?postid=${ bean.postid}&shenghe=2'" />

							</s:if>
							<s:if test="#bean.nstatus==1">
								无权操作
							</s:if>
							<s:if test="#bean.nstatus==2">
								无权操作
							</s:if>

						</td>

					</tr>
				</s:iterator>


			</table>
		</s:form>



	</body>
</html>
