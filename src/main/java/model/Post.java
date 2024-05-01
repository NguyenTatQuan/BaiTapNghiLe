package model;

public class Post {
    private int id;
    private String title;
    private String content;
    private String shortdescription;
    private String img;

    public Post() {
    }
    public Post(int id, String title, String content, String shortdescription, String img) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.shortdescription = shortdescription;
        this.img = img;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getShortdescription() {
        return shortdescription;
    }

    public void setShortdescription(String shortdescription) {
        this.shortdescription = shortdescription;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }


}
