<%@ page contentType="text/xml; charset=UTF-8" %><%@ page import = "java.io.*, java.sql.*, java.util.*" %><?xml version="1.0" encoding="utf-8"?>
<%
String memo_id = request.getParameter("memo_id");
String sql = null;
if(memo_id!=null && !memo_id.equals("")) {
	sql="SELECT MEMO_ID, USER_NAME, USER_MEMO, MEMO_DATE FROM MEMO WHERE MEMO_ID = " + memo_id;
} else {
	sql="SELECT MEMO_ID, USER_NAME, USER_MEMO, MEMO_DATE FROM MEMO";
}
Connection c = null;
Statement stmt = null;
ResultSet rs = null;
try  {
	Class.forName("org.hsqldb.jdbcDriver");
	String url = "jdbc:hsqldb:file:C:/lcds/jrun4/servers/default/flex/Flex2Book/chap11/memo/db/memo";
	c = DriverManager.getConnection(url);
	stmt = c.createStatement();
	rs = stmt.executeQuery(sql);
	out.println("<result_set>");
	int proc_cnt = 0;
	while (rs.next()) {
		out.println("<record>");
		out.println("	<memo_id>" + rs.getString(1) + "</memo_id>");
		out.println("	<user_name>" + rs.getString(2) + "</user_name>");
		out.println("	<user_memo>" + rs.getString(3) + "</user_memo>");
		out.println("	<memo_date>" + rs.getString(4) + "</memo_date>");
		out.println("</record>");
		proc_cnt++;  
	}	
	// 에러코드 --> 0: 에러, 1:정상
		out.println("<result_meta>");
		out.println("	<err_code>1</err_code>"); // 에러코드 
		out.println("	<proc_cnt>" + proc_cnt + "</proc_cnt>");// 처리건수
		out.println("	<message/>"); // 메시지
		out.println("</result_meta>");
	rs.close();
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
%>