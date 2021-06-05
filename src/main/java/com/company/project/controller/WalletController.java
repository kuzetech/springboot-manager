package com.company.project.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.company.project.service.HttpSessionService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.stereotype.Controller;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.metadata.IPage;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import java.util.List;
import com.company.project.common.utils.DataResult;

import com.company.project.entity.WalletEntity;
import com.company.project.service.WalletService;

import javax.annotation.Resource;


/**
 * 系统用户角色
 *
 * @author hsw
 * @email 370415788@mail.com
 * @date 2021-05-15 22:16:23
 */
@Controller
@RequestMapping("/")
public class WalletController {

    @Resource
    private WalletService walletService;

    @Resource
    private HttpSessionService httpSessionService;

    /**
    * 跳转到页面
    */
    @GetMapping("/index/wallet")
    public String wallet() {
        return "wallet/list";
        }

    @ApiOperation(value = "新增")
    @PostMapping("wallet/add")
    @RequiresPermissions("wallet:add")
    @ResponseBody
    public DataResult add(@RequestBody WalletEntity wallet){
        walletService.save(wallet);
        return DataResult.success();
    }

    @ApiOperation(value = "删除")
    @DeleteMapping("wallet/delete")
    @RequiresPermissions("wallet:delete")
    @ResponseBody
    public DataResult delete(@RequestBody @ApiParam(value = "id集合") List<String> ids){
        walletService.removeByIds(ids);
        return DataResult.success();
    }

    @ApiOperation(value = "更新")
    @PutMapping("wallet/update")
    @RequiresPermissions("wallet:update")
    @ResponseBody
    public DataResult update(@RequestBody WalletEntity wallet){
        walletService.updateById(wallet);
        return DataResult.success();
    }

    @ApiOperation(value = "获取当前用户余额")
    @GetMapping("wallet/current/money")
    @ResponseBody
    public DataResult getCurrentMoney(){
        String currentUserId = httpSessionService.getCurrentUserId();
        WalletEntity wallet = walletService.getByUserId(currentUserId);
        return DataResult.success(wallet.getMoney());
    }

    @ApiOperation(value = "查询分页数据")
    @PostMapping("wallet/listByPage")
    @RequiresPermissions("wallet:list")
    @ResponseBody
    public DataResult findListByPage(@RequestBody WalletEntity wallet){
        Page page = new Page(wallet.getPage(), wallet.getLimit());
        LambdaQueryWrapper<WalletEntity> queryWrapper = Wrappers.lambdaQuery();
        //查询条件示例
        //queryWrapper.eq(WalletEntity::getId, wallet.getId());
        IPage<WalletEntity> iPage = walletService.page(page, queryWrapper);
        return DataResult.success(iPage);
    }

}
