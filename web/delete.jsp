

<%@page import="com.Con"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String id=request.getParameter("id");
    int i=new Con().delete(id);
    if(i!=0)
    {
        %>
        <script>
            alert("Value Deleted");
        </script>
        <%
    }
    else
    {
        %>
        <script>
            alert("Somthing Went wrong");
        </script>
        <%
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:forward page="index.jsp"/>
    </body>
</html>
