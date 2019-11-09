
<%@page import="com.Con"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String id1=null;
    if(request.getParameter("submit")!=null)
    {
        id1=request.getParameter("id");
        String uname=request.getParameter("sname");
        String ucourse=request.getParameter("course");
        String ufee=request.getParameter("fee");
        Con con=new Con();
        int i=con.edit(id1, uname, ucourse, ufee);
        
        if(i!=0)
        {
        %>
        <script>
            alert("Record Updated");
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
        uname=null;
        ucourse=null;
        ufee=null;
    }
%>
   
<%
    String id=request.getParameter("id");
    Con con=new Con();
    con.update(Integer.parseInt(id));
    String name=con.getName();
    String course=con.getCourse();
    String fee=con.getFee();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <%=id%>
        <h1>Student Update</h1>
        <div class="row">
            <div class="col-sm-4">
                <form  method="POST" action="#">
                    <div alight="left">
                        <label class="form-label">Student Name</label>
                        <input type="text" class="form-control" placeholder="Student Name" value="<%=name %>" name="sname" id="sname" required="">                         
                    </div>
                    
                    <div alight="left">
                        <label class="form-label">Course</label>
                        <input type="text" class="form-control" placeholder="Course" value="<%=course %>" name="course" id="course" required>                         
                    </div>
                    
                     <div alight="left">
                        <label class="form-label">Fee</label>
                        <input type="text" class="form-control" placeholder="Fee" value="<%=fee %>" name="fee" id="fee" required>                         
                    </div>
                  
                    <br>
                    
                    <div alight="right">
                        <input type="submit" id="submit" value="submit" name="submit" class="btn btn-info">
                        <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">
                    </div>
                    
                    <div alight="left">
                        <p><a href="index.jsp" > Click back</a></p>
                    </div>
                    
                </form> 
            </div>
        </div>
    </body>
</html>
