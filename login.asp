<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>LOGIN</title>


<script type="text/javascript">
function hiddenId(id) {
	document.getElementById(id).style.visibility = "hidden"
}
function visibleId(id) {
	document.getElementById(id).style.visibility = "visible"
}

function loginCommand() {
	if (document.getElementById('username').value == '') {
		visibleId('username-err')	
		return
	} else {
		hiddenId('username-err')
	}
	if (document.getElementById('password').value == '') {
		visibleId('password-err')
		return	
	} else {
		hiddenId('password-err')	
	}
	document.forms[0].submit() // test using
}
</script>
<link href="style/login.css" rel="stylesheet" type="text/css" />
</head>

<body>

<%
	if request.Cookies("autologin")("username") <> "" then
		session("username") = request.Cookies("autologin")("username")
		response.Redirect("index.asp")
	end if
%>

<div id="errorInfo">
<% if request.QueryString("errinfo") <> "" then %>
  <% response.Write request.QueryString("errinfo") %>
<% end if %>
<span id="close" onclick="hiddenId('errorInfo')">x</span></div>
<div id="con">
  <div id="head"></div>
  <div id="mid">
    <div id="login-form">
      <form id="login-form1" name="login-form1" method="post" action="dologin.asp">
        <div class="login-group"><span class="login-title">username:</span>
          <input name="username" type="text" id="username" />
          <span class="login-err" id="username-err">*must</span>
        </div>
        <div class="login-group"><span class="login-title">password:</span>
          <input name="password" type="password" id="password" placeholder="more than 6 word" />
          <span class="login-err" id="password-err">*must</span>
        </div>
        <div class="login-group"><input name="auto-login" type="checkbox" id="autologin" value="" />auto login</div>
        <div class="login-group">
          <input name="login" type="button" class="login-btn" value="login in" onclick="loginCommand()" />
          <input name="register" type="button" class="login-btn" value="register in" />
        </div>
      </form>
    </div>
  </div>
  <div id="foot">awfagrwhjytd$f\\s</div>
</div>
</body>
</html>
