package service;

import model.Post;

import java.util.List;

public interface PostService {
    List<Post> showAll();

    void saveList(Post post);

    Post searchById(int id);


    void update(int id, Post post);

    void delete(int id);
}
