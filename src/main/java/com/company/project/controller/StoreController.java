package com.company.project.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.company.project.entity.BankAccountEntity;
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

import com.company.project.entity.StoreEntity;
import com.company.project.service.StoreService;

import javax.annotation.Resource;


/**
 * 系统用户角色
 *
 * @author hsw
 * @email 370415788@mail.com
 * @date 2021-05-15 16:08:26
 */
@Controller
@RequestMapping("/")
public class StoreController {

    @Resource
    private StoreService storeService;

    @Resource
    private HttpSessionService httpSessionService;

    /**
    * 跳转到页面
    */
    @GetMapping("/index/store")
    public String store() {
        return "store/list";
        }

    @ApiOperation(value = "新增")
    @PostMapping("store/add")
    @RequiresPermissions("store:add")
    @ResponseBody
    public DataResult add(@RequestBody StoreEntity store){
        String currentUserId = httpSessionService.getCurrentUserId();
        store.setUserId(currentUserId);
        storeService.save(store);
        return DataResult.success();
    }

    @ApiOperation(value = "删除")
    @DeleteMapping("store/delete")
    @RequiresPermissions("store:delete")
    @ResponseBody
    public DataResult delete(@RequestBody @ApiParam(value = "id集合") List<String> ids){
        storeService.removeByIds(ids);
        return DataResult.success();
    }

    @ApiOperation(value = "更新")
    @PutMapping("store/update")
    @RequiresPermissions("store:update")
    @ResponseBody
    public DataResult update(@RequestBody StoreEntity store){
        storeService.updateById(store);
        return DataResult.success();
    }

    @ApiOperation(value = "查询分页数据")
    @PostMapping("store/listByPage")
    @RequiresPermissions("store:list")
    @ResponseBody
    public DataResult findListByPage(@RequestBody StoreEntity store){
        Page page = new Page(store.getPage(), store.getLimit());
        LambdaQueryWrapper<StoreEntity> queryWrapper = Wrappers.lambdaQuery();
        if (!StringUtils.isEmpty(store.getName())) {
            queryWrapper.like(StoreEntity::getName, store.getName());
        }
        IPage<StoreEntity> iPage = storeService.page(page, queryWrapper);
        return DataResult.success(iPage);
    }

}
