package servlet;

import dao.Connect;
import dao.Database;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

/**
 * Created by user on 11.02.2018.
 */
public class ServletLogin extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        resp.setContentType("text/html");
        resp.setCharacterEncoding("cp1251");

        Connect connect = new Connect();
        Database database = new Database(connect.connect());
String password = "";
        try {
           password = database.getPassword(req.getParameter("nickName"));
        } catch (SQLException e) {
            e.printStackTrace();
        }

        if (password.matches(req.getParameter("password"))){
            Cookie cookie = new Cookie("nickName", req.getParameter("nickName"));
            resp.addCookie(cookie);
            resp.sendRedirect("index.jsp");
        /*    req.getRequestDispatcher("index.jsp").forward(req, resp);*/
        } else {
            resp.sendRedirect("logInWrong.jsp");
    /*        req.getRequestDispatcher("logInWrong.jsp").forward(req, resp);*/
        }

    }}
