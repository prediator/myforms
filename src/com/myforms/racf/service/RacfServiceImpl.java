package com.myforms.racf.service;

import com.myforms.racf.AccessType;
import com.myforms.racf.Racf;
import com.myforms.racf.dao.RacfDao;

public class RacfServiceImpl implements RacfService{
	private RacfDao racfDao;
	public AccessType getAccessTypeByName(String accesType){
		return racfDao.getAccessTypeByName(accesType);
	}
	public RacfDao getRacfDao() {
		return racfDao;
	}
	public void setRacfDao(RacfDao racfDao) {
		this.racfDao = racfDao;
	}
	public void saveRacf(Racf racf) {
		racfDao.saveRacf(racf);
	}
	
}
