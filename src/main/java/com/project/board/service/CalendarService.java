package com.project.board.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.project.board.model.CalendarVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.project.board.dao.ICalendarDAO;

@Service
public class CalendarService implements ICalendarService{
    @Autowired
    @Qualifier("ICalendarDAO")
    ICalendarDAO dao;


    @Override
    public List<Map<String, Object>> calenList() {
        return dao.calenList();
    }

    @Override
    public ArrayList<CalendarVO> getAllPlan() {
        return dao.getAllPlan();
    }

    @Override
    public CalendarVO detailPlan(int calNo) {
        return dao.detailPlan(calNo);
    }

    @Override
    public void insertSchedule(CalendarVO calendarVO) {
        dao.insertSchedule(calendarVO);
    }

    @Override
    public void updateSchedule(CalendarVO calendarVO) {
        dao.updateSchedule(calendarVO);
    }
}
