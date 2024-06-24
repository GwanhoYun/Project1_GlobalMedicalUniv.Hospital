package org.hj.model;

public class logins {
    private String id;
    private String password;
    private String name;
    private String userName; // 이 필드는 setUsername과 getUsername 메서드를 사용하여 userName으로 호출해야 합니다.
    private String addr;
    private String age;
    private int admin_boolean;
    private String guardian_name;
    private String guardian_age;
    private String employee_Dept; // 직원 부서
    private String gender;
    private String rrn;


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

    public String getUsername() {
        return userName; // getUsername을 사용하여 userName을 반환하도록 수정
    }

    public void setUsername(String userName) {
        this.userName = userName; // setUsername을 사용하여 userName을 설정하도록 수정
    }

    @Override
	public String toString() {
		return "logins [id=" + id + ", password=" + password + ", name=" + name + ", userName=" + userName + ", addr="
				+ addr + ", age=" + age + ", admin_boolean=" + admin_boolean + ", guardian_name=" + guardian_name
				+ ", guardian_age=" + guardian_age + ", employee_Dept=" + employee_Dept + ", gender=" + gender
				+ ", rrn=" + rrn + "]";
	}
    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public int getAdmin_boolean() {
        return admin_boolean;
    }

    public void setAdmin_boolean(int admin_boolean) {
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

    public String getEmployee_Dept() {
        return employee_Dept;
    }

    public void setEmployee_Dept(String employee_Dept) {
        this.employee_Dept = employee_Dept;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getRrn() {
        return rrn;
    }

    public void setRrn(String rrn) {
        this.rrn = rrn;
    }
    
    
}
