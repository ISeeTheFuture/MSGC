package com.kh.msg.res.model.dao;

import java.util.List;

import com.kh.msg.res.model.vo.Car;
import com.kh.msg.res.model.vo.CarReservation;
import com.kh.msg.res.model.vo.ConfReservation;
import com.kh.msg.res.model.vo.ConferenceRoom;
import com.kh.msg.res.model.vo.ResView;
import com.kh.msg.res.model.vo.Reservation;

public interface ResDAO {

	int confInsert(ConfReservation cr);

	List<ConferenceRoom> selectConfList();

	List<Car> selectCarList();

	int carInsert(CarReservation cr);

	List<ResView> selectAllMyConfResList();
	
	List<ResView> selectAllMyCarResList();

}
