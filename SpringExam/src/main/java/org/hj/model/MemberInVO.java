package org.hj.model;

public class MemberInVO {
  public String id;
  public String password;
  public String name;
  public String addr;
  public String email;
  public String phone;
  public String age;
  
  
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
  public String getAddr() {
    return addr;
  }
  public void setAddr(String addr) {
    this.addr = addr;
  }
  public String getEmail() {
    return email;
  }
  public void setEmail(String email) {
    this.email = email;
  }
  public String getPhone() {
    return phone;
  }
  public void setPhone(String phone) {
    this.phone = phone;
  }
  public String getAge() {
    return age;
  }
  public void setAge(String age) {
    this.age = age;
  }
  @Override
  public String toString() {
    return "memberInVO [id=" + id + ", password=" + password + ", name=" + name + ", addr=" + addr + ", email=" + email
        + ", phone=" + phone + ", age=" + age + "]";
  }
  

}
