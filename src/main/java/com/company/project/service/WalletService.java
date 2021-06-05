package com.company.project.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.company.project.entity.SysUser;
import com.company.project.entity.WalletEntity;

/**
 * 系统用户角色
 *
 * @author hsw
 * @email 370415788@mail.com
 * @date 2021-05-15 22:16:23
 */
public interface WalletService extends IService<WalletEntity> {

    WalletEntity getByUserId(String userId);

}

