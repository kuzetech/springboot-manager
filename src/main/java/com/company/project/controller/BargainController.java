package com.company.project.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.company.project.entity.WalletEntity;
import com.company.project.service.HttpSessionService;
import com.company.project.service.WalletService;
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

import com.company.project.entity.BargainEntity;
import com.company.project.service.BargainService;

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
public class BargainController {

    @Resource
    private BargainService bargainService;

    @Resource
    private WalletService walletService;

    @Resource
    private HttpSessionService httpSessionService;


    /**
    * 跳转到页面
    */
    @GetMapping("/index/bargain")
    public String bargain() {
        return "bargain/list";
        }

    @ApiOperation(value = "新增")
    @PostMapping("bargain/add")
    @RequiresPermissions("bargain:add")
    @ResponseBody
    public DataResult add(@RequestBody BargainEntity bargain){
        String currentUserId = httpSessionService.getCurrentUserId();
        bargain.setUserId(currentUserId);
        bargain.setStatus(1);
        bargainService.save(bargain);
        return DataResult.success();
    }

    @ApiOperation(value = "删除")
    @DeleteMapping("bargain/delete")
    @RequiresPermissions("bargain:delete")
    @ResponseBody
    public DataResult delete(@RequestBody @ApiParam(value = "id集合") List<String> ids){
        bargainService.removeByIds(ids);
        return DataResult.success();
    }

    @ApiOperation(value = "取消")
    @PutMapping("bargain/cancel")
    @ResponseBody
    public DataResult cancel(@RequestBody @ApiParam(value = "id集合") List<String> ids){
        BargainEntity entity = bargainService.getById(ids.get(0));
        entity.setStatus(0);
        bargainService.updateById(entity);
        return DataResult.success();
    }

    @ApiOperation(value = "通过")
    @PutMapping("bargain/pass")
    @ResponseBody
    public DataResult pass(@RequestBody BargainEntity bargain){
        BargainEntity entity = bargainService.getById(bargain.getId());
        entity.setComment(bargain.getComment());
        entity.setStatus(2);
        bargainService.updateById(entity);
        return DataResult.success();
    }

    @ApiOperation(value = "拒绝")
    @PutMapping("bargain/reject")
    @ResponseBody
    public DataResult reject(@RequestBody BargainEntity bargain){
        BargainEntity entity = bargainService.getById(bargain.getId());
        entity.setComment(bargain.getComment());
        entity.setStatus(3);
        bargainService.updateById(entity);
        return DataResult.success();
    }

    @ApiOperation(value = "完成")
    @PutMapping("bargain/finish")
    @ResponseBody
    public DataResult finish(@RequestBody @ApiParam(value = "id") String id){
        BargainEntity bargain = bargainService.getById(id);
        bargain.setStatus(4);
        bargainService.updateById(bargain);
        WalletEntity wallet = walletService.getByUserId(bargain.getUserId());
        if(bargain.getType() == 1){
            wallet.setMoney(wallet.getMoney().add(bargain.getMoney()));
        }else{
            wallet.setMoney(wallet.getMoney().subtract(bargain.getMoney()));
        }
        walletService.updateById(wallet);
        return DataResult.success();
    }

    @ApiOperation(value = "更新")
    @PutMapping("bargain/update")
    @RequiresPermissions("bargain:update")
    @ResponseBody
    public DataResult update(@RequestBody BargainEntity bargain){
        bargainService.updateById(bargain);
        return DataResult.success();
    }

    @ApiOperation(value = "查询分页数据")
    @PostMapping("bargain/listByPage")
    @RequiresPermissions("bargain:list")
    @ResponseBody
    public DataResult findListByPage(@RequestBody BargainEntity bargain){
        Page page = new Page(bargain.getPage(), bargain.getLimit());
        LambdaQueryWrapper<BargainEntity> queryWrapper = Wrappers.lambdaQuery();
        //查询条件示例
        //queryWrapper.eq(BargainEntity::getId, bargain.getId());
        IPage<BargainEntity> iPage = bargainService.page(page, queryWrapper);
        return DataResult.success(iPage);
    }

}
