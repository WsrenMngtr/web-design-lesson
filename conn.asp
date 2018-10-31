<%
Set conn = server.CreateObject("ADODB.Connection")
conn.open "Driver={Microsoft Access Driver (*.mdb)};Dbq=" & Server.MapPath("data/user.mdb")
%>