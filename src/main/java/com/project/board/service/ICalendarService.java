package com.project.board.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.project.board.model.CalendarVO;

@Service
public interface ICalendarService {
    public List<Map<String, Object>> calenList();

    ArrayList<CalendarVO> getAllPlan();

    CalendarVO detailPlan(int calNo);

    void insertSchedule(CalendarVO calendarVO);

    void updateSchedule(CalendarVO calendarVO);
}
