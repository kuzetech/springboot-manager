package com.company.project.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.TableField;
import com.company.project.vo.req.PageReqVO;


import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 系统用户角色
 *
 * @author hsw
 * @email 370415788@mail.com
 * @date 2021-05-15 16:08:26
 */
@Data
@TableName("store")
public class StoreEntity extends PageReqVO implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * id
	 */
	@TableId("id")
	private String id;

	/**
	 * 用户id
	 */
	@TableField("user_id")
	private String userId;

	/**
	 * 店铺名
	 */
	@TableField("name")
	private String name;

	/**
	 * 店铺类型
	 */
	@TableField("type")
	private Integer type;

	/**
	 * 是否支持七天无理由退换货
	 */
	@TableField("seven_day_exchange")
	private Integer sevenDayExchange;

	/**
	 * 创建时间
	 */
	@TableField("create_time")
	private Date createTime;


}
