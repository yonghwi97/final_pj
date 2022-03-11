package com.project.board.dao;

import com.project.board.model.CalendarVO;
import com.project.board.model.HallVO;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

public interface ICalendarDAO {
    public List<Map<String, Object>> calenList();

    // 전체 일정 조회
    ArrayList<CalendarVO> getAllPlan();

    CalendarVO detailPlan(int calNo);

    // 일정 추가
    void insertSchedule(CalendarVO calendarVO);

    // 일정 수정
    void updateSchedule(CalendarVO calendarVO);

    // 일정 삭제

}
