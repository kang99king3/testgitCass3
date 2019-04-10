package com.hk.daos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.hk.dbinfo.DataInfo;
import com.hk.dtos.HkDto;

public class HkDao extends DataInfo{

	public HkDao() {
		
		//jdbc1�ܰ�: ����̹��ε�
//		try {
//			Class.forName("oracle.jdbc.driver.OracleDriver");
//			System.out.println("1�ܰ�:����");
//		} catch (ClassNotFoundException e) {
//			System.out.println("1�ܰ�:����");
//			e.printStackTrace();
//		}
	}
	
	//�۸����ȸ (select�� �ۼ�)
	//list[dto,dto,dto,dto,dto,dto]
	//dto[seq,id,title,content,regDate]
	public List<HkDto> getAllBoard() {
		List<HkDto> list=new ArrayList<>();
		Connection conn=null;
		PreparedStatement psmt=null;
		ResultSet rs=null;
		
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String user="hk2";
		String password="hk2";
		
		String sql=" SELECT SEQ,ID,TITLE,CONTENT,REGDATE "
				+ " FROM HKBOARD ORDER BY REGDATE DESC ";
		
//		StringBuffer sb=new StringBuffer();
//		sb.append(" SELECT SEQ,ID,TITLE,CONTENT,REGDATE ");
//		sb.append(" FROM HKBOARD ORDER BY REGDATE DESC ");
//		sb.toString();
		try {
			conn=DriverManager.getConnection(url, user, password);
			System.out.println("2단계:DB연결성공!!");
			
			psmt=conn.prepareStatement(sql);
			System.out.println("3단계:쿼리준비성공!!");
			
			rs=psmt.executeQuery();
			System.out.println("4단계:쿼리실행성공!!");
			
			while(rs.next()) {
				HkDto dto=new HkDto();
				dto.setSeq(rs.getInt(1));
				dto.setId(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setRegDate(rs.getDate(5));
				list.add(dto);
				System.out.println(dto);
			}
			System.out.println("5단계:쿼리결과받기성공");
		} catch (SQLException e) {
			System.out.println("JDBC�������!!(getAllBoard())"+":"+getClass());
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null) {
					rs.close();
				}
				if(psmt!=null) {
					psmt.close();
				}
				if(conn!=null) {
					conn.close();
				}
				System.out.println("6단계:DB닫기성공!!");
			} catch (SQLException e) {
				System.out.println("6단계:DB닫기실패!!");
				e.printStackTrace();
			}
		}
		
		return list;
	}
	
	//�۾���
	public boolean insertBoard(HkDto dto) {
		int count=0;
		Connection conn=null;
		PreparedStatement psmt=null;
//		ResultSet rs=null;
		
		String sql=" INSERT INTO HKBOARD VALUES(HKBOARD_SEQ.NEXTVAL,?,?,?,SYSDATE)";
		
		try {
			conn=getConnection();
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			
			count=psmt.executeUpdate();//���̺� ����� ���� ������ ��ȯ
		} catch (SQLException e) {
			System.out.println("JDBC실패:insertBoard():"+getClass());
			e.printStackTrace();
		}finally {
			close(null, psmt, conn);
		}
		return count>0?true:false;
	}
	//�ۻ󼼺���(select�� ~where��)
	public HkDto getBoard(int seq) {
		HkDto dto=new HkDto();
		
		Connection conn=null;//�������� ��ü
		PreparedStatement psmt=null;//�����غ����� ��ü
		ResultSet rs=null;//����ޱ����� ��ü
		
		String sql=" SELECT SEQ, ID, TITLE, CONTENT, REGDATE "
				+ " FROM HKBOARD WHERE SEQ=? ";
		
		try {
			conn=getConnection();
			psmt=conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			rs=psmt.executeQuery();
			while(rs.next()) {
				int i=1;
				dto.setSeq(rs.getInt(i++));
				dto.setId(rs.getString(i++));
				dto.setTitle(rs.getString(i++));
				dto.setContent(rs.getString(i++));
				dto.setRegDate(rs.getDate(i++));
				System.out.println(dto);
			}
		} catch (SQLException e) {
			System.out.println("JDBC실패:getBoard():"+getClass());
			e.printStackTrace();
		}finally {
			close(rs, psmt, conn);
		}
		
		return dto;
	}
	//�ۼ����ϱ�(������, �۳���, �ۼ��� ����)
	public boolean updateBoard(HkDto dto) {
		int count=0;
		Connection conn=null;
		PreparedStatement psmt=null;
		
		String sql=" UPDATE HKBOARD SET TITLE=?, CONTENT=?,REGDATE=SYSDATE WHERE SEQ=? ";
		
		try {
			conn=getConnection();
			psmt=conn.prepareStatement(sql);
			//?�� �������� �ۼ��� ������� �ε��� ��ȣ�� �ο��Ѵ�.
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setInt(3, dto.getSeq());
			
			count=psmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("JDBC실패:updateBoard():"+getClass());
			e.printStackTrace();
		}finally {
			close(null, psmt, conn);
		}
		return count>0?true:false;
	}
	//�ۻ����ϱ�
	public boolean delBoard(int seq) {
		int count=0;
		Connection conn=null;
		PreparedStatement psmt=null;
		
		String sql=" DELETE FROM HKBOARD WHERE SEQ=? ";
		
		try {
			conn=getConnection();
			psmt=conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			count=psmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("JDBC실패:delBoard():"+getClass());
			e.printStackTrace();
		}finally {
			close(null, psmt, conn);
		}
		return count>0?true:false;
	}
}











