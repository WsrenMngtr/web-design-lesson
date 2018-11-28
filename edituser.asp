<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD >
<TITLE>编辑用户</TITLE>
<META content="text/html; charset=GB2312" http-equiv=Content-Type>

<style type="text/css">
#content {
	FONT-SIZE: 1.2em
}
.alt {
	BORDER-BOTTOM: #ddd 1px solid; BACKGROUND-COLOR: #f8f8f8; BORDER-TOP: #ddd 1px solid
}
.btn {
	font-size: 20px;
	color: #FFF;
	background-color: #333;
	width: 100px;
	border: 1px solid #333;
	cursor: pointer;
	height: 30px;
	font-family: "微软雅黑";
	border-radius:2px;
}
.btn:hover{
	color: #333;
	background-color: #FFF;
	}
.btn:active{
	color: #333;
	background-color:#C30;
	}
.inpt-line {
	height: 30px;
	width: 200px;
	border: 1px solid #333;
	border-radius:2px;
	font-size: 24px;
	line-height: 30px;
	border-radius:2px;
}
.inpt-textarea {
	width: 200px;
	border: 1px solid #333;
	border-radius:2px;
	font-size: 24px;
	line-height: 30px;
	border-radius:2px;
}
</style>
<script language="javascript">
function isEmail(id) {
	var reg = /^\w+@\w+.\w+$/;
	return reg.test(document.getElementById(id).value);
}
function checkEmail() {
	if (!isEmail("email")) {
		alert("email not format");
		document.getElementById(id).value = "";
	}
}
</script>
</head>
<body>
<!--#include file="conn.asp"-->
<%
if session("username") = "" then
	response.Write "<script>window.location.herf='login.asp?errinfo=sessionLate';window.close();</script>"
end if 
strsql = "SELECT * FROM userinfo WHERE username='" & session("username") & "'"
Set rs = server.CreateObject("ADODB.RecordSet")
rs.open strsql, conn, 1
%>
<DIV id=content>
        <H2><center>用户信息</center></H2>
        <DIV class="alt">
          <form name="form1" method="post" action="modifyuser.asp">
            <table width="80%" border="0">
              <tr>
                <td width="30%" align="left">用户ID：</td>
                <td align="left"><%response.Write rs(0)%></td>
              </tr>
              <tr>
                <td align="left">真实姓名：</td>
                <td align="left"><input name="realname"  type="text" class="inpt-line"id="realname" value="<%response.Write rs("realname")%>" size="16"></td>
              </tr>
              <tr>
                <td align="left">性别：</td>
                <td align="left"><select name="sex" class="inpt-line" id="sex">
     <option value="男" <% if rs("sex")="男" then response.Write "selected" %>>男</option>
     <option value="女" <% if rs("sex")="女" then response.Write "selected" %>>女</option>
                </select></td>
              </tr>
              <tr>
                <td align="left">所在城市：</td>
                <td align="left"><input name="city"  type="text" class="inpt-line" id="city" value="<%response.Write rs("city")%>" size="16"></td>
              </tr>
              <tr>
                <td align="left">电话：</td>
                <td align="left"><input name="phone" type="text" class="inpt-line" id="phone" value="<%response.Write rs("phone")%>" size="16"></td>
              </tr>
              <tr>
                <td align="left">电子邮件：</td>
                <td align="left"><input name="email" type="text" class="inpt-line" id="email" value="<%response.Write rs("email")%>" size="38" onBlur="checkEmail();"></td>
              </tr>
              <tr>
                <td align="left">个性签名：</td>
                <td align="left"><textarea name="memo"  cols="40" rows="5" class="inpt-textarea" id="memo"><%response.Write rs("memo")%></textarea></td>
              </tr>
            </table>
            <center>
              <p><input name="button" type="submit" class="btn" id="button" style="font-family:'微软雅黑'" value="保存">&nbsp;
              <input name="button2" type="button" class="btn" id="button2" style="font-family:'微软雅黑'" onClick="window.close();" value="取消">
            </p></center>
          </form>
        </DIV>
</DIV>
</body>
</html>
