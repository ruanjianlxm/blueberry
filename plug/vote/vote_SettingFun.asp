<!--#include file="../../inc/AspCms_SettingClass.asp" -->
<%
dim action : action=getForm("action","get")
Select case action
	case "save" : savepaySetting
End Select

Sub savepaySetting	
	dim templateobj,configStr,configPath
	configPath="vote_config.asp"
	set templateobj=new TemplateClass
	configStr=loadFile(configPath)
	
	configStr=templateobj.regExpReplace(configStr,"Const votetitle=""(\S*?)""","Const votetitle="""&getForm("votetitle","post")&"""")	
	configStr=templateobj.regExpReplace(configStr,"Const votename=""(\S*?)""","Const votename="""&getForm("votename","post")&"""")	
	configStr=templateobj.regExpReplace(configStr,"Const votenum=""(\S*?)""","Const votenum="""&getForm("votenum","post")&"""")
	configStr=templateobj.regExpReplace(configStr,"Const votetype=""(\S*?)""","Const votetype="""&getForm("votetype","post")&"""")
	

	createTextFile configStr,configPath,""
	set templateobj=nothing
	alertMsgAndGo "ÉèÖÃ³É¹¦",getPageName()
End Sub

%>