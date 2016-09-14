package com.ideyatech.ot.tutorial.service.impl;

import org.opentides.service.impl.BaseCrudServiceImpl;
import org.springframework.stereotype.Service;

import com.ideyatech.ot.tutorial.entity.Skill;
import com.ideyatech.ot.tutorial.service.SkillService;

@Service("skillService")
public class SkillServiceImpl extends BaseCrudServiceImpl<Skill> implements SkillService{

}
