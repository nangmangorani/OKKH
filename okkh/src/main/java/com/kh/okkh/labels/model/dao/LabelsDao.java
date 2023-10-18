package com.kh.okkh.labels.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.okkh.labels.model.vo.Labels;

@Repository
public class LabelsDao {
	
	public ArrayList<Labels> selectLabList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("labelsMapper.selectLabList");
	}

}
