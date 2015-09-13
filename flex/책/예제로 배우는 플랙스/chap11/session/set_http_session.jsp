<%@ page contentType="text/xml; charset=UTF-8" %><%@ page import = "java.io.*, java.sql.*, java.util.*, java.net.*" %><?xml version="1.0" encoding="utf-8"?><%
	String session_name = request.getParameter("name");
	if(session_name!= null ) {
		session.setAttribute("name", session_name);
%>
  <record_set>
	<record>
		<session_name><%=session_name%></session_name>
		<err_code>1</err_code>
		<message>ok</message>
	</record>
 </record_set>
<%	
	} else {
%>
  <record_set>
	<record>
		<session_name></session_name>
		<err_code>0</err_code>
		<message>no sesssion</message>
	</record>
 </record_set>
<%
	}
%>
