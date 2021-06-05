package com.company.project.service.impl;

import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import com.company.project.mapper.StoreMapper;
import com.company.project.entity.StoreEntity;
import com.company.project.service.StoreService;


@Service("storeService")
public class StoreServiceImpl extends ServiceImpl<StoreMapper, StoreEntity> implements StoreService {


}