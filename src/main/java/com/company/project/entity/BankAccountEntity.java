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
 * @author wenbin
 * @email *****@mail.com
 * @date 2021-05-12 23:39:34
 */
@Data
@TableName("bank_account")
public class BankAccountEntity extends PageReqVO implements Serializable {
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
	 * 开户人
	 */
	@TableField("name")
	private String name;

	/**
	 * 银行账户
	 */
	@TableField("account")
	private String account;

	/**
	 * 创建时间
	 */
	@TableField("create_time")
	private Date createTime;

	/**
	 * 银行名称
	 */
	@TableField("bank_name")
	private String bankName;

	/**
	 * 支行名称
	 */
	@TableField("sub_name")
	private String subName;


}
