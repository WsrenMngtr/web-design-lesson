<!--#include file="conn.asp"-->
<%
username = request.Form("username")
password = request.Form("psd")
phone = request.Form("phone")
sqlscp = "SELECT * FROM userinfo WHERE username='" & username & "';"
Set rs = server.CreateObject("ADODB.RecordSet")
rs.open sqlscp, conn, 1, 3
if rs.recordcount > 0 then
	response.Write "<script>alert('username has used!'); hisory.go(-1); </script>"
else
	conn.execute("INSERT INTO userinfo (username, password, phone) VALUES ('" & username & "', '" & password & "', '" & phone & "');")
	response.Write "<script>alert('register well.'); </script>"
end if

%>