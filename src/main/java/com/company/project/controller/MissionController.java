package com.company.project.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.company.project.entity.BargainEntity;
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

import java.math.BigDecimal;
import java.util.List;
import com.company.project.common.utils.DataResult;

import com.company.project.entity.MissionEntity;
import com.company.project.service.MissionService;

import javax.annotation.Resource;


/**
 * 系统用户角色
 *
 * @author hsw
 * @email 370415788@mail.com
 * @date 2021-05-15 22:16:22
 */
@Controller
@RequestMapping("/")
public class MissionController {

    @Resource
    private MissionService missionService;

    @Resource
    private HttpSessionService httpSessionService;

    @Resource
    private WalletService walletService;

    /**
    * 跳转到页面
    */
    @GetMapping("/index/mission")
    public String mission() {
        return "mission/list";
        }

    @ApiOperation(value = "新增")
    @PostMapping("mission/add")
    @RequiresPermissions("mission:add")
    @ResponseBody
    public DataResult add(@RequestBody MissionEntity mission){
        String currentUserId = httpSessionService.getCurrentUserId();
        mission.setUserId(currentUserId);
        mission.setStatus(1);
        missionService.save(mission);
        return DataResult.success();
    }

    @ApiOperation(value = "删除")
    @DeleteMapping("mission/delete")
    @RequiresPermissions("mission:delete")
    @ResponseBody
    public DataResult delete(@RequestBody @ApiParam(value = "id集合") List<String> ids){
        missionService.removeByIds(ids);
        return DataResult.success();
    }

    @ApiOperation(value = "取消")
    @PutMapping("mission/cancel")
    //@RequiresPermissions("mission:cancel")
    @ResponseBody
    public DataResult cancel(@RequestBody String id){
        MissionEntity mission = missionService.getById(id);
        mission.setStatus(0);
        missionService.updateById(mission);
        return DataResult.success();
    }

    @ApiOperation(value = "通过")
    @PutMapping("mission/pass")
    @ResponseBody
    public DataResult pass(@RequestBody MissionEntity missionEntity){
        MissionEntity entity = missionService.getById(missionEntity.getId());
        entity.setComment(missionEntity.getComment());
        entity.setStatus(2);
        missionService.updateById(entity);
        return DataResult.success();
    }

    @ApiOperation(value = "拒绝")
    @PutMapping("mission/reject")
    @ResponseBody
    public DataResult reject(@RequestBody MissionEntity missionEntity){
        MissionEntity entity = missionService.getById(missionEntity.getId());
        entity.setComment(missionEntity.getComment());
        entity.setStatus(3);
        missionService.updateById(entity);
        return DataResult.success();
    }

    @ApiOperation(value = "完成")
    @PutMapping("mission/finish")
    @ResponseBody
    public DataResult finish(@RequestBody @ApiParam(value = "id") String id){
        MissionEntity entity = missionService.getById(id);
        entity.setStatus(4);
        missionService.updateById(entity);
        WalletEntity wallet = walletService.getByUserId(entity.getUserId());
        if(entity.getType() == 1){
            BigDecimal price = BigDecimal.valueOf(entity.getAmount() * 5);
            wallet.setMoney(wallet.getMoney().subtract(price));
        }else if(entity.getType() == 2){
            BigDecimal price = BigDecimal.valueOf(entity.getAmount() * 10);
            wallet.setMoney(wallet.getMoney().subtract(price));
        }else{
            BigDecimal price = BigDecimal.valueOf(entity.getAmount() * 15);
            wallet.setMoney(wallet.getMoney().subtract(price));
        }
        walletService.updateById(wallet);
        return DataResult.success();
    }

    @ApiOperation(value = "更新")
    @PutMapping("mission/update")
    @RequiresPermissions("mission:update")
    @ResponseBody
    public DataResult update(@RequestBody MissionEntity mission){
        missionService.updateById(mission);
        return DataResult.success();
    }

    @ApiOperation(value = "查询分页数据")
    @PostMapping("mission/listByPage")
    @RequiresPermissions("mission:list")
    @ResponseBody
    public DataResult findListByPage(@RequestBody MissionEntity mission){
        Page page = new Page(mission.getPage(), mission.getLimit());
        LambdaQueryWrapper<MissionEntity> queryWrapper = Wrappers.lambdaQuery();
        //查询条件示例
        //queryWrapper.eq(MissionEntity::getId, mission.getId());
        IPage<MissionEntity> iPage = missionService.page(page, queryWrapper);
        return DataResult.success(iPage);
    }

}
