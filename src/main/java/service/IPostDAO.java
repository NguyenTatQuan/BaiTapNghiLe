package service;


import model.Post;

import java.sql.SQLException;
import java.util.List;

public interface IPostDAO {
    public void addNewPost(Post post) throws SQLException;
    public Post searchPostById(int id);
    public List<Post> showAllPosts();
    public boolean deletePost(int id) throws SQLException;
    public boolean updatePost(Post post) throws SQLException;
}
