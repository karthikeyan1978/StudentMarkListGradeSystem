<%@page import="java.sql.*"%>
<%@page import="java.util.Vector"%>
<%@page import="com.apps.constants.Constants"%>
<%@page import="com.apps.ResourceBundle.AppBundle"%>
<%@page import="com.apps.Database.DatabaseFile"%>
<%@page import="com.apps.Logcreation.Log"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="EN" lang="EN" dir="ltr">
    <head profile="http://gmpg.org/xfn/11">
        <title>Student Management System</title>
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
                    <h1><a href="index.jsp">Student Management System</a></h1>
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
                        <li class="active"><a href="apply.jsp">Apply</a></li>
                        <li><a href="ViewCards.jsp">View Details</a></li>  
                        <li><a href="creditcard.jsp">Search Details</a></li>                                           
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
                  
                  <h1>Apply For Credit Card</h1>
                    
                  <form action="codeapply.jsp" method="post">
                      
                       <table align="center" border="0px" width="100px">
                                         
                            <tr style="color: red;">
                                 <td>Student Name:</td><td><input type="text" name="name" size="45px" />*</td>
                            </tr> 

                            <tr style="color: red;">
                                 <td>English:</td><td><input type="text" name="english" size="45px" />*</td>
                            </tr>
                           
                            <tr style="color: red;">
                                 <td>Maths:</td><td><input type="text" name="maths" size="45px" />*</td>
                            </tr>
                           
                            <tr style="color: red;">
                                 <td>Tamil:</td><td><input type="text" name="tamil" size="45px" />*</td>
                            </tr>
                           
                            <tr style="color: red;">
                                 <td>Science:</td><td><input type="text" name="science" size="45px" />*</td>
                            </tr>
                           
                            <tr style="color: red;">
                                 <td>Moral:</td><td><input type="text" name="moral" size="45px" />*</td>
                            </tr>
                            
                            <tr>
                                 <td>&nbsp;</td>
                                 <td><input type="submit" value="Submit"/><input type="reset" value="Reset"/></td><td>&nbsp;</td>
                            </tr>

                        </table>                      
                      
                  </form>
                   
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
                </div>                
         </div>              
    </body>
</html>
