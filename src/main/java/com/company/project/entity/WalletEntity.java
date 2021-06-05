package com.company.project.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.TableField;
import com.company.project.vo.req.PageReqVO;


import java.math.BigDecimal;
import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 系统用户角色
 *
 * @author hsw
 * @email 370415788@mail.com
 * @date 2021-05-15 22:16:23
 */
@Data
@TableName("wallet")
public class WalletEntity extends PageReqVO implements Serializable {
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
	 * 账户余额
	 */
	@TableField("money")
	private BigDecimal money;

	/**
	 * 创建时间
	 */
	@TableField("create_time")
	private Date createTime;


}
