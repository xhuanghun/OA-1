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



	<body>


		<a href="post/postAction!postlist">全部公告</a>

		<a href="post/postAction!postlistread">已读公告</a>
		<s:form theme="simple">
			<table border="1">
				<tr bgcolor="#3399FF">
					<td colspan="8" align="center" background="main/images/tab_05.gif">
						未读公告
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
						附件信息
					</td>
					<td width="100">
						操作
					</td>
				</tr>
				<s:iterator value="#attr.postlist" var="bean">
					<tr>
						<td>
							<s:property value="#bean.stitle" />
						</td>
						<td>

							<DIV
								STYLE="width: 200px; height: 20px; overflow: hidden; text-overflow: ellipsis">
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


							<s:if test="#bean.nisfile==0">
								无附件
							</s:if>
							<s:if test="#bean.nisfile==1">
								有附件
							</s:if>

						</td>
						<td>
							<s:hidden name="postid1" value="%{#bean.postid}" />
							<input type="button" value="查看"
								onclick="javascript:window.location.href='<%=request.getContextPath()%>/post/postAction!lookpost?postid=${ bean.postid}'" />

						</td>

					</tr>
				</s:iterator>



			</table>
		</s:form>



	</body>
</html>
