package com.myforms.racf.dao;

import com.myforms.racf.AccessType;
import com.myforms.racf.Racf;

public interface RacfDao {
	public AccessType getAccessTypeByName(String accesType);
	public void saveRacf(Racf racf);
}
