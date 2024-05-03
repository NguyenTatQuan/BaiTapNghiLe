
package service;
import model.Post;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PostDAO implements IPostDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/postdb?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "Quan123123";

    private static final String SELECT_ALL_POSTS = "select * from post";
    private static final String UPDATE_POSTS_SQL = "update post set title = ?,content= ?, shortdestination =? where id = ?;";
    private static final String SELECT_POST_BY_ID = "select id,title,content,shortdestination from post where id =?";

    public PostDAO(){

    }
    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }
    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
    @Override
    public void addNewPost(Post post) throws SQLException {

    }

    @Override
    public Post searchPostById(int id) {
        Post post = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_POST_BY_ID);) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String title = rs.getString("title");
                String content = rs.getString("content");
                String shortdestination = rs.getString("shortdestination");
                String img = rs.getString("img");
                post = new Post(id, title, content, shortdestination, img);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return post;
    }

    @Override
    public List<Post> showAllPosts() {
        List<Post> posts = new ArrayList<>();

        try {
            Connection connection = getConnection();
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery(SELECT_ALL_POSTS);

            while (rs.next()) {
                int id = rs.getInt("id");
                String title = rs.getString("title");
                String content = rs.getString("content");
                String shortdestination = rs.getString("shortdestination");
                String img = rs.getString("img");

                Post post = new Post(id, title, content, shortdestination, img);
                posts.add(post);
            }
        } catch (SQLException sqlException) {
            printSQLException(sqlException);
        }

        return posts;
    }

    @Override
    public boolean deletePost(int id) throws SQLException {
        return false;
    }

    @Override
    public boolean updatePost(Post post) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_POSTS_SQL);) {
            statement.setString(1, post.getTitle());
            statement.setString(2, post.getContent());
            statement.setString(3, post.getShortdescription());
            statement.setString(4, post.getImg());
            statement.setInt(5, post.getId());

            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

}
