package com.ideyatech.ot.tutorial.dao;

import java.util.List;

import org.opentides.dao.BaseEntityDao;

import com.ideyatech.ot.tutorial.entity.DailyTimeRecord;
import com.ideyatech.ot.tutorial.entity.Employee;
import com.ideyatech.ot.tutorial.entity.Timesheet;

public interface DailyTimeRecordDao extends BaseEntityDao<DailyTimeRecord, Long>{
	 List<DailyTimeRecord> findEmployeeDailyTimeRecord(Employee emp, Timesheet ts);
}
