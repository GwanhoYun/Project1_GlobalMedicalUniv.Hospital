package org.hj.model;

public class memberVO {
  private String id;
  private String password;
  private String name;
  private String addr;
  private String gender;
  private String age;
  private String admin_boolean;
  private String guardian_name;
  private String guardian_age;
  private String rrn;
  private String employee_Dept;
  
  public String getEmployee_Dept() {
    return employee_Dept;
  }
  public void setEmployee_Dept(String employee_Dept) {
    this.employee_Dept = employee_Dept;
  }
  public String getRrn() {
    return rrn;
  }
  public void setRrn(String rrn) {
    this.rrn = rrn;
  }
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
  public String getGender() {
    return gender;
  }
  public void setGender(String gender) {
    this.gender = gender;
  }
  public String getAge() {
    return age;
  }
  public void setAge(String age) {
    this.age = age;
  }

  public String getAdmin_boolean() {
    return admin_boolean;
  }
  public void setAdmin_boolean(String admin_boolean) {
    this.admin_boolean = admin_boolean;
  }
  public String getGuardian_name() {
    return guardian_name;
  }
  public void setGuardian_name(String guardian_name) {
    this.guardian_name = guardian_name;
  }
  public String getGuardian_age() {
    return guardian_age;
  }
  public void setGuardian_age(String guardian_age) {
    this.guardian_age = guardian_age;
  }
  @Override
  public String toString() {
    return "memberVO [id=" + id + ", password=" + password + ", name=" + name + ", addr=" + addr 
         + ", age=" + age + "]";
  }
}
