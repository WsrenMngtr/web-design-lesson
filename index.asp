<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD >
<TITLE>�ҵ���ҳ</TITLE>
<META content="text/html; charset=gb2312" http-equiv=Content-Type>
<LINK rel=stylesheet type=text/css href="style/index.css">
</HEAD>

<BODY>
<%
if session("username") = "" then
	response.Redirect("login.asp")
end if

%>
<script language="javascript">
	function exit() {
		if (confirm("really?")) {
			window.location.href = "logout.asp";	
		}	
	}
</script>
<DIV id=page>
    <DIV id=header>
        <DIV id=headerimg>
        <H1>�ҵ���ҳ</H1>
        <DIV class=description>My Personal WebSite</DIV>
        </DIV>
    </DIV>
	<DIV id=navigation>
        <UL>
          <LI><A href="index.asp">Home</A> </LI>
          <LI><A href="#">�ҵĺ���</A></LI> 
          <LI><A href="#" >�ҵ�ͶƱ</A> </LI>
          <LI><A href="note.asp" target=_self>��������</A> </LI>
          <LI></LI>
          <LI><A href="#">�ҵ��ղ�</A> </LI>
          <A href="#" onClick="window.open('edituser.asp', '', 'width=300, heigh=400')" ><% response.Write session("username") %></A>
		  <LI><a href="#">�޸�����</a></LI>
          <LI><A href="#" onClick="exit();" >�˳�</A> </LI>          
        </UL>        
	</DIV>
    
	<HR>
    <DIV id=content class=widecolumn>
        <marquee><H2>����IP��ַ��:10.16.23.2</H2></marquee>
        <DIV class="postmetadata alt">
            <P>���Ǳ���վ�ĵ�1000λ�����û�!</P>
            <p>��ǰ����������99</p>
            <p>&nbsp;</p>
        </DIV>
    </DIV>

	<HR>
    <DIV id=footer>
    <P>Copyright&copy; 2018 My.Website<BR><a href="mailto:webmaster@xyz.com.cn">Contact Me:Administrator</A> 
    </P>
    </DIV>
</DIV>
</BODY>
</HTML>
