package com.idp.web.generator.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.idp.common.persistence.Page;
import com.idp.web.generator.dao.CgDataSourceDao;
import com.idp.web.generator.entity.CgDataSource;
import com.idp.web.generator.service.CgDataSourceService;

@Service("CgDataSourceService")
public class CgDataSourceServiceImpl implements CgDataSourceService {

	@Resource
	private CgDataSourceDao cgDataSourceDao;
	
	@Override
	public Page<CgDataSource> findByPage(CgDataSource dataSource, Page<CgDataSource> page) {
		
		page.setResult(cgDataSourceDao.find(dataSource,page));
		
		return page;
	}
	
	@Override
	public List<CgDataSource> findBySearch(CgDataSource dataSource){
		
		return cgDataSourceDao.find(dataSource);
	}

	@Override
	public CgDataSource getById(Long id) {
		
		return cgDataSourceDao.getById(id);
	}

	@Override
	public void add(CgDataSource dataSource) throws Exception {
		
		cgDataSourceDao.add(dataSource);
	}

	@Override
	public void update(CgDataSource dataSource) throws Exception {
		
		cgDataSourceDao.update(dataSource);
	}

	@Override
	public void delete(Long id) throws Exception {
		
		cgDataSourceDao.delete(id);
	}

}
