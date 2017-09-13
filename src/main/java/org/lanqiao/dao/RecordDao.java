package org.lanqiao.dao;

import org.lanqiao.entity.Record;

public interface RecordDao {
    int insert(Record record);

    int insertSelective(Record record);
}