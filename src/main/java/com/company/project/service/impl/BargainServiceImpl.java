package com.company.project.service.impl;

import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import com.company.project.mapper.BargainMapper;
import com.company.project.entity.BargainEntity;
import com.company.project.service.BargainService;


@Service("bargainService")
public class BargainServiceImpl extends ServiceImpl<BargainMapper, BargainEntity> implements BargainService {


}