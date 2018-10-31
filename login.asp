<!--#include file="conn.asp"-->
<%
username = request.Form("username")
password = request.Form("password")
sqlscp = "SELECT * FROM userinfo WHERE username='" & username & "';"
Set rs = server.CreateObject("ADODB.RecordSet")
rs.open sqlscp, conn, 1, 3
if rs.recordcount = 0 then
	response.Redirect("login.asp?errinfo=UsernameOrPasswordWrong")
else
	if password = rs("password") then
		response.Write "WELCOME"
	else
		response.Redirect("login.asp?errinfo=UsernameOrPasswordWrong")
	end if
end if

%>