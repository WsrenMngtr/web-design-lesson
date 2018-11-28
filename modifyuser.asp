<!--#include file="conn.asp"-->
<%
if session("username") = "" then
	response.Write "<script>window.location.herf='login.asp?errinfo=sessionLate';window.close();</script>"
end if 
realname = request.Form("realname")
sex = request.Form("sex")
city = request.Form("city")
email = request.Form("email")
memo = request.Form("memo")
phone = request.Form("phone")

strsql = "UPDATE userinfo SET realname='" & realname & "', sex='" & sex & "', city='" & city & "', email='" & email & "', memo='" & memo & "', phone='" & phone & "' WHERE username='" & session("username") & " '"
Set rs = server.CreateObject("ADODB.RecordSet")
rs.open strsql, conn, 1, 3

response.Write "<script>alert('update complete'); window.close();</script>"

%>