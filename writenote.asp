<!--#include file="conn.asp" -->
<%
c=request.Form("contents")
u=session("loginUser")
ip=request.ServerVariables("REMOTE_ADDR")
root=request.QueryString("root")
no=request.QueryString("no")
if root="" then
	root=0
end if
'strsql="insert into [note] (username,notetime,ip,content,root) values('" & u & "','" & now() & "','" & ip & "','" & c & "',0)"
'db.execute strsql
rs.open "select * from [note]",conn,1,3
rs.addnew
rs("username")=u
rs("notetime")=now()
rs("ip")=ip
rs("content")=c
rs("root")=root
rs.update
rs.close
if root=0 then
	rs.open "select * from [note] where root=0",conn,1
	rs.pagesize=5
	response.Redirect("note.asp?no=" & rs.pagecount)
else
	response.Redirect("note.asp?no=" & no)
end if
%>