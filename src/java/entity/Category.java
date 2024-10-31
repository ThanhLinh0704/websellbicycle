package entity;

public class Category {

    private int cid;
    private String cname;
    private String url;

    public Category() {
    }

    public Category(int cid, String cname, String url) {
        this.cid = cid;
        this.cname = cname;
        this.url = url;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    @Override
    public String toString() {
        return "Category{" + "cid=" + cid + ", cname=" + cname + ", url=" + url + '}';
    }

}
