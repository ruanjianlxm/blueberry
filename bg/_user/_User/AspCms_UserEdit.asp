<!--#include file="AspCms_UserGroupFun.asp" -->
<%CheckAdmin("AspCms_UserList.asp")%>
<%getUser%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD><TITLE></TITLE>
<META http-equiv=Content-Type content="text/html; charset=gbk">
<LINK href="../../images/style.css" type=text/css rel=stylesheet>
</HEAD>
<BODY>
<FORM name="form" action="?action=edit" method="post" >
<DIV class=formzone>
<DIV class=namezone>�û���Ϣ</DIV>
<DIV class=tablezone>
<DIV class=noticediv id=notice></DIV>
<TABLE cellSpacing=0 cellPadding=2 width="100%" align=center border=0>
  <TBODY>
  <TR>
    <TD align=middle width=100 height=30>�û���</TD>
    <TD height=30><%=userGroupSelect("GroupID",GroupID,"0 and GroupID<>2")%> <FONT color=#ff0000>*</FONT></TD>
  </TR>
  <TR>
    <TD align=middle width=100 height=30>�û�����</TD>
    <TD height=30><%=LoginName%><INPUT class="input" type="hidden" maxLength="200" name="LoginName" value="<%=LoginName%>"/> </TD>
  </TR>
  <TR>
    <TD align=middle width=100 height=30>�û�����</TD>
    <TD height=30><INPUT  type="Password" class="input" style="FONT-SIZE: 12px; WIDTH: 300px" maxLength="200" name="Password"/> ���޸���������д  </TD>
  </TR>
  <TR>
    <TD align=middle width=100 height=30>״̬</TD>
    <TD height=30><INPUT class="checkbox" type="checkbox" name="UserStatus" checked="checked" value="1"/></TD></TR></TBODY></TABLE>
</DIV>
<DIV class=adminsubmit><INPUT class="button" type="submit" value="����" />  
<INPUT class="button" type="button" value="����" onClick="history.go(-1)"/> 
</DIV>
</DIV>
</FORM>
</BODY>
</HTML>