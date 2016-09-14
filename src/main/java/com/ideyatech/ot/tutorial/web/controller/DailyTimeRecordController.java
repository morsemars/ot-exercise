package com.ideyatech.ot.tutorial.web.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.opentides.web.controller.BaseCrudController;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ideyatech.ot.tutorial.entity.DailyTimeRecord;

@Controller
@RequestMapping("/dailytimerecord")
public class DailyTimeRecordController extends BaseCrudController<DailyTimeRecord>{
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd'T'HH:mm"), true));
	}
}
