package org.hj.model;

public class logins {
    private String id;
    private String password;
    private String name;
    private String email;
    private String userName; // 이 필드는 setUsername과 getUsername 메서드를 사용하여 userName으로 호출해야 합니다.

    // 생성자, getter, setter 등 필요한 메서드 추가

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
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

    public String getUsername() {
        return userName; // getUsername을 사용하여 userName을 반환하도록 수정
    }

    public void setUsername(String userName) {
        this.userName = userName; // setUsername을 사용하여 userName을 설정하도록 수정
    }

    @Override
    public String toString() {
        return "logins [id=" + id + ", password=" + password + ", name=" + name + ", email=" + email + "]";
    }
}
