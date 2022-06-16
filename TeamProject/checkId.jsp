<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String id = request.getParameter("checkid");
int check = -1;
//DBCP로 변경
Context initCtx = new InitialContext();
Context envCtx = (Context)initCtx.lookup("java:comp/env");
DataSource ds = (DataSource)envCtx.lookup("jdbc/team");
Connection con = ds.getConnection();
	
String sql = "select id from account where id='"+id+"'";
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery(sql);
System.out.print(rs);
if(rs!=null){
	check=1;
}else{check=0;}

rs.close();
con.close();
stmt.close();
 %>    
<script>
var ret =confirm("이 아이디를 사용하시겠습니까?");
if(ret==true){
	alert("사용!");
}else{
	alert("미사용!");
}
//if(check=1){
//	alert("사용가능한 아이디입니다");
//}else{alert("사용중인 아이디입니다");}
</script>