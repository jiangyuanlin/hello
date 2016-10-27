package com.idp.web.system.dao;

import com.idp.common.base.BaseDao;
import com.idp.web.system.entity.SysUser;

public interface SysUserDao extends BaseDao<SysUser, Long> {

	public SysUser findByUsername(String username);
}
