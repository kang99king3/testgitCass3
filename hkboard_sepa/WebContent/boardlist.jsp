<%@page import="com.hk.dtos.HkDto"%>
<%@page import="java.util.List"%>
<%@page import="com.hk.daos.HkDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글목록보여주기</title>
</head>
<body>
<%
	
	//java코드 실행부 : Dao객체를 생성
	HkDao dao=new HkDao();
	List<HkDto> list=dao.getAllBoard();//DB에서 글목록 정보 가져오기
%>
<h1>글목록보기</h1>
<table border="1">
	<col width="50px"><col width="100px"><col width="300px"><col width="100px">
	<tr>
		<th>번호</th><th>작성자</th><th>제 목</th><th>작성일</th>
	</tr>
	<%
		for(int i=0;i<list.size();i++){
			HkDto dto=list.get(i);
			%>
			<tr>
				<td><%=dto.getSeq()%></td>
				<td><%=dto.getId()%></td>
				<td><a href="boarddetail.jsp?seq=<%=dto.getSeq()%>"><%=dto.getTitle()%></a></td>
				<td><%=dto.getRegDate()%></td>
			</tr>
			<%
		}
	%>
	<tr>
		<td colspan="4">
			<a href="boardinsert.jsp">글쓰기</a>
		</td>
	</tr>
</table>
</body>
</html>













