package com.ideyatech.ot.tutorial.dao.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.opentides.dao.impl.BaseEntityDaoJpaImpl;
import org.springframework.stereotype.Repository;

import com.ideyatech.ot.tutorial.dao.EmployeeDao;
import com.ideyatech.ot.tutorial.dao.SkillDao;
import com.ideyatech.ot.tutorial.entity.Employee;
import com.ideyatech.ot.tutorial.entity.Skill;

@Repository(value="skillDao")
public class SkillDaoJpaImpl extends BaseEntityDaoJpaImpl<Skill, Long> implements SkillDao{

}
