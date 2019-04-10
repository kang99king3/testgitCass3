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
	//form ===> id=hk&title=제목&content=내용 
	String id=request.getParameter("id");
	String title=request.getParameter("title");
	String content=request.getParameter("content");
	
	HkDao dao=new HkDao();
// 	HkDto dto=new HkDto();
// 	dto.setId(id);
// 	dto.setTitle(title);
// 	dto.setContent(content);
	
	boolean isS=dao.insertBoard(new HkDto(id,title,content));
	
	if(isS){
		%>
		<script type="text/javascript">
			alert("새로운 글을 등록합니다.");
			location.href="boardlist.jsp";
		</script>
		<%
// 		response.sendRedirect("boardlist.jsp"); 
	}else{
		%>
		<script type="text/javascript">
			alert("글등록실패입니다. ㅜㅜ");
			location.href="boardinsert.jsp";
		</script>
		<%
	}
%>

</body>
</html>







