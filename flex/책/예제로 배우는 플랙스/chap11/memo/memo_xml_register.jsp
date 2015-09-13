<%@ page contentType="text/xml; charset=UTF-8" %><%@ page import = "java.io.*, java.sql.*, java.util.*" %><?xml version="1.0" encoding="utf-8"?>
<%
String memo_id = request.getParameter("memo_id");
String user_name = request.getParameter("user_name");
String user_memo = request.getParameter("user_memo");
if(memo_id == null || memo_id.equals("")) { // 파라미터가 넘어오지 않았을 때 처리
	out.println("<result_meta>");
	out.println("	<err_code>0</err_code>"); // 에러코드 
	out.println("	<proc_cnt>0</proc_cnt>");// 처리건수
	out.println("	<message>파라미터 입력되지 않았습니다.</message>"); // 메시지
	out.println("</result_meta>");	
} else {
	String sql =  " INSERT INTO MEMO (MEMO_ID, USER_NAME, USER_MEMO, MEMO_DATE) values (" 
			   + memo_id + ", '" + user_name + "', '" + user_memo + "', now())";
	Connection c = null;
	Statement stmt = null;
	try  {
		Class.forName("org.hsqldb.jdbcDriver");
		String url = "jdbc:hsqldb:file:C:/lcds/jrun4/servers/default/flex/Flex2Book/chap11/memo/db/memo";
		c = DriverManager.getConnection(url);
		stmt = c.createStatement();
		int proc_cnt = stmt.executeUpdate(sql);
		out.println("<result_set>");
		// 에러코드 --> 0: 에러, 1:정상
		out.println("<result_meta>");
		out.println("	<err_code>1</err_code>"); // 에러코드 
		out.println("	<proc_cnt>" + proc_cnt + "</proc_cnt>");// 처리건수
		out.println("	<message/>"); // 메시지
		out.println("</result_meta>");
		stmt.close();
		c.close();
	} catch (Exception e) {
		e.printStackTrace();
		out.println("<result_meta>");
		out.println("	<err_code>0</err_code>"); // 에러코드 
		out.println("	<proc_cnt>0</proc_cnt>");// 처리건수
		out.println("	<message/>"); // 메시지
		out.println("</result_meta>");
	} finally {
		stmt.close();		
		c.close();
		out.println("</result_set>");
	}
}
%>