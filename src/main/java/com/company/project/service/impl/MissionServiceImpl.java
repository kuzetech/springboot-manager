package com.company.project.service.impl;

import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import com.company.project.mapper.MissionMapper;
import com.company.project.entity.MissionEntity;
import com.company.project.service.MissionService;


@Service("missionService")
public class MissionServiceImpl extends ServiceImpl<MissionMapper, MissionEntity> implements MissionService {


}