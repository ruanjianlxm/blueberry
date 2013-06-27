<!--#include file="vote_SettingFun.asp" -->
<!--#include file="vote_config.asp" -->
<%
dim votenames,votenums,i
votenames=split(votename,"|")
echo "document.write(""<form action=\""/plug/vote/vote.asp\"" method=\""post\"" target=\""_blank\"">"");"
echo "document.write(""<table width=\""100%\"" border=\""0\"">"");"
echo "document.write(""<tr>"");"
echo "document.write(""<td>"& votetitle &"</td>"");"
echo "document.write(""</tr>"");"
for i=0 to ubound(votenames)
	echo "document.write(""<tr>"");"
	if votetype=0 then
	echo "document.write(""<td><input name=\""selectid\"" type=\""radio\"" value=\"""& i &"\"" />"& votenames(i) &"</td>"");"
	else
	echo "document.write(""<td><input name=\""selectid\"" type=\""checkbox\"" value=\"""& i &"\"" />"& votenames(i) &"</td>"");"
	end if
	echo "document.write(""</tr>"");"
next
echo "document.write(""<tr>"");"
echo "document.write(""<td><input name=\""submit\"" type=\""submit\"" value=\""提交\""/>&nbsp;<input name=\""res\"" type=\""button\"" value=\""查看\"" onclick=\""location.href='/plug/vote/r.asp'\""/></td>"");"
echo "document.write(""</tr>"");"
echo "document.write(""</table>"");"

echo "document.write(""</form>"");"
%>

