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


@Entity
@Table(name="DAILY_TIME_RECORD")
public class DailyTimeRecord extends BaseEntity{
	
	@Column(name="TIME_IN")
	@Temporal(TemporalType.TIMESTAMP)
	private Date timeIn;
	
	@Column(name="TIME_OUT")
	@Temporal(TemporalType.TIMESTAMP)
	private Date timeOut;
	
	@Transient
	private int ot;
	
	@ManyToOne
	@JoinColumn(name="CUT_OFF_ID")
	private Timesheet timesheet;

	public Date getTimeIn() {
		return timeIn;
	}

	public void setTimeIn(Date timeIn) {
		this.timeIn = timeIn;
	}

	public Date getTimeOut() {
		return timeOut;
	}

	public void setTimeOut(Date timeOut) {
		this.timeOut = timeOut;
	}

	public int getOt() {
		return ot;
	}

	public void setOt(int ot) {
		this.ot = ot;
	}

	public Timesheet getTimesheet() {
		return timesheet;
	}

	public void setTimesheet(Timesheet timesheet) {
		this.timesheet = timesheet;
	}
		
}
