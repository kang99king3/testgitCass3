<%@page import="com.hk.daos.HkDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글삭제하기</title>
</head>
<body>
<%
	String sseq=request.getParameter("seq");
	int seq=Integer.parseInt(sseq);
	
	HkDao dao=new HkDao();
	boolean isS=dao.delBoard(seq);
	
	if(isS){
		%>
		<script type="text/javascript">
			alert('게시글 삭제 성공!!');
			location.href="boardlist.jsp";
		</script>
		<%
	}else{
		%>
		<script type="text/javascript">
			alert('게시글 삭제 실패!!');
			location.href="boarddetail.jsp?seq=<%=seq%>";
		</script>
		<%
	}
%>
</body>
</html>







