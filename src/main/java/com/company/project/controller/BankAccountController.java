package com.company.project.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.company.project.entity.SysRole;
import com.company.project.service.HttpSessionService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.stereotype.Controller;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.metadata.IPage;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import java.util.List;
import com.company.project.common.utils.DataResult;

import com.company.project.entity.BankAccountEntity;
import com.company.project.service.BankAccountService;

import javax.annotation.Resource;


/**
 * 系统用户角色
 *
 * @author wenbin
 * @email *****@mail.com
 * @date 2021-05-12 23:39:34
 */
@Controller
@RequestMapping("/")
public class BankAccountController {

    @Resource
    private BankAccountService bankAccountService;

    @Resource
    private HttpSessionService httpSessionService;

    /**
    * 跳转到页面
    */
    @GetMapping("index/bankAccount")
    public String bankAccount() {
        return "bankaccount/list";
        }

    @ApiOperation(value = "新增")
    @PostMapping("bankAccount/add")
    @RequiresPermissions("bankAccount:add")
    @ResponseBody
    public DataResult add(@RequestBody BankAccountEntity bankAccount){
        String currentUserId = httpSessionService.getCurrentUserId();
        bankAccount.setUserId(currentUserId);
        bankAccountService.save(bankAccount);
        return DataResult.success();
    }

    @ApiOperation(value = "删除")
    @DeleteMapping("bankAccount/delete")
    @RequiresPermissions("bankAccount:delete")
    @ResponseBody
    public DataResult delete(@RequestBody @ApiParam(value = "id集合") List<String> ids){
        bankAccountService.removeByIds(ids);
        return DataResult.success();
    }

    @ApiOperation(value = "更新")
    @PutMapping("bankAccount/update")
    @RequiresPermissions("bankAccount:update")
    @ResponseBody
    public DataResult update(@RequestBody BankAccountEntity bankAccount){
        bankAccountService.updateById(bankAccount);
        return DataResult.success();
    }

    @ApiOperation(value = "查询分页数据")
    @PostMapping("bankAccount/listByPage")
    @RequiresPermissions("bankAccount:list")
    @ResponseBody
    public DataResult findListByPage(@RequestBody BankAccountEntity bankAccount){
        Page page = new Page(bankAccount.getPage(), bankAccount.getLimit());
        LambdaQueryWrapper<BankAccountEntity> queryWrapper = Wrappers.lambdaQuery();
        if (!StringUtils.isEmpty(bankAccount.getAccount())) {
            queryWrapper.like(BankAccountEntity::getAccount, bankAccount.getAccount());
        }
        IPage<BankAccountEntity> iPage = bankAccountService.page(page, queryWrapper);
        return DataResult.success(iPage);
    }

}
