package controller;

import model.Post;
import service.PostDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "PostServlet", urlPatterns = "/posts")
public class PostServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private PostDAO postDAO;
    public void init() {
        postDAO = new PostDAO();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }

        try {
            switch (action) {
                case "new":
                    addPost(req, resp);
                    break;
                case "edit":
                    showEditForm(req, resp);
                    break;
                case "delete":
                    deletePost(req, resp);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }

        try {
            switch (action) {
                case "edit":
                    showEditForm(req, resp);
                    break;
                case "delete":
                    deletePost(req, resp);
                    break;
                default:
                    listPost(req, resp);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void listPost(HttpServletRequest req, HttpServletResponse resp)
            throws SQLException, IOException, ServletException {
        List<Post> listPost = postDAO.showAllPosts();
        req.setAttribute("listPost", listPost);
        RequestDispatcher dispatcher = req.getRequestDispatcher("view/list.jsp");
        dispatcher.forward(req, resp);
    }

    private void updatePost(HttpServletRequest req, HttpServletResponse resp)
            throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(req.getParameter("id"));
        String title = req.getParameter("title");
        String content = req.getParameter("content");
        String shortdescription = req.getParameter("shortdescription");
        String img = req.getParameter("img");

        Post editPost = new Post(id, title, content, shortdescription, img);
        postDAO.updatePost(editPost);
        resp.sendRedirect("posts"); // Redirect to the list of posts
    }

    private void showEditForm(HttpServletRequest req, HttpServletResponse resp)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Post existingPost = postDAO.searchPostById(id);
        RequestDispatcher dispatcher = req.getRequestDispatcher("view/view.jsp");
        req.setAttribute("post", existingPost);
        dispatcher.forward(req, resp);
    }
    private void addPost(HttpServletRequest req, HttpServletResponse resp)
            throws SQLException, IOException, ServletException {
        String title = req.getParameter("title");
        String content = req.getParameter("content");
        String shortdescription = req.getParameter("shortdescription");
        String img = req.getParameter("img");

        Post newPost = new Post(1, title, content, shortdescription, img);
        postDAO.addNewPost(newPost);
        resp.sendRedirect("posts");
    }
    private void deletePost(HttpServletRequest req, HttpServletResponse resp)
            throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(req.getParameter("id"));
        postDAO.deletePost(id);
        resp.sendRedirect("posts");
    }

}