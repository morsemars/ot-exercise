package com.ideyatech.ot.tutorial.service.impl;

import org.opentides.service.impl.BaseCrudServiceImpl;
import org.springframework.stereotype.Service;

import com.ideyatech.ot.tutorial.entity.DailyTimeRecord;
import com.ideyatech.ot.tutorial.entity.Timesheet;
import com.ideyatech.ot.tutorial.service.DailyTimeRecordService;
import com.ideyatech.ot.tutorial.service.TimesheetService;

@Service("dailyTimeRecordService")
public class DailyTimeRecordServiceImpl extends BaseCrudServiceImpl<DailyTimeRecord> implements DailyTimeRecordService{

	@Override
	public int computeTotalHours() {
		int totalHours;
		int firstTimeIn = 0;// get first time in for the cut-off
		int lastTimeOut = 0;// get last time out for the cut-off
		
		totalHours = lastTimeOut - firstTimeIn;
		
		return totalHours;
	}
	
}
