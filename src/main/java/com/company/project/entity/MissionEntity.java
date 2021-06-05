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
 * @date 2021-05-15 22:16:22
 */
@Data
@TableName("mission")
public class MissionEntity extends PageReqVO implements Serializable {
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
	 * 任务类型
	 */
	@TableField("type")
	private Integer type;

	/**
	 * 状态
	 */
	@TableField("status")
	private Integer status;

	/**
	 * 商家备注
	 */
	@TableField("customer_condition")
	private String customerCondition;

	/**
	 * 平台回复
	 */
	@TableField("comment")
	private String comment;

	/**
	 * 商品链接
	 */
	@TableField("product_url")
	private String productUrl;

	/**
	 * 购买数量
	 */
	@TableField("amount")
	private Integer amount;

	/**
	 * 创建时间
	 */
	@TableField("create_time")
	private Date createTime;


}
