package com.uniovi.sdi;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@WebServlet(name = "BlogServlet", value = "/Blog")
public class BlogServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CommentsService cs = new CommentsService();
        List<Comment> blogComments = cs.getComments();
        request.setAttribute("blogComments", blogComments);
        getServletContext().getRequestDispatcher("/blog.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getSession().getAttribute("user").toString();
        String comment = request.getParameter("comment");
        String date = new Date().toString();

        Comment commentToAdd = new Comment(name, comment, date);
        CommentsService cs = new CommentsService();
        cs.setNewComment(commentToAdd);
        List<Comment> blogComments = cs.getComments();
        request.setAttribute("blogComments", blogComments);
        getServletContext().getRequestDispatcher("/blog.jsp").forward(request, response);
    }
}
