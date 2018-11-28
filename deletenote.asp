<!--#include file="conn.asp" -->
<%
id=request.QueryString("id")
no=request.QueryString("no")
strsql="delete from [note] where noteid=" & id  & " or root=" & id
conn.execute strsql
rs.open "select * from [note] where root=0",conn,1
rs.pagesize=5
if cint(no)>rs.pagecount then
	no=rs.pagecount
end if
response.Redirect("note.asp?no=" & no)
%>