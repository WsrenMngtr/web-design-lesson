<%
username = request.Form("username")
password = request.Form("psd")
phone = request.Form("phone")
Set conn = server.CreateObject("ADODB.Connection")
conn.open "Driver={Mincrosoft Access Driver (*.mdb)};Dbq=" & Server.MapPath("data/user.mdb")
sqlscp = "SELECT * FROM userinfo WHERE username='" & username & "'"
Set rs = server.CreateObject("ADOBD.RecordSet")
rs.open sqlscp, conn, 1
if rs.recordcount > 0 then
	response.Write "<script>alert('username has used!'); hisory.go(-1); </script>"
end

%>