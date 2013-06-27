<!--#include file="../../inc/AspCms_SettingClass.asp" -->
<%
dim action : action=getForm("action","get")

Select case action	
	case "del" : DelSpec
	case "add" : AddSpec
	case "edit" : EditSpec
	case "editsave" : EditSpecSave
	case "save" :SaveSpec	
	case "order" :updateOrder	
End Select

Dim SpecID, SpecName, SpecOrder, SpecField	
Dim SpecOptions,SpecDiversification,SpecControlType,SpecCategory,SpecNotNull

Sub EditSpec
	dim sql,rsObj
	sql = "select * from {prefix}SpecSet where SpecID="&CInt(getForm("ID","get"))
	Set rsObj=conn.Exec(sql,"r1")	
	if rsObj.eof then exit sub
	SpecID = rsObj("SpecID")
	SpecName = rsObj("SpecName")
	SpecField = rsObj("SpecField")

	SpecCategory = rsObj("SpecCategory")

	rsObj.close	:Set rsObj = nothing
	
End Sub

Sub EditSpecSave
	dim sql,rsObj
	SpecField=getForm("SpecField","post")
	SpecName=getForm("SpecName","post")
	SpecCategory=getForm("SpecCategory","post")
	SpecID =getForm("SpecID","post")
	sql = "select * from {prefix}SpecSet where SpecID="&SpecID
	Set rsObj=conn.Exec(sql,"r1")	
	
	
	sql = "Alter table aspcms_content drop Column "&rsObj("SpecCategory")&"_"&rsObj("SpecField") &""
	conn.Exec sql,"exe"	
	sql="ALTER TABLE aspcms_Content ADD column "& SpecCategory&"_"& SpecField &" text"
	conn.Exec sql,"exe"
	sql = "update {prefix}SpecSet set SpecName='"&SpecName&"',SpecField='"&SpecField&"',SpecCategory='"&SpecCategory&"' where SpecID="&SpecID
	conn.Exec sql,"exe"	
	alertMsgAndGo "修改成功","AspCms_Spec.asp"
End Sub

Sub AddSpec 
Dim rsObj,sql,tmpCount,i,fName

SpecField=getForm("SpecField","post")
SpecOptions=getForm("SpecOptions","post")
SpecDiversification=getForm("SpecDiversification","post")
SpecControlType=getForm("SpecControlType","post")
SpecName=getForm("SpecName","post")
SpecCategory=getForm("SpecCategory","post")
SpecOrder=getForm("SpecOrder","post")
SpecNotNull=getForm("SpecNotNull","post")



if SpecNotNull = "on" then
SpecNotNull = true
else
SpecNotNull = false
end if

SpecOptions = encode(SpecOptions)

fName = SpecCategory & "_" & SpecField

if isnul(SpecDiversification) then SpecDiversification = 0


 
	if isnul(SpecName) then alertMsgAndGo "参数名称不能为空，请修改","-1"
	if isnul(SpecField) then alertMsgAndGo "字段名称不能为空，请修改","-1"
	
	sql = "select count(*) from {prefix}SpecSet where SpecField='"&SpecField&"'"
	Set rsObj=conn.Exec(sql,"r1")
	tmpCount = rsObj(0)
	rsObj.close	:Set rsObj = nothing
	
	 
	
	sql = "select count(*) from {prefix}content"
	Set rsObj=conn.Exec(sql,"r1")
	for i=0 to rsObj.Fields.Count-1
		if rsObj.Fields(i).Name = fName then
			tmpCount = tmpCount + 1
		end if
	next
	rsObj.close	:Set rsObj = nothing
	
	if tmpCount > 0 then alertMsgAndGo "字段名称已存在，请修改","-1"
	
'0 文本,1 数字,2 编辑器,3 附件,4 日期,5 颜色,6 单选,7 多选
Select Case CInt(SpecControlType)
	Case 2
	sql = "ALTER TABLE {prefix}Content ADD column "&fName&" memo"
	Case Else
	sql = "ALTER TABLE {prefix}Content ADD column "&fName&" Text(255)"

End Select
	conn.Exec sql,"exe"	
	if Err then alertMsgAndGo "添加字段失败,请联系管理员","-1"
	
	sql = "insert into {prefix}SpecSet(SpecName,SpecField,SpecOrder,SpecControlType,SpecCategory,SpecOptions,SpecNotNull,SpecDiversification) values('"&SpecName&"','"&SpecField&"',"&SpecOrder&",'"&SpecControlType&"','"&SpecCategory&"','"&SpecOptions&"',"&SpecNotNull&","&SpecDiversification&")"
	conn.Exec sql,"exe"		
	
	alertMsgAndGo "添加成功","AspCms_Spec.asp"
End Sub	

Sub specList
dim SpecID, SpecName, SpecOrder, SpecField	
dim sql, msg

	Dim rsObj	:	Set rsObj=conn.Exec("select SpecID,SpecName,SpecField,SpecOrder,SpecCategory from {prefix}SpecSet Order by SpecOrder Asc,SpecID","r1")
	If rsObj.Eof Then 
		echo"<tr bgcolor=""#FFFFFF"" align=""center"">"
		echo "<td colspan=""5"">没有数据</td>"
		echo "</tr>"
	Else
		Do while not rsObj.Eof 
		 echo "<tr bgcolor=""#FFFFFF"" align=""center"">"
		 echo "<td height=""28"">"
		 echo "<input type=""checkbox"" name=""id"" value="""&rsObj("SpecID")&""" class=""checkbox"" onclick='silbingCheck(this)' />"
		 echo "<input type=""checkbox"" name=""SpecField"" value=""'"&rsObj("SpecCategory")&"_"&rsObj("SpecField")&"'"" style=""display:none"" />"
		 echo "<input type=""hidden"" name=""SpecIDs"" value="""&rsObj("SpecID")&""" />"
		 echo "<input type=""hidden"" name=""SpecCategory"" value="""&rsObj("SpecCategory")&""" />"
		 
		 echo "</td>"
		 echo "<td>"&rsObj("SpecID")&"</td>"
		 echo "<td>"&rsObj("SpecName")&"</td>"
		 if  rsObj("SpecCategory") <> "" then
		 echo "<td>"&rsObj("SpecCategory")&"_"&rsObj("SpecField")&"</td>" 
		 else
		 echo "<td>"&rsObj("SpecField")&"</td>" 
		 end if
		 echo "<td><input class=""input"" style=""width:30px"" name=""SpecOrders"" value="""&rsObj("SpecOrder")&"""/></td>"
		 echo "<td> <a href=""AspCms_SpecEdit.asp?action=update&id="&rsObj("SpecID")&"""  onClick=""return confirm('字段修改必须删除原有字段进行重建，该字段数据将丢失，确认进入修改吗？')"">修改</a> | <a href=""?action=del&id="&rsObj("SpecID")&"&SpecField="&rsObj("SpecCategory")&"_"&rsObj("SpecField")&"""  onClick=""return confirm('确定要删除吗')"">删除</a></td>"
		 echo "</tr>"
		  rsObj.MoveNext
		Loop
	End If
	rsObj.close : Set rsObj = nothing
End Sub

Sub DelSpec 

dim m_SpecField
Dim sql,tmp
	dim ID 	:	ID = getForm("id","both")
	SpecField=getForm("SpecField","both")	
	SpecCategory=getForm("SpecCategory","both")
	
	
	m_SpecField=replace(SpecField,"&apos;","")
	 
	SpecField = replace(SpecField,"&apos;","")
	'die m_SpecField
	tmp = m_SpecField
	
	if m_SpecField="P_Price" then alertMsgAndGo "该参数在订购中固定使用，不可删除","AspCms_Spec.asp"	
	if SpecCategory <> "" then tmp = SpecCategory & "_" & m_SpecField
	sql = "ALTER TABLE {prefix}Content drop column "&m_SpecField
	'die sql
	conn.Exec sql,"exe"
	
	if instr(m_SpecField,"'")=0 then m_SpecField = "'"&m_SpecField&"'"
	sql = "Delete from {prefix}SpecSet where SpecID in ("&ID&")"
	'echo sql & "<br>"
	conn.Exec sql,"exe"
	alertMsgAndGo "删除成功","AspCms_Spec.asp"	
	
	if Err then echo err.description 'alertMsgAndGo "删除字段失败,请联系管理员","-1"
	
End Sub 

Sub updateOrder
dim sql, msg
	Dim ids				:	ids=split(getForm("SpecIDs","post"),",")
	Dim orders		:	orders=split(getForm("SpecOrders","post"),",")
	If Ubound(ids)=-1 Then 	'防止有值为空时下标越界
		ReDim ids(0)
		ids(0)=""
	End If	
	
	If Ubound(orders)=-1 Then
		ReDim orders(0)
		orders(0)=0
	End If
	Dim i
	
	For i=0 To Ubound(ids)		
		if isnum(trim(orders(i))) then
			Conn.Exec "update {prefix}SpecSet Set SpecOrder="&trim(orders(i))&" Where SpecID="&trim(ids(i)),"exe"	
		else
			Conn.Exec "update {prefix}SpecSet Set SpecOrder=0 Where SpecID="&trim(ids(i)),"exe"	
		end if
	Next
	
	
	alertMsgAndGo "更新排序成功","AspCms_Spec.asp"
End Sub

%>