<!--#include file="conn.asp"-->
<%
username = request.Form("username")
password = request.Form("password")
autologin = request.Form("autologin")

if autologin <> "" then
	response.Cookies("autologin")("username") = username
	response.Cookies("autologin")("password") = password
end if

sqlscp = "SELECT * FROM userinfo WHERE username='" & username & "';"
Set rs = server.CreateObject("ADODB.RecordSet")
rs.open sqlscp, conn, 1, 3 
if rs.recordcount = 0 then
	response.Redirect("login.asp?errinfo=UsernameOrPasswordWrong")
else
	if password = rs("password") then
		session("username") = username
		response.Redirect("index.asp")
	else
		response.Redirect("login.asp?errinfo=UsernameOrPasswordWrong")
	end if
end if

%>