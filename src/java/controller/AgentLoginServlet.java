
package controller;

import Model.Agent;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class AgentLoginServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
         HttpSession session = request.getSession(false);
        String username = request.getParameter("loginemail");
        String password = request.getParameter("loginpass");
        PrintWriter out = response.getWriter();
        try {
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
           sql = "SELECT * from Agent WHERE USERNAME = '" + username + "'";
           ResultSet rs = stmt.executeQuery(sql);
                if (rs.next()) {
                    int Uid = rs.getInt("UID");
                    String Uname = rs.getString("USERNAME");
                    String Upass = rs.getString("PASS");
                    String nation = rs.getString("NATION");
                    String state = rs.getString("STATE");
                    String name = rs.getString("NAME");
                    Agent ag = new Agent(Uname,name,Upass,nation,state);
                    ag.setId(Integer.toUnsignedLong(Uid));
                    if (username.equals(Uname)) {
                        if (Upass.equals(password)) {
                             session.setAttribute("who", ag);
                            out.println("<script type=\"text/javascript\">");
   out.println("alert('Login Successfully');");
   out.println("location='agenthome.jsp';");
   out.println("</script>");
                            
                        } else {
                            out.println("<script type=\"text/javascript\">");
   out.println("alert('Sorry, username or password wrong');");
   out.println("location='homepage.jsp';");
   out.println("</script>");
                        }
                    }                    
                } else {
                    out.println("<script type=\"text/javascript\">");
   out.println("alert('Sorry, username or password wrong');");
   out.println("location='homepage.jsp';");
   out.println("</script>");
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
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
