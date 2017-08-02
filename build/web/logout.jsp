<%@page session="true" %>
<%
try
{
    //session  close
    session.getAttribute("x");
       
    //invalidate session or destroy session
    session.invalidate();
    
    %>
        <jsp:forward page="admin.jsp"></jsp:forward>
    <%
}
catch(Exception e)
{
    e.printStackTrace();
}
%>