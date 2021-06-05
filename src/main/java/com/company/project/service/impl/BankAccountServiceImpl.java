package com.company.project.service.impl;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import com.company.project.mapper.BankAccountMapper;
import com.company.project.entity.BankAccountEntity;
import com.company.project.service.BankAccountService;


@Service
@Slf4j
public class BankAccountServiceImpl extends ServiceImpl<BankAccountMapper, BankAccountEntity> implements BankAccountService {


}