package com.ideyatech.ot.tutorial.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.opentides.bean.BaseEntity;
import org.opentides.web.json.Views;

import com.fasterxml.jackson.annotation.JsonView;

@Entity
@Table(name="TIMESHEET")
public class Timesheet extends BaseEntity{
	
	@JsonView(Views.SearchView.class)
	@Column(name="START_CUT_OFF")
	@Temporal(TemporalType.DATE)
	private Date startCutOff;
	
	@JsonView(Views.SearchView.class)
	@Column(name="END_CUT_OFF")
	@Temporal(TemporalType.DATE)
	private Date endCutOff;
	
	@JsonView(Views.SearchView.class)
	@ManyToOne
	@JoinColumn(name="EMP_ID")
	private Employee employee;
	
	@Transient
	private String cutoff;
	
	public String getCutoff() {
		return startCutOff.toString() +" to " + endCutOff.toString();
	}

	public Date getStartCutOff() {
		return startCutOff;
	}

	public void setStartCutOff(Date startCutOff) {
		this.startCutOff = startCutOff;
	}

	public Date getEndCutOff() {
		return endCutOff;
	}

	public void setEndCutOff(Date endCutOff) {
		this.endCutOff = endCutOff;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	
}
