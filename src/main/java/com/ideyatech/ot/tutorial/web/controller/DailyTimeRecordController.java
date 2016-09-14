package com.ideyatech.ot.tutorial.web.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.opentides.web.controller.BaseCrudController;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ideyatech.ot.tutorial.entity.DailyTimeRecord;
import com.ideyatech.ot.tutorial.entity.Timesheet;

@Controller
@RequestMapping("/dailytimerecord")
public class DailyTimeRecordController extends BaseCrudController<DailyTimeRecord>{
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd'T'HH:mm"), true));
	}
	
	@RequestMapping(value = "/findByTimesheetId/{timesheetId}", produces = "application/json")
	public @ResponseBody List<DailyTimeRecord> findByTimesheetId(@PathVariable Long timesheetId) {
		DailyTimeRecord sample = new DailyTimeRecord();
		Timesheet ts = new Timesheet();
		ts.setId(timesheetId);
		sample.setTimesheet(ts);
		return getService().findByExample(sample);
	}
}
