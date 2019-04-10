<%@page import="com.hk.dtos.HkDto"%>
<%@page import="com.hk.daos.HkDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글수정하기</title>
</head>
<body>
<%	//파라미터 타입은 모두 String이다~~~
	String sseq=request.getParameter("seq");
	int seq=Integer.parseInt(sseq);
	
	HkDao dao=new HkDao();
	HkDto dto=dao.getBoard(seq);//글 상세정보 구함
	
%>
<h1>게시글 수정하기</h1>
<form action="boardupdate_after.jsp" method="post">
<input type="hidden" name="seq" value="<%=dto.getSeq()%>"/>
<table border="1">
	<tr>
		<th>번 호</th>
		<td><%=dto.getSeq()%></td>
	</tr>
	<tr>
		<th>작성자</th>
		<td><%=dto.getId()%></td>
	</tr>
	<tr>
		<th>작성일</th>
		<td><%=dto.getRegDate()%></td>
	</tr>
	<tr>
		<th>제 목</th>
		<td><input type="text" name="title" value="<%=dto.getTitle()%>"/></td>
	</tr>
	<tr>
		<th>내 용</th>
		<td><textarea rows="10" cols="60" name="content"><%=dto.getContent()%></textarea></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="수정완료"/>
			<button type="button" onclick="boardList()">글목록</button>
		</td>
	</tr>
</table>
</form>
<script type="text/javascript">
	//게시글 목록으로 이동
	function boardList(){
		location.href="boardlist.jsp";
	}
</script>
</body>
</html>











