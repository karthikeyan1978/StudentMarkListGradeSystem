<%@page import="com.apps.constants.Constants"%>
<%@page import="com.apps.ResourceBundle.AppBundle"%>
<%@page import="com.apps.Logcreation.Log"%>
<%@page import="java.util.Vector"%>
<%@page import="com.apps.Database.DatabaseFile"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="EN" lang="EN" dir="ltr">
    <head profile="http://gmpg.org/xfn/11">
        <title>Student System</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <meta http-equiv="imagetoolbar" content="no" />
        <link rel="stylesheet" href="styles/layout.css" type="text/css" />
        <%@page errorPage="ErrorPage.jsp"%>
        <%@page session="true" %>
    </head>
    <body id="top">
        <div class="wrapper row1">
            <div id="header" class="clear">
                <div class="fl_left">
                    <h1><a href="index.jsp">Student System</a></h1>
                    <p>Student System
                        <span style="padding-left: 250px; color: red;"> Welcome : <%=session.getAttribute("x")%></span>                           
                    </p>
                </div>
                <div class="fl_right">
                  
                </div>
            </div>
        </div>
        <!-- ####################################################################################################### -->
        <div class="wrapper row2">
            <div class="rnd">
                <!-- ###### -->
                <div id="topnav">
                    <ul>                                                       
                        <li><a href="apply.jsp">Apply</a></li>
                        <li><a href="ViewCards.jsp">View Details</a></li>  
                        <li class="active"><a href="creditcard.jsp">Search Details</a></li>                                           
                        <li class="last"><a href="Signout.jsp">Sign Out</a></li>
                    </ul>
                </div>
                <!-- ###### -->
            </div>
        </div>
        <!-- ####################################################################################################### -->
        <div class="wrapper row3">
            <div class="rnd">
                <div id="container" class="clear">
                    <!-- ####################################################################################################### -->
                              
                   <h1>Search Wallet</h1>
                    
                   <form action="codecreditcard.jsp" method="post">
          
                      <table align="center" border="0px" width="100px">

                          <tr style="color: red;">
                              <td>Name:</td><td><input type="text" name="name" size="45px"/>*</td>
                          </tr>

                          <tr>
                              <td>&nbsp;</td>
                              <td><input type="submit" value="Submit"/><input type="reset" value="Reset"/></td>
                          </tr>
                         
                      </table>

                  </form>
                   
                   <h1>Student Details</h1>
                    
                    <%
                        Log objLog  = objLog = new Log();
                        
                        Vector<Object> rsp = null;
                        Statement st = null;
                        ResultSet rs = null;
                        Connection con = null;
    
                        try
                        {
                                 int g = 1;
                             
                                 out.println("<table border='2px' align='center'>");
                                 out.println("<tr>");
                                 out.println("<th>Sno</th>");
                                 out.println("<th>Name</th>");
                                 out.println("<th>English</th>");
                                 out.println("<th>Maths</th>");    
                                 out.println("<th>Tamil</th>");     
                                 out.println("<th>Science</th>");
                                 out.println("<th>Moral</th>");
                                 out.println("<th>Average</th>");
                                 out.println("<th>Grade</th>");
                                 out.println("<th>Recorded Date</th>");                                
                                 out.println("</tr>");

                                  String sql = "SELECT Name, English, Maths, Tamil, Science, Moral, RecordedDate "
                                            + "FROM student "
                                            + "WHERE Name = '"+request.getParameter("name")+"' "
                                            + "ORDER BY RecordedDate DESC";
                                 
                                 //CALLING DATABASE Class           
                                 rsp = DatabaseFile.getInstance().codeselect(sql);

                                 st = (Statement) rsp.get(0);
                                 rs = (ResultSet) rsp.get(1);
                                 con = (Connection) rsp.get(2);
                            
                                 while(rs.next())
                                 {                 
                                     int average = (Integer.parseInt(rs.getString("English")) 
                                                 + Integer.parseInt(rs.getString("Maths"))
                                                 + Integer.parseInt(rs.getString("Tamil"))
                                                 + Integer.parseInt(rs.getString("Science"))
                                                 + Integer.parseInt(rs.getString("Moral")))/5;
                                     
                                     String grade = "";
                                     
                                     if(average < 50)
                                     {
                                         grade = "F";
                                     }
                                     else if(average >= 50 && average < 60)
                                     {
                                         grade = "E";
                                     }
                                     else if(average >= 60 && average < 70)
                                     {
                                         grade = "D";
                                     }
                                     else if(average >= 70 && average < 80)
                                     {
                                         grade = "C";
                                     }
                                     else if(average >= 80 && average < 90)
                                     {
                                         grade = "B";
                                     }
                                     else if(average >= 90 && average < 100)
                                     {
                                         grade = "A";
                                     }
                                                                                  
                                     out.println("<tr><td>" + g++ 
                                             + "</td><td>" + rs.getString("Name")
                                             + "</td><td>" + rs.getString("English")
                                             + "</td><td>" + rs.getString("Maths")
                                             + "</td><td>" + rs.getString("Tamil") 
                                             + "</td><td>" + rs.getString("Science")
                                             + "</td><td>" + rs.getString("Moral")
                                             + "</td><td>" + average
                                             + "</td><td>" + grade
                                             + "</td><td>" + rs.getString("RecordedDate")
                                             + "</td></tr>");
                                 }
                                
                                 out.println("</table>");
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
                    %>
                                       
                    </div>

                    <%
                        //getting response
                        try 
                        {
                            out.println("<font color = 'red'>");

                            if ((request.getParameter("msg") != null) && (!(request.getParameter("msg").trim().equals("")))) 
                            {
                                String respMsg = AppBundle.getInstance().loadpropertyfile(request.getParameter("msg"), Constants.Config);
              
                                out.println(respMsg != null ? respMsg : AppBundle.getInstance().loadpropertyfile("100", Constants.Config));
                            }

                            out.println("</font>");
                        } 
                        catch (Exception e) 
                        {
                            e.printStackTrace();
                
                            Log.logger.error("Error:", e);
                            Log.logger.warn("This is a warning message");
                            Log.logger.trace("This message will not be logged since log level is set as DEBUG");
                        }
                    %>
                    <!-- ####################################################################################################### -->
                </div>
            </div>        
    </body>
</html>
