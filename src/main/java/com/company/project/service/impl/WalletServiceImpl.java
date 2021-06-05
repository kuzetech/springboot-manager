package com.company.project.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.company.project.entity.SysUser;
import com.company.project.mapper.SysUserMapper;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import com.company.project.mapper.WalletMapper;
import com.company.project.entity.WalletEntity;
import com.company.project.service.WalletService;

import javax.annotation.Resource;


@Service("walletService")
public class WalletServiceImpl extends ServiceImpl<WalletMapper, WalletEntity> implements WalletService {

    @Resource
    private WalletMapper walletMapper;

    @Override
    public WalletEntity getByUserId(String userId) {
        LambdaQueryWrapper<WalletEntity> wrapper = Wrappers.<WalletEntity>lambdaQuery().eq(WalletEntity::getUserId, userId);
        return walletMapper.selectOne(wrapper);
    }
}