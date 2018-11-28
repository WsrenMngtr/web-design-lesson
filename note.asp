<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD >
<TITLE>给我留言</TITLE>
<META content="text/html; charset=GB2312" http-equiv=Content-Type>
<LINK rel=stylesheet type=text/css href="style/index.css">
</HEAD>
<BODY>
<script language="javascript">
	function deletenote(id, no) {
		if(confirm('你真的要删除吗？'))
			window.location.href = "deletenote.asp?id=" + id + "&no=" + no;
	}
	function note() {
		if(document.getElementById('contents').value == '') {
			alert('留言内容不能为空!');
			return;
		}
		document.forms[0].submit();
	}
	function goto() {
		if(window.event.keyCode == 13) {
			var no=document.getElementById('pageno').value;
			if(isNaN(no)) {
				alert('请输入数字!');
				document.getElementById('pageno').value = '';
				return;
			}
			window.location.href = "note.asp?no=" + no;
		}
	}
</script>
<script language="javascript">
	function exit() {
		if(confirm('您真的要退出吗？')) {
			window.location.href = "logout.asp";
		}
		
	}
</script>
<%
if session("loginUser") = "" then
	response.Redirect("login.asp?errinfo=会话超时，请重新登录!")
end if
%>
<!--#include file="conn.asp" -->
<DIV id=page>
    <DIV id=header>
        <DIV id=headerimg>
        <H1>留言版</H1>
        <DIV class=description>My Personal WebSite</DIV>
        </DIV>
    </DIV>
	<DIV id=navigation>
        <UL>
          <LI><A href="index.asp">Home</A> </LI>
          <LI><A href="#">我的好友</A></LI> 
          <LI><A href="#"  onClick="window.open('vote.htm','','width=600,height=600')" >我的投票</A> </LI>
          <LI><A href="note.asp"  target=_self>给我留言</A> </LI>
          <LI></LI>
          <LI><A href="#">我的收藏</A> </LI>
          <A href="#" onClick="window.open('edituser.asp','','width=600,height=600')" ><%=session("loginUser")%></A>
		  <LI><a href="#">修改密码</a></LI>
          <LI><A href="#" onClick="exit();">退出</A> </LI>          
        </UL>        
	</DIV>
	<HR>
    <DIV id=content class=widecolumn>
        <H2>留言版</H2>
	<%
		rs.open "SELECT * FROM [note] WHERE root=0 order by noteid", conn, 1
		if rs.recordcount = 0 then
	%>
        <DIV class="postmetadata alt">
        	还没有留言     
			<hr  style='display:block'>
        </DIV> 
     <%
	 else
	 	rs.pagesize = 5
		no = request.QueryString("no")
		if no = "" then
			no = 1
		else
			if isnumeric(no) then
				no = cint(no)
				if no <= 0 or no > rs.pagecount then
					no = 1
				end if
			else
				no = 1
			end if
		end if
		rs.absolutepage = no
	 	do until rs.eof or i = rs.pagesize
			i = i + 1
			response.write (no - 1) * rs.pagesize + i & "楼#<a href=# onclick=window.open('viewuser.asp?username=" & rs("username") & "','','width=600,height=500')>" & rs("username") & "</a>|" & rs("ip") & "|" & rs("notetime") 
			response.write "【<a href='note.asp?no=" & no & "&root=" & rs("noteid") & "&i=" & (no - 1) * rs.pagesize + i & "'>回复</a>】"
			if session("loginUser")="admin" or session("loginUser") = rs("username") then
				response.write "【<a href=# onclick='deletenote(" & rs("noteid") & "," & no & ");'>删除</a>】"			
			end if
			response.write "<br>"
			response.write rs("content")
			Set rs1=server.CreateObject("ADODB.RecordSet")
			rs1.open "select * from [note] where root=" & rs("noteid"),conn,1
			do until rs1.eof
				response.write "<br>"
				response.write "【回复】<a href=# onclick=window.open('viewuser.asp?username=" & rs("username") & "','','width=600,height=500')>" & rs1("username") & "</a>|" & rs1("ip") & "|" & rs1("notetime") 
			if session("loginUser")="admin" or session("loginUser") = rs1("username") then
				response.write "【<a href=# onclick='deletenote(" & rs1("noteid") & "," & no & ");'>删除</a>】"			
			end if
				response.write  "<br>"
				response.write rs1("content")	
				rs1.movenext		
			loop
			response.Write "<hr  style='display:block'>"
			rs.movenext
	 	loop 
	 end if	 
	 %>
      <center>
      页码：
      <%
	  if no <> 1 then
	  		response.write "<a href=note.asp?no=1>" & "|<" & "</a>&nbsp;"
	  		response.write "<a href=note.asp?no=" & no - 1 & ">" & "<<" & "</a>&nbsp;"
	  end if
	  for i = 1 to rs.pagecount
	  	if i = no then
			response.write i & "&nbsp;"
		else
	  		response.write "<a href=note.asp?no=" & i & ">" & i & "</a>&nbsp;"
		end if
	  next 
	  if no <> rs.pagecount then
	  		
	  		response.write "<a href=note.asp?no=" & no + 1 & ">" & ">>" & "</a>&nbsp;"
			response.write "<a href=note.asp?no=" & rs.pagecount & ">" & ">|" & "</a>&nbsp;"
	  end if
	  %>
      <input name="pageno" type="text" id="pageno" size="1"  onKeyPress="goto()">页
      <%
	  root = request.QueryString("root")
	  i = request.QueryString("i")
	  if root <> "" then
	  %>
      <br><label >【回复<%=i%>楼】</label>
      <%
	  end if
	  %>
      <form name="form1" id="form1" method="post" action="writenote.asp?no=<%=no%>&root=<%=root%>">
        <textarea name="contents" id="contents" cols="45" rows="5" style="text-align:
        left; font-family:'微软雅黑'"></textarea>
        <br>
        <input type="button" name="button" id="button" value="留言" onClick="note();" style="font-family:'微软雅黑'">
        <input type="reset" name="button2" id="button2" value="清除" style="font-family:'微软雅黑'">
      </form>
      </center>
    </DIV>

	<HR>
    <DIV id=footer>
    <P>Copyright&copy; 2014 My.Website<BR><a href="mailto:webmaster@xyz.com.cn">Contact Me:Administrator</A> 
    </P>
    </DIV>
</DIV>
</BODY>
</HTML>
