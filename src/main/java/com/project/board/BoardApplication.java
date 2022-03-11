package com.project.board;


import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

import com.project.board.controller.ActorController;
import com.project.board.controller.BoardController;
import com.project.board.controller.BoardController2;
import com.project.board.controller.BoardController3;
import com.project.board.controller.BoardController4;
import com.project.board.controller.IndexController;
import com.project.board.controller.TicketbookController;
import com.project.board.controller.detailPageController;
import com.project.board.dao.IActorDAO;
import com.project.board.dao.IBoardDAO;
import com.project.board.dao.IBoardDAO2;
import com.project.board.dao.IBoardDAO3;
import com.project.board.dao.IBoardDAO4;
import com.project.board.dao.ICalendarDAO;
import com.project.board.dao.IMediaDAO;
import com.project.board.dao.IMusicalDAO;
import com.project.board.dao.ITicketbookDAO;


@ComponentScan(basePackageClasses = BoardController.class)
@ComponentScan(basePackageClasses = BoardController2.class)
@ComponentScan(basePackageClasses = BoardController3.class)
@ComponentScan(basePackageClasses = BoardController4.class)
@ComponentScan(basePackageClasses = IndexController.class)

@ComponentScan(basePackageClasses = detailPageController.class)
@ComponentScan(basePackageClasses = ActorController.class)
@ComponentScan(basePackageClasses = TicketbookController.class)


@SpringBootApplication

@MapperScan(basePackageClasses = IBoardDAO.class)

@MapperScan(basePackageClasses = IMusicalDAO.class)
@MapperScan(basePackageClasses = ICalendarDAO.class)

@MapperScan(basePackageClasses = IBoardDAO2.class)
@MapperScan(basePackageClasses = IBoardDAO3.class)
@MapperScan(basePackageClasses = IBoardDAO4.class)
@MapperScan(basePackageClasses = ITicketbookDAO.class)
@MapperScan(basePackageClasses = IActorDAO.class)

@ComponentScan(basePackages = "com.project.board")


@MapperScan(basePackages = "com.project.board")
@MapperScan(basePackageClasses = IMediaDAO.class)
public class BoardApplication {

	public static void main(String[] args) {
		SpringApplication.run(BoardApplication.class, args);
	}

}
