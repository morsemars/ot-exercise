package com.ideyatech.ot.tutorial.web.controller;

import java.util.List;

import org.opentides.web.controller.BaseCrudController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ideyatech.ot.tutorial.entity.Employee;
import com.ideyatech.ot.tutorial.entity.Skill;
import com.ideyatech.ot.tutorial.entity.Timesheet;
import com.ideyatech.ot.tutorial.service.EmployeeService;

@Controller
@RequestMapping("/timesheet")
public class TimesheetController extends BaseCrudController<Timesheet>{
	
	@Autowired
	private EmployeeService employeeService;
	
	@ModelAttribute(value="employees")
	public List<Employee> getEmployees(){
		return employeeService.findAll();
	}
	
	@RequestMapping(value = "/findByEmployeeId/{employeeId}", produces = "application/json")
	public @ResponseBody List<Timesheet> findTimesheetByEmployeeId(@PathVariable Long employeeId) {
		Timesheet sample = new Timesheet();
		Employee e = new Employee();
		e.setId(employeeId);
		sample.setEmployee(e);
		return getService().findByExample(sample);
	}
}
