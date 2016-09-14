package com.ideyatech.ot.tutorial.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.opentides.dao.impl.BaseEntityDaoJpaImpl;
import org.springframework.stereotype.Repository;

import com.ideyatech.ot.tutorial.dao.DailyTimeRecordDao;
import com.ideyatech.ot.tutorial.entity.DailyTimeRecord;
import com.ideyatech.ot.tutorial.entity.Employee;
import com.ideyatech.ot.tutorial.entity.Timesheet;

@Repository(value="dailyTimeRecordDao")
public class DailyTimeRecordDaoJpaImpl extends BaseEntityDaoJpaImpl<DailyTimeRecord, Long> implements DailyTimeRecordDao{

	@Override
	public List<DailyTimeRecord> findEmployeeDailyTimeRecord(Employee emp, Timesheet ts) {
		Map<String, Object> params = new HashMap<>();
		params.put("employee",  emp);
		params.put("timesheet",  ts);
		return findByNamedQuery("jpql.dailyTimeRecord.findEmployeeDailyTimeRecord", params);
	}
	
}
