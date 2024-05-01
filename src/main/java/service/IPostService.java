package service;

import controller.PostServlet;
import model.Post;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class IPostService implements PostService {

    private static Map<Integer, Post> posts;

    static {
        posts = new HashMap<>();
        posts.put(1, new Post(1, "Game", "Trog chơi hot", "game sắp ra mứt", "img/game.jpg"));
        posts.put(2, new Post(2, "Lập trình", "Java", "Hot nhất 2024", "img/java.png"));
        posts.put(3, new Post(3, "Âm nhạc", "Bolero", "Những bài nhạc xưa", "img/nhac.jpg"));
        posts.put(4, new Post(4, "Hài hước", "Truyện cười", "hahaha", "img/haihuoc.png"));
        posts.put(5, new Post(5, "Hành động", "Phim", "Hành động gay cấn", "img/hanhdong.jpg"));
    }
    @Override
    public List<Post> showAll() {
        return new ArrayList<>(posts.values());
    }

    @Override
    public void saveList(Post post) {
        posts.put(post.getId(), post);
    }

    @Override
    public Post searchById(int id) {
        return posts.get(id);
    }

    @Override
    public void update(int id, Post post) {
        posts.put(id, post);
    }

    @Override
    public void delete(int id) {
        posts.remove(id);
    }
}