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

		<title>My JSP 'postlist.jsp' starting page</title>

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
  function test(postid){
  window.location.href="<%=request.getContextPath()%>/post/postAction!deletePost?postid="+postid;
  

  
  } 
   function sAlert(str){
   
            var msgw,msgh,bordercolor;
            msgw=400;//提示窗口的宽度
            msgh=100;//提示窗口的高度
            bordercolor="#336699";//提示窗口的边框颜色
            titlecolor="#99CCFF";//提示窗口的标题颜色
            
            var sWidth,sHeight;
            sWidth=document.body.offsetWidth;
            sHeight=document.body.offsetHeight;
            
 
            var bgObj=document.createElement("div");
            bgObj.setAttribute('id','bgDiv');
            bgObj.style.position="absolute";
            bgObj.style.top="0";
            bgObj.style.background="#777";
            bgObj.style.filter="progid:DXImageTransform.Microsoft.Alpha(style=3,opacity=25,finishOpacity=75";
            bgObj.style.opacity="0.6";
            bgObj.style.left="0";
            bgObj.style.width=sWidth + "px";
            bgObj.style.height=sHeight + "px";
            document.body.appendChild(bgObj);
            var msgObj=document.createElement("div")
            msgObj.setAttribute("id","msgDiv");
            msgObj.setAttribute("align","center");
            msgObj.style.position="absolute";
            msgObj.style.background="white";
            msgObj.style.font="12px/1.6em Verdana, Geneva, Arial, Helvetica, sans-serif";
            msgObj.style.border="1px solid " + bordercolor;
            msgObj.style.width=msgw + "px";
            msgObj.style.height=msgh + "px";
          msgObj.style.top=(document.documentElement.scrollTop + (sHeight-msgh)/2) + "px";
          msgObj.style.left=(sWidth-msgw)/2 + "px";
          var title=document.createElement("h4");
          title.setAttribute("id","msgTitle");
          title.setAttribute("align","right");
          title.style.margin="0";
          title.style.padding="3px";
          title.style.background=bordercolor;
          title.style.filter="progid:DXImageTransform.Microsoft.Alpha(startX=20, startY=20, finishX=100, finishY=100,style=1,opacity=75,finishOpacity=100);";
          title.style.opacity="0.75";
          title.style.border="1px solid " + bordercolor;
          title.style.height="18px";
          title.style.font="12px Verdana, Geneva, Arial, Helvetica, sans-serif";
          title.style.color="white";
          title.style.cursor="pointer";
          title.innerHTML="关闭";
          title.onclick=function(){
            document.body.removeChild(bgObj);
        document.getElementById("msgDiv").removeChild(title);
        document.body.removeChild(msgObj);
        }
          document.body.appendChild(msgObj);
          document.getElementById("msgDiv").appendChild(title);
          var txt=document.createElement("p");
          txt.style.margin="1em 0"
          txt.setAttribute("id","msgTxt");
          txt.innerHTML= "<font size='4' color='red'>确定删除吗？</font><br><br><input type='button' value='确定'onclick='test("+str+")'/>";
      document.getElementById("msgDiv").appendChild(txt);
      }

  
  </script>
	<body>


		<s:form action="postAction!postmanage" namespace="/post" name="form1"
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
		<div align="right" style="width: 920">
			<input type="button" value="发布公告"
				onclick="javascript:window.location.href='<%=request.getContextPath()%>/jsp/post/addpost.jsp'" />
		</div>
		<s:form theme="simple">
			<table border="1" >
				<tr bgcolor="#3399FF">
					<td colspan="7" align="center" background="main/images/tab_05.gif">
						公告管理
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
							<s:if test="#bean.nstatus==0">
								<input type="button" value="修改"
									onclick="javascript:window.location.href='<%=request.getContextPath()%>/post/postAction!updatebefore?postid=${ bean.postid}'" />
								<input type="button" value="删除" onclick="sAlert(${bean.postid})">
							</s:if>
							<s:if test="#bean.nstatus==1">
								<input type="button" value="删除" onclick="sAlert(${bean.postid})">
							</s:if>
							<s:if test="#bean.nstatus==2">
								<input type="button" value="删除" onclick="sAlert(${bean.postid})">
							</s:if>

						</td>

					</tr>
				</s:iterator>




			</table>
		</s:form>




	</body>
</html>
