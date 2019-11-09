
package com;

import java.sql.*;
import javax.servlet.*;

public class Con {
    public static void main(String []args)
    {
        Con con=new Con();
        con.delete(String.valueOf(27));
        
    }
    
    public int delete(String id)
    {
        String sql="DELETE FROM student WHERE id="+id;
        try{
            
            Connection con=con();
            PreparedStatement ps=con.prepareStatement(sql);
            int i=ps.executeUpdate();
            return i;
            
        }catch(Exception e){
            System.out.println(e);
        }
        return 0;
    }
    
    
    public int edit(String id,String name,String course,String fee)
    {
        int rs=0;
        String sql="UPDATE student SET name = ?, course = ?, fee=? WHERE id=?";
        Connection con=con();
        try
        {
        PreparedStatement ps=con.prepareStatement(sql);
        ps.setString(1, name);
        ps.setString(2, course);
        ps.setString(3, fee);
        ps.setString(4, id);
        rs=ps.executeUpdate();
        if(rs!=0)
        {
            return rs;
        }
        else
        {
            System.out.println("faild");
        }
        con.close();
        }catch(Exception e)
        {
            System.out.println(e);
        }

        return rs;
        
    }
    
    private String name,course,fee;
    public void setName(String name)
    {
        this.name=name;
    }
    public void setCourse(String course)
    {
        this.course=course;
    }
    public void setFee(String fee)
    {
        this.fee=fee;
    }
    
   
   
   public String getName()
   {
       return name;
   }
   
   public String getCourse()
   {
       return course;
   }
   
   public String getFee()
   {
       return fee;
   }
    
    public void update(int id)
    {
        String id1=String.valueOf(id);
        String sql="SELECT * FROM `student` WHERE id="+id1;
        try
        {
            ResultSet rs;
            Connection con=con();
            Statement st=con.createStatement();
            rs=st.executeQuery(sql);
           while(rs.next())
           {
               String name=rs.getString("name");
               setName(name);
               String course=rs.getString("course");
               setCourse(course);
               String fee=rs.getString("fee");
               setFee(fee);
           }
        }catch(Exception e)
        {
            System.out.println(e);
        }
    }
    
    public int insert(String name,String course,String fee)
    {
        int rs = 0;
        String sql="INSERT INTO `student` (`id`, `name`, `course`, `fee`) VALUES (NULL, ?, ?, ?);";
        Connection con=con();
        try
        {
        PreparedStatement ps=con.prepareStatement(sql);
        ps.setString(1, name);
        ps.setString(2, course);
        ps.setString(3, fee);
        rs=ps.executeUpdate();
        if(rs!=0)
        {
            return rs;
        }
        else
        {
            System.out.println("faild");
        }
        con.close();
        }catch(Exception e)
        {
            System.out.println(e);
        }

        return rs;
    }
    
    
    
    private String pass="";
    private String uname="root";
    private String url="jdbc:mysql://localhost:3308/web3";
    public Connection connection;
    
    public Connection con()
    {
        try {
	            System.out.println("Start");
	            Class.forName("com.mysql.jdbc.Driver");
	            System.out.println("Lode");
	            connection = DriverManager.getConnection(url, uname, pass);
	            System.out.println("Connected");

	        }catch (Exception e)
	        {
	            System.out.println(e);
	        }
	        return connection;
    }
}
