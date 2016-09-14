package com.ideyatech.ot.tutorial.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.opentides.bean.BaseEntity;
import org.opentides.web.json.Views;

import com.fasterxml.jackson.annotation.JsonView;

@Entity
@Table(name = "EMPLOYEE")
public class Employee extends BaseEntity{
	
	
	@JsonView(Views.SearchView.class)
	@Column(name="FIRST_NAME")
	private String firstName;
	
	@JsonView(Views.SearchView.class)
	@Column(name="MIDDLE_NAME")
	private String middleName;
	
	@JsonView(Views.SearchView.class)
	@Column(name="LAST_NAME")
	private String lastName;
	
	@JsonView(Views.SearchView.class)
	@Column(name="BIRTH_DATE")
	@Temporal(TemporalType.DATE)
	private Date birthDate;
	
	@JsonView(Views.SearchView.class)
	@Column(name="EMAIL_ADDRESS", unique=true)
	private String email;
	
	@Transient
	private Date startDate;
	
	@Transient
	private Date endDate;
	
	public String getFullName() {
		return lastName + ", " + firstName;
	}

	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getMiddleName() {
		return middleName;
	}
	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public Date getBirthDate() {
		return birthDate;
	}
	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
}
