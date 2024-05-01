package controller;


import model.Post;
import service.IPostService;
import service.PostService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


@WebServlet(name = "PostServlet", urlPatterns = "/posts")
public class PostServlet extends HttpServlet {

    private final PostService postService = new IPostService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create":
                createPost(req, resp);
                break;
            case "edit":
                updatePost(req, resp);
                break;
            case "delete":
                deletePost(req, resp);
                break;
            default:
                break;
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateForm(req, resp);
                break;
            case "edit":
                showEditForm(req, resp);
                break;
            case "delete":
                showDeleteForm(req, resp);
                break;
            case "view":
                viewPost(req, resp);
                break;
            default:
                listPosts(req, resp);
                break;
        }
    }

    private void viewPost(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        Post post = this.postService.searchById(id);
        RequestDispatcher dispatcher;

        if (post == null) {
            dispatcher = req.getRequestDispatcher("view/error-404.jsp");
        } else {
            req.setAttribute("post", post);
            dispatcher = req.getRequestDispatcher("view/view.jsp");
        }

        try {
            dispatcher.forward(req, resp);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void listPosts(HttpServletRequest req, HttpServletResponse resp) {
        List<Post> posts = this.postService.showAll();
        req.setAttribute("posts", posts);

        RequestDispatcher dispatcher;
        dispatcher = req.getRequestDispatcher("view/list.jsp");

        try {
            dispatcher.forward(req, resp);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void createPost(HttpServletRequest req, HttpServletResponse resp) {

        int id = Integer.parseInt(req.getParameter("id"));
        String title = req.getParameter("title");
        String content = req.getParameter("content");
        String shortdestination = req.getParameter("shortdescription");
        String img = req.getParameter("img");

        Post post = new Post(id, title, content, shortdestination, img);
        this.postService.saveList(post);
        RequestDispatcher dispatcher;
        dispatcher = req.getRequestDispatcher("view/create.jsp");
        req.setAttribute("message", "New post was created");

        try {
            dispatcher.forward(req, resp);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreateForm(HttpServletRequest req, HttpServletResponse resp) {
        RequestDispatcher dispatcher = req.getRequestDispatcher("view/create.jsp");
        try {
            dispatcher.forward(req, resp);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void updatePost(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        String title = req.getParameter("title");
        String content = req.getParameter("content");
        String shortdestination = req.getParameter("shortdestination");

        Post post = this.postService.searchById(id);
        RequestDispatcher dispatcher;
        if (post == null) {
            dispatcher = req.getRequestDispatcher("error.jsp");
        } else {
            post.setId(id);
            post.setTitle(title);
            post.setContent(content);
            this.postService.update(id, post);
            req.setAttribute("post", post);
            req.setAttribute("message", "Post information was updated");
            dispatcher = req.getRequestDispatcher("view/edit.jsp");
        }
        try {
            dispatcher.forward(req, resp);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showEditForm(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        Post post = this.postService.searchById(id);
        RequestDispatcher dispatcher;
        if (post == null) {
            dispatcher = req.getRequestDispatcher("error.jsp");
        } else {
            req.setAttribute("post", post);
            dispatcher = req.getRequestDispatcher("view/edit.jsp");
        }
        try {
            dispatcher.forward(req, resp);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void deletePost(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        Post post = this.postService.searchById(id);
        RequestDispatcher dispatcher;
        if (post == null) {
            dispatcher = req.getRequestDispatcher("error.jsp");
        } else {
            this.postService.delete(id);
            try {
                resp.sendRedirect("/posts");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void showDeleteForm(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        Post post = this.postService.searchById(id);
        RequestDispatcher dispatcher;
        if (post == null) {
            dispatcher = req.getRequestDispatcher("error.jsp");
        } else {
            req.setAttribute("post", post);
            dispatcher = req.getRequestDispatcher("view/delete.jsp");
        }
        try {
            dispatcher.forward(req, resp);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
