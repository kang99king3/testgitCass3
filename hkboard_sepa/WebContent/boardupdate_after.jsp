<%@page import="com.hk.dtos.HkDto"%>
<%@page import="com.hk.daos.HkDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
<%
	String sseq=request.getParameter("seq");//수정할 글의 seq
	int seq=Integer.parseInt(sseq);
	
	String title=request.getParameter("title");//수정할 글의 제목
	String content=request.getParameter("content");//수정할 글의 내용
	
	HkDao dao=new HkDao();
	boolean isS=dao.updateBoard(new HkDto(seq,null,title,content,null));
	
	if(isS){
		%>
		<script type="text/javascript">
			alert("수정성공!!");
			location.href="boarddetail.jsp?seq=<%=seq%>";
		</script>
		<%
	}else{
		%>
		<script type="text/javascript">
			alert("수정실패!!");
			location.href="boardupdate.jsp?seq=<%=seq%>";
		</script>
		<%
	}
	
%>
</body>
</html>












