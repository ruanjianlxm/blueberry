<!--#include file="inc/AspCms_SettingClass.asp" -->
<%
dim action
action=getForm("action","both")
if action="up" then
	dim sql,ynadd

	sql="ALTER TABLE aspcms_links ADD column linkgroup Int"
	conn.Exec sql,"exe"
	
	alertMsgAndGo "升级成功，请删除本升级文件","index.asp"	
end if

%>
<form action="?action=up" method="post"><input name="" type="submit" value="开始升级数据库"/></form>