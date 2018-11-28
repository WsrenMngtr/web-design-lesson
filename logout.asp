<%
session.Abandon()
response.Cookies("autologin")("username") = ""
response.Redirect("login.asp")
%>