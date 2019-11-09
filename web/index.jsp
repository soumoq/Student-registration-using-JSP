
<%@page import="java.sql.*"%>
<%@page import="com.Con"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    if(request.getParameter("submit")!=null)
    {
        String name=request.getParameter("sname");
        String course=request.getParameter("course");
        String fee=request.getParameter("fee");
        Con con=new Con();
        int i=con.insert(name, course, fee);
        if(i!=0)
        {
        %>
        <script>
            alert("Record Added");
        </script>
        <%
        }
        else
        {
        %>
        <script>
            alert("Somthing went wrong");
        </script>
        <%
        }
        name=null;
        course=null;
        fee=null;
    }
%>




<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body style="background-color:powderblue;">
        <h1>Student Registration using JSP</h1>
        <br>
        <div class="row">
            <div class="col-sm-4">
                <form  method="POST" action="#">
                    <div alight="left">
                        <label class="form-label">Student Name</label>
                        <input type="text" class="form-control" placeholder="Student Name" name="sname" id="sname" required="">                         
                    </div>
                    
                    <div alight="left">
                        <label class="form-label">Course</label>
                        <input type="text" class="form-control" placeholder="Course" name="course" id="course" required>                         
                    </div>
                    
                     <div alight="left">
                        <label class="form-label">Fee</label>
                        <input type="text" class="form-control" placeholder="Fee" name="fee" id="fee" required>                         
                    </div>
                  
                    <br>
                    
                    <div alight="right">
                        <input type="submit" id="submit" value="submit" name="submit" class="btn btn-info">
                        <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">
                        
                    </div>
                </form> 
            </div>
            
            <div class="col-sm-8">
                
                <div class="panel-body">
                    <table id="tb1-student" class="table table-responsive table-bordered" cellpadding="0" width="100%">
                        <thead>
                            <tr>
                                <th>Student name</th>
                                <th>Course</th>
                                <th>Fee</th>
                                <th>Edit</th>
                                <th>Delete</th>
                            </tr>
                            
                            <%
                            
                                 ResultSet rs;
                                 Con con1=new Con();
                                 Connection con=con1.con();
                                 String sql="SELECT * FROM `student` WHERE 1";
                                    Statement st=con.createStatement();
                                    rs=st.executeQuery(sql);
                                    while(rs.next())
                                    {
                                        String id=rs.getString("id");
                            
                            %>
                            <tr>
                                <td><%=rs.getString("name")%></td>
                                <td><%=rs.getString("course")%></td>
                                <td><%=rs.getString("fee")%></td>
                                <td><a href="Update.jsp?id=<%=id%>" >Edit</a></td>
                                <td><a href="delete.jsp?id=<%=id%>" >Delete</a></td>
                            </tr>
                            <%
                                }
                            %>
                                        
                        </thead>
                    </table>
                </div>
                
            </div>
            
            
            
        </div>
    </body>
</html>
