<%@page import="java.util.Iterator"%>
<%@page import="com.manjeet.trelloclasses.Board"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.manjeet.trelloclasses.TrelloUser"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.io.*"%>
    <%@page import="javax.jdo.*"%>
    <%@page import="com.manjeet.utility.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title> View Page </title>
</head>
<body>
<center>
<%
TrelloUser tuser=PMF.get().getPersistenceManager().getObjectById(TrelloUser.class,request.getAttribute("Email").toString());
%>
<h4 style="background-color:#506EAA; height:50px" > <center><font color="white" ><center> Welcome To The Trello </font></center> <div align="right"><font color="white"><span class='glyphicon glyphicon-user'></span><%=tuser.getName() %></font></div></h4>

<div align="left"><span class='glyphicon glyphicon-user' ></span><h4>My Board</h4></div>

<% if(tuser.getBoardlist()!=null)
  {
	System.out.println("Board List Is Not empty");
	ArrayList<Board> al=tuser.getBoardlist();
	if(al.size()>0)
	{
		%>
		
<div align="left"  style="position: absolute; top: 150px; left:30px; width: 640px;">  
		
	<% 
	 ArrayList<Board> gettingListOfBoard= tuser.getBoardlist();
		System.out.print("List Of Board: "+gettingListOfBoard);
	  for(Board b:gettingListOfBoard)
	  {
		  System.out.println("Name Of the board :"+b.getName());
		  
		  %> <button class="btn btn-large btn-primary" type="button" id="<%=b.getName() %>"> <%=b.getName() %></button> <% 
		  
	  }
	}
	else
	{
		%> 	<h2></h2>
	<% }
  }
else
{
	System.out.println(" Bard list is empty");
}
%>
</div>
<div align="right" style="position: absolute; top:80px; right:40px; width: 400px ">
<form action="/boardsubmit" method="POST">
 <table>
 <tr><td>Board Name : </td><td> <input type="text" name="boardName" placeholder=" Enter Board Name "/></td><td> <input type="hidden"  name="hidden" value="<%=request.getAttribute("Email") %>" /></td></tr>
 <tr><td colspan="2"> <input type="submit" value=" Save"/> </td></tr>
 </table>  
</form>
</div>
</center>
</body>
</html>