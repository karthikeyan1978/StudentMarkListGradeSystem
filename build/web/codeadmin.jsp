<%@page import="com.apps.Database.DatabaseFile"%>
<%@page import="java.util.Vector"%>
<%@page import="com.apps.Logcreation.Log"%>
<%@page import="java.sql.*" %>
<%@page  session="true" %>
<%
try
{
    Log objLog  = objLog = new Log();
    
    //getting value from 
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    
    //session 
    session.setAttribute("x", username);
   
    int count = 0;
    Vector<Object> rsp = null;
    Statement st = null;
    ResultSet rs = null;
    Connection con = null;
    
        //jdbc coding
        try
        {         
            if( ((username!=null) && (!username.trim().equals(""))) && ((password!=null) && (!password.trim().equals(""))))
            {            
                 String sql = "select * from admindetails "
                        + "where Admin_Username = '"+username+"' "
                        + "and Admin_Password = '"+password+"' ";

                  Log.logger.info("sql:"+sql);	  

                  //CALLING DATABASE Class           
                  rsp = DatabaseFile.getInstance().codeselect(sql);

                  st = (Statement) rsp.get(0);
                  rs = (ResultSet) rsp.get(1);
                  con = (Connection) rsp.get(2);

                  while(rs.next())
                  { 
                    count = rs.getInt(1);

                    //session 
                    session.setAttribute("UId", count);
    
                    //page redirection
                     %>
                     <jsp:forward page="apply.jsp"></jsp:forward>
                     <%
                  }                                   

                     %>
                         <jsp:forward page="index.jsp">
                             <jsp:param name="msg" value="101"/>
                         </jsp:forward>
                     <%           
            }
            else
            {
                 //page redirection
                     %>
                     <jsp:forward page="index.jsp">
                         <jsp:param name="msg" value="102"/>
                     </jsp:forward>
                     <%
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
            
            Log.logger.error("Error:", e);
            Log.logger.warn("This is a warning message");
            Log.logger.trace("This message will not be logged since log level is set as DEBUG");
        }
        finally
        {
            try
            {
                if(st != null)
                {
                    st.close(); 
                    st = null;
                }
            }
            catch(Exception e)
            {
                e.printStackTrace();
                
                Log.logger.error("Error:", e);
                Log.logger.warn("This is a warning message");
                Log.logger.trace("This message will not be logged since log level is set as DEBUG");
            }
            
            try
            {
                if(rs != null)
                {
                    rs.close(); 
                    rs = null;
                }
            }
            catch(Exception e)
            {
                e.printStackTrace();
                
                Log.logger.error("Error:", e);
                Log.logger.warn("This is a warning message");
                Log.logger.trace("This message will not be logged since log level is set as DEBUG");
            }
            
            try
            {
                if(con != null)
                {
                    DatabaseFile.cp.surrenderConnection(con);
                    
                    con.close();
                    con = null;
                }
            }
            catch(Exception e)
            {
                e.printStackTrace();
                
                Log.logger.error("Error:", e);
                Log.logger.warn("This is a warning message");
                Log.logger.trace("This message will not be logged since log level is set as DEBUG");
            }
            
            rsp = null;
        }   
}
catch(Exception e)
            {
                e.printStackTrace();
                
                Log.logger.error("Error:", e);
                Log.logger.warn("This is a warning message");
                Log.logger.trace("This message will not be logged since log level is set as DEBUG");
            }
%>
