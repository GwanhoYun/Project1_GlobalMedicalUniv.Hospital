package org.hj.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import java.sql.Timestamp;

public class MediboardVO {

	// 차트 번호
	private int chart_number;
	// 환자 이름
	private String name;
	// 생년월일
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date date_of_birth;
	// 나이
	private int age;
	// 성별
	private String gender;
	// 진단명 (병명)
	private String diagnosis;
	// 작성일(get 메서드만 있음)
	private Timestamp created_date;
	// 입원일 (내원일)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date admission_date;
	// 퇴원일
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date discharge_date;
	// 상태 및 소견
	private String condition_and_opinion;
	// 진료과 + 의사명
	private String department_doctor;

	public int getChart_number() {
		return chart_number;
	}
	
    public void setChart_number(int chart_number) {
        this.chart_number = chart_number;
    }

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getDate_of_birth() {
		return date_of_birth;
	}

	public void setDate_of_birth(Date date_of_birth) {
		this.date_of_birth = date_of_birth;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getDiagnosis() {
		return diagnosis;
	}

	public void setDiagnosis(String diagnosis) {
		this.diagnosis = diagnosis;
	}


	public Timestamp getCreated_date() {
		return created_date;
	}

	public void setCreate_date(Timestamp create_date) {
		this.created_date = create_date;
	}

	public Date getAdmission_date() {
		return admission_date;
	}

	public void setAdmission_date(Date admission_date) {
		this.admission_date = admission_date;
	}

	public Date getDischarge_date() {
		return discharge_date;
	}

	public void setDischarge_date(Date discharge_date) {
		this.discharge_date = discharge_date;
	}

	public String getCondition_and_opinion() {
		return condition_and_opinion;
	}

	public void setCondition_and_opinion(String condition_and_opinion) {
		this.condition_and_opinion = condition_and_opinion;
	}

	public String getDepartment_doctor() {
		return department_doctor;
	}

	public void setDepartment_doctor(String department_doctor) {
		this.department_doctor = department_doctor;
	}

	@Override
	public String toString() {
		return "MediboardVO [chart_Number=" + chart_number + ", name=" + name + ", date_of_birth=" + date_of_birth
				+ ", age=" + age + ", gender=" + gender + ", diagnosis=" + diagnosis + ", create_date=" + created_date
				+ ", admission_date=" + admission_date + ", discharge_date=" + discharge_date
				+ ", condition_and_opinion=" + condition_and_opinion + ", department_doctor=" + department_doctor + "]";
	}



}
