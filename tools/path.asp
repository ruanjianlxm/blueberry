<!--#include file="inc/AspCms_mainclass.asp" -->
<%
	dim templateobj,configStr,configPath
	configPath="config/AspCms_Config.asp"
	set templateobj=new TemplateClass
	configStr=loadFile(configPath)
	
	configStr=templateobj.regExpReplace(configStr,"Const sitePath=""(\S*?)""","Const sitePath="""&replace(Request.ServerVariables("PATH_INFO"),"/path.asp","")&"""")	

	createTextFile configStr,configPath,""
	set templateobj=nothing
	alertMsgAndGo "配置更新成功",replace(Request.ServerVariables("PATH_INFO"),"/path.asp","")

%>