

<%@page import="java.sql.SQLException"%>
<%@page import="java.util.List"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script>
      // When the user clicks on the button, scroll to the top of the document
            function topFunction() {
                document.body.scrollTop = 0;
                document.documentElement.scrollTop = 0;
            }
            function reloadFunction() {
                window.location.reload();
            }

        </script>
        <title>Schedule Detail</title>
        <style>
            #band{
                 min-height: 600px;
                height:100%;
            }
            body{
                height: 100%;
        background-color: #f1f1f1;
    }
            .sidenav {
      padding-top: 20px;
      background-color: #f1f1f1;
      height: 100%;
    }
            #contentbox{
                height:100%;
        background-color:white;
    }
            body {
      font: 400 15px/1.8 Lato, sans-serif;
      color: #777;
  }
  h3, h4 {
      margin: 10px 0 30px 0;
      letter-spacing: 10px;      
      font-size: 20px;
      color: #111;
  }
  .container {
      padding: 80px 120px;
  }
  .person {
      border: 10px solid transparent;
      margin-bottom: 25px;
      width: 80%;
      height: 80%;
      opacity: 0.7;
  }
  .person:hover {
      border-color: #f1f1f1;
  }
  .carousel-inner img {
      -webkit-filter: grayscale(90%);
      filter: grayscale(90%); /* make all photos black and white */ 
      width: 80%; /* Set width to 100% */
      margin: auto;
  }
  .carousel-caption h1 {
      color: #f1f1f1 !important;
  }
  @media (max-width: 600px) {
      
    .carousel-caption {
      display: none; /* Hide the carousel text when the screen is less than 600 pixels wide */
    }
  }
  .bg-1 {
      background: #2d2d30;
      color: #bdbdbd;
  }
  .bg-1 h3 {color: #fff;}
  .bg-1 p {font-style: italic;}
  .list-group-item:first-child {
      border-top-right-radius: 0;
      border-top-left-radius: 0;
  }
  .list-group-item:last-child {
      border-bottom-right-radius: 0;
      border-bottom-left-radius: 0;
  }
  .thumbnail {
      padding: 0 0 15px 0;
      border: none;
      border-radius: 0;
  }
  .thumbnail p {
      margin-top: 15px;
      color: #555;
  }
  .btn {
      padding: 10px 20px;
      background-color: #333;
      color: #f1f1f1;
      border-radius: 0;
      transition: .2s;
  }
  .btn:hover, .btn:focus {
      border: 1px solid #333;
      background-color: #fff;
      color: #000;
  }
  .modal-header, h4, .close {
      background-color: #333;
      color: #fff !important;
      text-align: center;
      font-size: 30px;
  }
  .modal-header, .modal-body {
      padding: 40px 50px;
  }
  .nav-tabs li a {
      color: #777;
  }
  #googleMap {
      width: 100%;
      height: 400px;
      -webkit-filter: grayscale(100%);
      filter: grayscale(100%);
  }  
  .navbar {
      font-family: Montserrat, sans-serif;
      margin-bottom: 0;
      background-color: #000;
      border: 0;
      font-size: 11px !important;
      letter-spacing: 4px;
      opacity: 0.8;
      height: 80px
  }
  .navbar li a, .navbar .navbar-brand { 
      color: #d5d5d5 !important;
  }
  .navbar-nav li a:hover {
      color: #fff !important;
  }
  .navbar-nav li.active a {
      color: #fff !important;
      background-color: #29292c !important;
  }
  .navbar-default .navbar-toggle {
      border-color: transparent;
  }
  .open .dropdown-toggle {
      color: #fff;
      background-color: #555 !important;
  }
  .dropdown-menu li a {
      color: #000 !important;
  }
  .dropdown-menu li a:hover {
      background-color: red !important;
  }
  footer {
      background-color: #2d2d30;
      color: #f5f5f5;
      padding: 32px;
  }
  footer a {
      color: #f5f5f5;
  }
  footer a:hover {
      color: #777;
      text-decoration: none;
  }  
  .form-control {
      border-radius: 0;
  }
  textarea {
      resize: none;
  }
  hr{
   border-width: 2px;
   color:#000;
  }
        </style>
    </head>
    <body>
         <%
                             String id = request.getParameter("sid");
                            Connection conn = null;
           Statement stmt = null;
 String driver ="com.microsoft.sqlserver.jdbc.SQLServerDriver";
        try {
              try {
            Class.forName(driver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
            String dbURL = "jdbc:sqlserver://ddacrgft.database.windows.net:1433;database=DDACrgft";
            String user = "teckenn";
            String pass = "Yongddac!";
            conn = DriverManager.getConnection(dbURL, user, pass);
           stmt = conn.createStatement();
           String sql;
           sql = "SELECT * from Schedule WHERE SID="+id;
                      ResultSet rs = stmt.executeQuery(sql);

           if(rs.next()){
           %>
           <br> <br><br> 
        <div id="band" class="container-fluid text-center">  
            
            <div class="row content">
                
                <div class="col-sm-2 sidenav">
                </div>
                <div id="contentbox" class="col-sm-8 text-justify">
                     <div class="modal-dialog">
                          <div class="">
        <div class="modal-header">
          <h4 class="modal-title">Schedule Detail</h4>
        </div>
        <div class="modal-body">
              <h2>Schedule Detail</h2>
              <div class="form-group">
                  <label for="username">From: <%=rs.getString("SOURCE") %></label>
      </div>
      <div class="form-group">
      <label for="username">Destination: <%=rs.getString("DESTINATION") %></label>
      </div>
      <div class="form-group">
      <label for="username">Ship Date: <%=rs.getString("SHIPDATE") %></label>
      </div>
      <div class="form-group">
      <label for="username">Time: <%=rs.getString("SHIPTIME") %></label>
      </div>
        </div>
        <div class="modal-footer">
            <div class="col-sm-6">
                
            </div>
            <div class="col-sm-6">
        </div>
      </div>
       
    </div>   
  </div>
      <h2>Booking Detail</h2>
             <table class="table table-hover" id="scheduletable">
                            <thead>
      <tr>
          <th>Booking ID</th>
          <th>Customer Name</th>
        <th>IC</th>
        <th>From</th>
        <th>Destination</th>
        <th>Ship Date</th>
        <th>Status</th>
        <th class="text-center">Operation</th>
        
      </tr>
    </thead>
    <tbody>           
                        <%
          }
                            sql = "SELECT * from Booking b,Schedule s, Customer c, Items i WHERE s.SID = "+id+" and b.CUSTOMER_ID = c.CID and b.SCHEDULE_ID=s.SID and b.ITEM_ID=i.IID and b.STATUS = 'Approve' ORDER BY BID DESC";
           int x = 0;
           rs = stmt.executeQuery(sql);

           while(rs.next()){
               %>
                
               <tr>
                    
          <td> <input type="hidden" name="cid" id="cid" value="<%=rs.getString("BID")%>"><%= rs.getString("BID")%></td>
           <td> <input type="hidden" name="name" id="name" value="<%=rs.getString("NAME")%>"><%= rs.getString("NAME")%></td>
          <td> <input type="hidden" name="ic" id="ic" value="<%=rs.getString("ICNUMBER")%>"><%=rs.getString("ICNUMBER")%></td>
        <td> <input type="hidden" name="nation" id="nation" value="<%=rs.getString("SOURCE")%>"><%=rs.getString("SOURCE")%></td>
        <td> <input type="hidden" name="gentle" id="gentle" value="<%=rs.getString("DESTINATION")%>"><%=rs.getString("DESTINATION")%></td>
        <td> <input type="hidden" name="phone" id="phone" value="<%=rs.getString("SHIPDATE")%>"><%=rs.getString("SHIPDATE")%></td>
        <td> <input type="hidden" name="address" id="address" value="<%=rs.getString("STATUS")%>"><%=rs.getString("STATUS")%></td>
         <td class="text-center">
            <div>
                <div class="col-sm-6 ">
                                        <a href="viewbookingdetail.jsp?adid=<%=rs.getString("BID")%>" target="blank"><button class="btn btn-default btn-sm">View Detail</button></a>
                                    
            </div>
        </td>
        
  </tr>
               
               <%
           }
                rs.close();
                stmt.close();
                conn.close();
            
               
 
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (conn != null && !conn.isClosed()) {
                    conn.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
                        %>
    </tbody>
                        </table>
    <br><br>
                </div>
                <div class="col-sm-2 sidenav">
                    
              
          </div>
                </div>
            </div>
        </div> 
    </body>
</html>
