package data.dto;

public class UserDto {
    private String userID;
    private String userPW;
    private String name;
    private String email;
    private String ph;

    @Override
    public String toString() {
        return "UserDto{" +
               "userID='" + userID + '\'' +
               ", userPW='" + userPW + '\'' +
               ", name='" + name + '\'' +
               ", email='" + email + '\'' +
               ", ph='" + ph + '\'' +
               '}';
    }

    public String getUserID() {
        return userID;
    }


    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getUserPW() {
        return userPW;
    }

    public void setUserPW(String userPW) {
        this.userPW = userPW;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }


    public String getPh() {
        return ph;
    }

    public void setPh(String ph) {
        this.ph = ph;
    }

}
