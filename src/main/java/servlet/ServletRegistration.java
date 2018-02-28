package servlet;

import dao.Connect;
import dao.Database;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

/**
 * Created by user on 11.02.2018.
 */
public class ServletRegistration extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Connect connect = new Connect();
        Database database = new Database(connect.connect());

        try {
            database.addNewUser(req.getParameter("nickName"), req.getParameter("mail"), req.getParameter("password"));
        } catch (SQLException e) {
            e.printStackTrace();
            req.getRequestDispatcher("registrationWrong.jsp").forward(req, resp);
        }

        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        req.getRequestDispatcher("logIn.jsp").forward(req, resp);
    }}
